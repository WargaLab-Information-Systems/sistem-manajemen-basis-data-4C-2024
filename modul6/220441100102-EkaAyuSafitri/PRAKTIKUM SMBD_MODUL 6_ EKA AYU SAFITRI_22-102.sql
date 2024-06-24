CREATE DATABASE SitemKependudukanKotaSurabyaa;
USE SitemKependudukanKotaSurabyaa;

-- Tabel Master:Tabel Penduduk
CREATE TABLE Penduduk (
    id_penduduk INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    tempat_lahir VARCHAR(100),
    tanggal_lahir DATE,
    alamat TEXT,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    pekerjaan VARCHAR(100)
);

SELECT * FROM Penduduk;

-- Tabel Transaksi:Tabel Kartu Keluarga
CREATE TABLE Kartu_Keluarga (
    id_kk INT PRIMARY KEY AUTO_INCREMENT,
    nomor_kk VARCHAR(20),
    alamat TEXT,
    rt INT,
    rw INT
);

SELECT * FROM Kartu_Keluarga;

-- Relasi antara Tabel Master dan Tabel Transaksi:Tabel Hubungan Penduduk-KK
CREATE TABLE Hubungan_Penduduk_KK (
    id_hubungan INT PRIMARY KEY AUTO_INCREMENT,
    id_penduduk INT,
    id_kk INT,
    hubungan_dengan_kepala_keluarga VARCHAR(50),
    FOREIGN KEY (id_penduduk) REFERENCES Penduduk(id_penduduk),
    FOREIGN KEY (id_kk) REFERENCES Kartu_Keluarga(id_kk)
);

SELECT * FROM Hubungan_Penduduk_KK;

-- Tabel untuk Informasi Tambahan:Tabel Pendidikan
CREATE TABLE Pendidikan (
    id_pendidikan INT PRIMARY KEY AUTO_INCREMENT,
    pendidikan_terakhir VARCHAR(100)
);

SELECT * FROM Pendidikan;

-- Tabel Riwayat Pendidikan:Tabel Riwayat Pendidikan
CREATE TABLE Riwayat_Pendidikan (
    id_riwayat INT PRIMARY KEY AUTO_INCREMENT,
    id_penduduk INT,
    id_pendidikan INT,
    tahun_lulus YEAR,
    FOREIGN KEY (id_penduduk) REFERENCES Penduduk(id_penduduk),
    FOREIGN KEY (id_pendidikan) REFERENCES Pendidikan(id_pendidikan)
);

SELECT * FROM Riwayat_Pendidikan;
DROP TABLE IF EXISTS Riwayat_Pendidikan;

CREATE TABLE Riwayat_Pendidikan (
    id_riwayat INT PRIMARY KEY AUTO_INCREMENT,
    id_penduduk INT,
    id_pendidikan INT,
    tahun_lulus DATE,
    FOREIGN KEY (id_penduduk) REFERENCES Penduduk(id_penduduk),
    FOREIGN KEY (id_pendidikan) REFERENCES Pendidikan(id_pendidikan)
);

-- Tabel Penduduk:
INSERT INTO Penduduk (nama, tempat_lahir, tanggal_lahir, alamat, jenis_kelamin, pekerjaan) VALUES
('Budi Santoso', 'Surabaya', '1990-05-15', 'Jl. Raya Darmo No. 10', 'Laki-laki', 'Wiraswasta'),
('Ani Rahayu', 'Surabaya', '1985-08-20', 'Jl. Pucang Kedinding No. 5', 'Perempuan', 'Guru'),
('Citra Sari', 'Surabaya', '1992-12-03', 'Jl. Dr. Soetomo No. 25', 'Perempuan', 'Dokter'),
('Ahmad Abdullah', 'Surabaya', '1978-04-10', 'Jl. Embong Malang No. 15', 'Laki-laki', 'PNS'),
('Dewi Susanti', 'Surabaya', '1995-09-28', 'Jl. Manyar Kertoarjo No. 8', 'Perempuan', 'Mahasiswa'),
('Eko Setiawan', 'Surabaya', '1980-11-18', 'Jl. Jagir Wonokromo No. 30', 'Laki-laki', 'Karyawan Swasta'),
('Fita Handayani', 'Surabaya', '1987-07-12', 'Jl. Kertajaya Indah No. 7', 'Perempuan', 'Wirausaha'),
('Guntur Wibowo', 'Surabaya', '1993-02-25', 'Jl. Kayoon No. 20', 'Laki-laki', 'Dosen'),
('Hani Fitriani', 'Surabaya', '1982-06-19', 'Jl. Margorejo Indah No. 12', 'Perempuan', 'Pegawai Bank'),
('Irfan Pratama', 'Surabaya', '1998-01-30', 'Jl. Kupang Indah No. 3', 'Laki-laki', 'Pelajar'),
('Joko Purnomo', 'Surabaya', '1983-03-22', 'Jl. Rungkut Mapan No. 18', 'Laki-laki', 'Insinyur'),
('Kartika Dewi', 'Surabaya', '1991-10-07', 'Jl. Kaliwaru No. 9', 'Perempuan', 'Wanita Karir'),
('Lukman Hakim', 'Surabaya', '1986-11-05', 'Jl. Ketintang Baru No. 6', 'Laki-laki', 'Wiraswasta'),
('Mega Puspitasari', 'Surabaya', '1994-08-14', 'Jl. Menur Pumpungan No. 4', 'Perempuan', 'Marketing'),
('Nurul Hidayah', 'Surabaya', '1979-12-25', 'Jl. Wonorejo Indah No. 17', 'Perempuan', 'Pengajar'),
('Oscar Hadi', 'Surabaya', '1996-06-11', 'Jl. Tenggilis Mejoyo No. 22', 'Laki-laki', 'Programmer'),
('Putri Wulandari', 'Surabaya', '1989-09-02', 'Jl. Kali Anyar No. 11', 'Perempuan', 'Akuntan'),
('Rizky Firmansyah', 'Surabaya', '1997-04-09', 'Jl. Ketegan No. 16', 'Laki-laki', 'Peneliti'),
('Sinta Nurhaliza', 'Surabaya', '1984-03-17', 'Jl. Pakisaji No. 23', 'Perempuan', 'Dokter Hewan'),
('Taufik Hidayat', 'Surabaya', '1981-07-08', 'Jl. Simorejo No. 13', 'Laki-laki', 'Advokat');

-- Tabel Kartu Keluarga:
INSERT INTO Kartu_Keluarga (nomor_kk, alamat, rt, rw) VALUES
('1234567890123456', 'Jl. Ketintang Baru No. 6', 3, 5),
('2345678901234567', 'Jl. Margorejo Indah No. 12', 7, 8),
('3456789012345678', 'Jl. Kupang Indah No. 3', 1, 2),
('4567890123456789', 'Jl. Jagir Wonokromo No. 30', 10, 15),
('5678901234567890', 'Jl. Kertajaya Indah No. 7', 2, 3),
('6789012345678901', 'Jl. Pakisaji No. 23', 4, 6),
('7890123456789012', 'Jl. Tenggilis Mejoyo No. 22', 11, 12),
('8901234567890123', 'Jl. Menur Pumpungan No. 4', 5, 7),
('9012345678901234', 'Jl. Raya Darmo No. 10', 8, 10),
('0123456789012345', 'Jl. Dr. Soetomo No. 25', 6, 9),
('1234567890123456', 'Jl. Kaliwaru No. 9', 12, 13),
('2345678901234567', 'Jl. Kali Anyar No. 11', 4, 5),
('3456789012345678', 'Jl. Kayoon No. 20', 7, 8),
('4567890123456789', 'Jl. Ketegan No. 16', 15, 16),
('5678901234567890', 'Jl. Pucang Kedinding No. 5', 3, 4),
('6789012345678901', 'Jl. Simorejo No. 13', 9, 11),
('7890123456789012', 'Jl. Embong Malang No. 15', 10, 12),
('8901234567890123', 'Jl. Rungkut Mapan No. 18', 14, 15),
('9012345678901234', 'Jl. Ketintang Baru No. 6', 3, 5),
('0123456789012345', 'Jl. Manyar Kertoarjo No. 8', 6, 7);

-- Tabel Hubungan Penduduk-KK:
INSERT INTO Hubungan_Penduduk_KK (id_penduduk, id_kk, hubungan_dengan_kepala_keluarga) VALUES
(1, 1, 'Kepala Keluarga'),
(2, 1, 'Istri'),
(3, 1, 'Anak'),
(4, 2, 'Kepala Keluarga'),
(5, 2, 'Istri'),
(6, 2, 'Anak'),
(7, 3, 'Kepala Keluarga'),
(8, 3, 'Istri'),
(9, 3, 'Anak'),
(10, 4, 'Kepala Keluarga'),
(11, 4, 'Istri'),
(12, 4, 'Anak'),
(13, 5, 'Kepala Keluarga'),
(14, 5, 'Istri'),
(15, 5, 'Anak'),
(16, 6, 'Kepala Keluarga'),
(17, 6, 'Istri'),
(18, 6, 'Anak'),
(19, 7, 'Kepala Keluarga'),
(20, 7, 'Istri');

-- Tabel Pendidikan:
INSERT INTO Pendidikan (pendidikan_terakhir) VALUES
('SD'),
('SMP'),
('SMA'),
('Diploma'),
('Sarjana'),
('Magister'),
('Doktor');

-- Tabel Riwayat Pendidikan:
INSERT INTO Riwayat_Pendidikan (id_penduduk, id_pendidikan, tahun_lulus) VALUES
(1, 5, 2008),
(2, 5, 2005),
(3, 5, 2010),
(4, 6, 2002),
(5, 4, 2016),
(6, 5, 2000),
(7, 5, 2003),
(8, 6, 2007),
(9, 5, 2009),
(10, 4, 2012),
(11, 5, 1999),
(12, 5, 1998),
(13, 5, 2001),
(14, 5, 2006),
(15, 5, 2004),
(16, 5, 2018),
(17, 6, 2015),
(18, 5, 2008),
(19, 5, 2007),
(20, 5, 2005);

INSERT INTO Riwayat_Pendidikan (id_penduduk, id_pendidikan, tahun_lulus) VALUES
(1, 5, '2008-05-15'),
(2, 5, '2005-08-20'),
(3, 5, '2010-12-03'),
(4, 6, '2002-04-10'),
(5, 4, '2016-09-28'),
(6, 5, '2000-11-18'),
(7, 5, '2003-07-12'),
(8, 6, '2007-02-25'),
(9, 5, '2009-06-19'),
(10, 4, '2012-01-30'),
(11, 5, '1999-03-22'),
(12, 5, '1998-10-07'),
(13, 5, '2001-11-05'),
(14, 5, '2006-08-14'),
(15, 5, '2004-12-25'),
(16, 5, '2018-06-11'),
(17, 6, '2015-09-02'),
(18, 5, '2008-04-09'),
(19, 5, '2007-03-17'),
(20, 5, '2005-07-08');

#Stored Procedure untuk Mengetahui Pendidikan yang Paling Banyak
DELIMITER //

CREATE PROCEDURE CekPendidikanTerbanyak (
    IN pendidikan_id INT
)
BEGIN
    DECLARE pendidikan_banyak BOOLEAN DEFAULT FALSE;
    DECLARE pendidikan_text VARCHAR(100);
    
    SELECT COUNT(*) INTO pendidikan_banyak
    FROM Riwayat_Pendidikan
    WHERE id_pendidikan = pendidikan_id
    GROUP BY id_pendidikan
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    
    IF pendidikan_banyak THEN
        SET pendidikan_text = (SELECT pendidikan_terakhir FROM Pendidikan WHERE id_pendidikan = pendidikan_id);
        SELECT CONCAT(pendidikan_text, ' adalah pendidikan yang paling banyak');
    ELSE
        SET pendidikan_text = (SELECT pendidikan_terakhir FROM Pendidikan WHERE id_pendidikan = pendidikan_id);
        SELECT CONCAT(pendidikan_text, ' bukan pendidikan yang paling banyak');
    END IF;
END //

DELIMITER ;
CALL CekPendidikanTerbanyak(5);

#Query SQL dengan WHILE untuk Menampilkan Data Tabel Penduduk
DELIMITER //

CREATE PROCEDURE TampilkanDataPenduduk()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE total_rows INT;
    
    SELECT COUNT(*) INTO total_rows FROM Penduduk;
    
    WHILE counter <= 10 AND counter <= total_rows DO
        SELECT * FROM Penduduk WHERE id_penduduk = counter;
        SET counter = counter + 1;
    END WHILE;
    
END //

DELIMITER ;

CALL TampilkanDataPenduduk;

SELECT * FROM Penduduk WHERE id_penduduk BETWEEN 1 AND 10;