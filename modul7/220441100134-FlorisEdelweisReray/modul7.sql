--1--
CREATE TABLE log_pemesanan (
  Log_Id INT(20) NOT NULL,
  Id_Pemesanan INT(20) NOT NULL,
  Id_Tamu INT(20) NOT NULL,
  Id_Kamar INT(20) NOT NULL,
  Id_Fasilitas INT(20) NOT NULL,
  Tanggal_Checkin DATE NOT NULL,
  Tanggal_Checkout DATE NOT NULL,
  inserted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (log_id)
);

DELIMITER //
CREATE TRIGGER pemesanan_insert
AFTER INSERT ON Pemesanan
FOR EACH ROW
BEGIN
  DECLARE new_log_id INT;

  SELECT COALESCE(MAX(log_id), 0) + 1 INTO new_log_id FROM log_pemesanan;

  INSERT INTO log_pemesanan (log_id, id_pemesanan, id_tamu, id_kamar, id_fasilitas, tanggal_checkin, tanggal_checkout)
  VALUES (new_log_id, NEW.ID_Pemesanan, NEW.ID_Tamu, NEW.ID_Kamar, NEW.ID_Fasilitas, NEW.Tanggal_Checkin, NEW.Tanggal_Checkout);
END //
DELIMITER ;

INSERT INTO Pemesanan (ID_Pemesanan, ID_Tamu, ID_Kamar, ID_Fasilitas, Tanggal_Checkin, Tanggal_Checkout) VALUES
(22, 21, 21, 21, '2024-05-22', '2024-05-25');

SELECT * FROM log_pemesanan;

--2--
DELIMITER //
CREATE TRIGGER transaksi_negatif
BEFORE INSERT ON Transaksi
FOR EACH ROW
BEGIN
    IF NEW.Total_Harga< 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nilai total harga tidak boleh negatif';
    END IF;
END//
DELIMITER ;

INSERT INTO Transaksi (ID_Pemesanan, Total_Harga, Metode_Pembayaran) VALUES (19, -1440000, 'Kartu Kredit');

--3--
DELIMITER //

CREATE TRIGGER update_data 
AFTER UPDATE ON Pemesanan
FOR EACH ROW
BEGIN
    DECLARE total_bayar INT;
    
    SELECT SUM(Total_Harga) INTO total_bayar
    FROM Transaksi
    WHERE ID_Pemesanan = NEW.ID_Pemesanan;
    
    UPDATE Transaksi
    SET Total_Harga = total_bayar
    WHERE ID_Pemesanan = NEW.ID_Pemesanan;
END//
DELIMITER ;

UPDATE Pemesanan
SET Tanggal_Checkin = '2024-05-20'
WHERE ID_Pemesanan = 1;

--4--
DELIMITER //
CREATE TRIGGER cek_notelp
BEFORE INSERT ON tamu
FOR EACH ROW
BEGIN
    DECLARE panjang_notelp INT;
    SET panjang_notelp = CHAR_LENGTH(NEW.Nomor_Telepon);
    IF panjang_notelp < 10 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No Telpon tidak boleh kurang dari 10 angka';
    END IF;
END//
DELIMITER ;

INSERT INTO tamu (ID_Tamu, Nama_Tamu, Alamat, Nomor_Telepon) VALUES (22, 'Kiara Virly', 'Jl. Tunjungan No. 45, Surabaya', '08453278');

