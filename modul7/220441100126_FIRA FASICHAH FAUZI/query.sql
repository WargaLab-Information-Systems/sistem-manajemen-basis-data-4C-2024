CREATE TABLE Log_Tiket (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_tiket INT,
    id_jadwal VARCHAR(50),
    harga DECIMAL(10,2),
    jumlah_tiket INT,
    waktu TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- trigger yang mencatat setiap kali baris baru dimasukkan ke dalam tabel --
DELIMITER //
CREATE TRIGGER insert_tiket
AFTER INSERT ON tiket
FOR EACH ROW
BEGIN
    INSERT INTO Log_Tiket (id_tiket, id_jadwal, harga, jumlah_tiket)
    VALUES (NEW.id_tiket, NEW.id_jadwal, NEW.harga, NEW.jumlah_tiket);
END //

INSERT INTO tiket (id_tiket, id_jadwal, harga, jumlah_tiket) VALUES (21, 8, 150000.00, 100);
SELECT * FROM  Log_Tiket;

-- trigger yang memastikan bahwa harga yang dimasukkan tidak boleh negatif --
DELIMITER //
CREATE TRIGGER cek_harga
BEFORE INSERT ON tiket
FOR EACH ROW
BEGIN
    IF NEW.harga < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Harga yang dimasukkan tidak boleh negatif';
    END IF;
END //

INSERT INTO tiket (id_tiket, id_jadwal, harga, jumlah_tiket) VALUES (22, 4, -300000.00, 100);

-- trigger yang apabila memperbaharui satu data dari sebuah table, maka table yang lain juga diperbaharui --
ALTER TABLE jadwal_kereta ADD COLUMN update_message VARCHAR(255);

DELIMITER //
CREATE TRIGGER update_kereta
AFTER UPDATE ON kereta
FOR EACH ROW
BEGIN
    UPDATE jadwal_kereta
    SET update_message = CONCAT('Upda	te: ', NEW.nama_kereta)
    WHERE id_kereta = NEW.id_kereta;
END //

UPDATE kereta SET nama_kereta = 'Lodaya Baru' WHERE id_kereta = 2;
SELECT * FROM jadwal_kereta;

-- trigger untuk memastikan no telp yang diinputkan sesuai ketentuan --
DELIMITER //
CREATE TRIGGER cek_no_telp
BEFORE UPDATE ON penumpang
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.no_telepon) < 12 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No Telepon tidak boleh kurang dari 12 angka';
    END IF;
END //

UPDATE penumpang SET no_telepon = '0818539033' WHERE id_penumpang = 1;