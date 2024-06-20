--nomor 1--
CREATE TABLE log_produk (
    Id_log INT PRIMARY KEY AUTO_INCREMENT,
    Id_produk INT,
    Nama_produk VARCHAR(50),
    Harga_produk INT,
    Jumlah_produk INT,
    tgl_masuk DATETIME DEFAULT NOW()
);

DELIMITER//
CREATE TRIGGER log_setelah_produk
AFTER INSERT ON produk
FOR EACH ROW
BEGIN
    INSERT INTO log_produk (Id_produk, Nama_produk, Harga_produk, Jumlah_produk, Tgl_masuk)
    VALUES (NEW.Id, NEW.Nama, NEW.Harga, NEW.Jumlah_produk, NOW());
END//
DELIMITER ;

CALL tambahproduk(11, 'Soto Madura', 12000, 25);
SELECT * FROM produk;

--nomor 2--
DELIMITER //
CREATE TRIGGER cek_bayar
BEFORE INSERT ON laporan_penjualan
FOR EACH ROW
BEGIN
    IF NEW.nominal < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Nominal Pembayaran Pelanggan tidak boleh negatif / Kurang dari Total Harga';
    END IF;
END//
DELIMITER ;

CALL Tambahpenjualan(1,3, 30000);
SELECT * FROM laporan_penjualan;


--nomor 3--
DELIMITER//

CREATE TRIGGER updatetable
AFTER UPDATE ON pesanan
FOR EACH ROW
BEGIN
    UPDATE pembeli
    SET pesanan_terakhir = NEW.tanggal_pesan
    WHERE id_pembeli = NEW.id_pembeli;
END//
DELIMITER;

UPDATE pesanan
SET tanggal_pesan = '2024-07-01'
WHERE id_pesanan = 1;


--nomor 4--

DELIMITER //
CREATE TRIGGER notelp
BEFORE UPDATE ON pembeli
FOR EACH ROW
BEGIN
    DECLARE notel_baru INT;
    SET notel_baru = LENGTH(NEW.Notelp);
    IF notel_baru < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Telpon tidak valid/kurang dari 10 angka';
    END IF;
END//
DELIMITER ;



CALL updatepembeli(1, '081234567890');
SELECT * FROM pembeli WHERE Id_pembeli = 1;

DROP TRIGGER notelp;