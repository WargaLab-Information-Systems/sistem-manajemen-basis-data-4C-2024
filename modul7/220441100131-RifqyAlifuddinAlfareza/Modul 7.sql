--soal 1--
CREATE TABLE catatInsert (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    namaTabel VARCHAR(45),
    keterangan VARCHAR(45),
    IdData INT,
    waktu TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //
CREATE TRIGGER catat_insert_pasien
AFTER INSERT ON Pasien
FOR EACH ROW
BEGIN
    INSERT INTO catatInsert (namaTabel, keterangan, IdData )
    VALUES ('Pasien', 'Pasien baru ditambahkan', NEW.pasien_id);
END //
DELIMITER ;
INSERT INTO Pasien (nama_pasien, alamat, telepon, tanggal_lahir) 
VALUES ('Donal ew', 'Jl. Pegangsaan Timur', '087402938273', '1990-01-01');
SELECT catatInsert.*, Pasien.nama_pasien AS `Nama Pasien` FROM catatInsert
JOIN Pasien ON catatInsert.IdData = Pasien.pasien_id;



--soal 2--
DELIMITER//
CREATE TRIGGER nilai_negatif
BEFORE INSERT ON obat
FOR EACH ROW
BEGIN
	IF new.harga < 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Harga tidak boleh negatif";
	END IF;
END//

INSERT INTO obat (nama_obat,jenis_obat,harga,stok) VALUES
("Panadol", "Tablet",-1200,90)

--soal 3--
DELIMITER //
CREATE TRIGGER updatePemeriksaan
AFTER UPDATE ON dokter
FOR EACH ROW
BEGIN
    UPDATE pemeriksaan
    SET nama_dokter = NEW.nama_dokter
    WHERE dokter_id = NEW.dokter_id;
END //
DELIMITER ;


--soal 4--
DELIMITER //
CREATE TRIGGER no_telp_over
BEFORE INSERT ON Pasien
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.telepon) < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No Telpon tidak boleh kurang dari 10 angka';
    END IF;
END//
DELIMITER ;
INSERT INTO Pasien (nama_pasien, alamat, telepon, tanggal_lahir)
VALUES ('Budren', 'jl sm cewe laen', '087367289', '1990-01-01');
