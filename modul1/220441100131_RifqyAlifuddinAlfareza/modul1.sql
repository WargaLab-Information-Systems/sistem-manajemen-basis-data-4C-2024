CREATE DATABASE rumah_sakit;
USE rumah_sakit;

CREATE TABLE Dokter (
    dokter_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_dokter VARCHAR(255),
    spesialisasi VARCHAR(100),
    alamat VARCHAR(255),
    telepon VARCHAR(20)
);

CREATE TABLE Pasien (
    pasien_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_pasien VARCHAR(255),
    alamat VARCHAR(255),
    telepon VARCHAR(20),
    tanggal_lahir DATE
);


CREATE TABLE Obat (
    obat_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_obat VARCHAR(255),
    jenis_obat VARCHAR(100),
    harga INT(20),
    stok INT
);


CREATE TABLE Pemeriksaan (
    pemeriksaan_id INT AUTO_INCREMENT PRIMARY KEY,
    pasien_id INT,
    dokter_id INT,
    tanggal_pemeriksaan DATE,
    keluhan TEXT,
    FOREIGN KEY (pasien_id) REFERENCES Pasien(pasien_id),
    FOREIGN KEY (dokter_id) REFERENCES Dokter(dokter_id)
);


CREATE TABLE Resep (
    resep_id INT AUTO_INCREMENT PRIMARY KEY,
    pemeriksaan_id INT,
    obat_id INT,
    jumlah INT,
    FOREIGN KEY (pemeriksaan_id) REFERENCES Pemeriksaan(pemeriksaan_id),
    FOREIGN KEY (obat_id) REFERENCES Obat(obat_id)
);

INSERT INTO Dokter (nama_dokter, spesialisasi, alamat, telepon) VALUES
('Dr. Ahmad', 'Bedah Umum', 'Jl. Pahlawan No. 10', '08123456789'),
('Dr. Budi', 'Dokter Gigi', 'Jl. Diponegoro No. 15', '08567891234'),
('Dr. Citra', 'Kandungan', 'Jl. Merdeka No. 20', '08234567890'),
('Dr. Dito', 'Anak', 'Jl. Kebon Jeruk No. 5', '08111222333'),
('Dr. Eva', 'Penyakit Dalam', 'Jl. Asia Afrika No. 30', '08123456789'),
('Dr. Farhan', 'Mata', 'Jl. Cendrawasih No. 25', '08123456789'),
('Dr. Gita', 'Bedah Umum', 'Jl. Kartini No. 40', '08123456789'),
('Dr. Hanif', 'Bedah Plastik', 'Jl. Brawijaya No. 35', '08123456789'),
('Dr. Indah', 'Anestesi', 'Jl. Gatot Subroto No. 50', '08123456789'),
('Dr. Joko', 'THT', 'Jl. A. Yani No. 45', '08123456789'),
('Dr. Karina', 'Kulit dan Kelamin', 'Jl. Merdeka No. 60', '08123456789'),
('Dr. Luthfi', 'Mata', 'Jl. Pahlawan No. 70', '08123456789'),
('Dr. Maya', 'Bedah Umum', 'Jl. Diponegoro No. 80', '08123456789'),
('Dr. Nanda', 'Dokter Gigi', 'Jl. Asia Afrika No. 90', '08123456789'),
('Dr. Oki', 'Kandungan', 'Jl. Kebon Jeruk No. 100', '08123456789'),
('Dr. Putra', 'Anak', 'Jl. Kartini No. 110', '08123456789'),
('Dr. Rani', 'THT', 'Jl. Cendrawasih No. 120', '08123456789'),
('Dr. Sari', 'Bedah Plastik', 'Jl. Gatot Subroto No. 130', '08123456789'),
('Dr. Tito', 'Anestesi', 'Jl. A. Yani No. 140', '08123456789'),
('Dr. Umar', 'Penyakit Dalam', 'Jl. Brawijaya No. 150', '08123456789');

INSERT INTO Pasien (nama_pasien, alamat, telepon, tanggal_lahir) VALUES
('Bude', 'Jl. Pahlawan No. 10', '08123456789', '1990-05-15'),
('Anu', 'Jl. Diponegoro No. 15', '08567891234', '1985-07-20'),
('Enji', 'Jl. Merdeka No. 20', '08234567890', '1993-01-10'),
('kairi', 'Jl. Kebon Jeruk No. 5', '08111222333', '1982-11-25'),
('Tokyo', 'Jl. Asia Afrika No. 30', '08123456789', '1978-09-18'),
('Acil', 'Jl. Cendrawasih No. 25', '08123456789', '1995-03-22'),
('Leka', 'Jl. Kartini No. 40', '08123456789', '1990-08-07'),
('Hanif', 'Jl. Brawijaya No. 35', '08123456789', '1987-12-14'),
('Indah', 'Jl. Gatot Subroto No. 50', '08123456789', '1991-06-30'),
('Joko', 'Jl. A. Yani No. 45', '08123456789', '1984-02-09'),
('Karin', 'Jl. Trunojoyo No. 60', '08123456789', '1980-04-12'),
('Lina', 'Jl. Pahlawan No. 55', '08123456789', '1992-10-03'),
('Maman', 'Jl. Diponegoro No. 70', '08123456789', '1977-07-28'),
('Nina', 'Jl. Merdeka No. 65', '08123456789', '1989-11-05'),
('Oscar', 'Jl. Kebon Jeruk No. 80', '08123456789', '1994-05-08'),
('Putri', 'Jl. Asia Afrika No. 75', '08123456789', '1983-03-17'),
('Roni', 'Jl. Cendrawasih No. 90', '08123456789', '1997-08-24'),
('Siska', 'Jl. Kartini No. 85', '08123456789', '1988-12-01'),
('Tono', 'Jl. Brawijaya No. 100', '08123456789', '1996-01-28'),
('Ulfa', 'Jl. Gatot Subroto No. 95', '08123456789', '1986-09-09');

INSERT INTO Pemeriksaan (pasien_id, dokter_id, tanggal_pemeriksaan, keluhan) VALUES
(1, 1, '2024-03-25', 'Sakit kepala dan demam'),
(2, 2, '2024-03-25', 'Sakit gigi'),
(3, 3, '2024-03-26', 'Hamil muda'),
(4, 4, '2024-03-26', 'Batuk pilek'),
(5, 5, '2024-03-27', 'Nyeri perut'),
(6, 6, '2024-03-27', 'Mata berair'),
(7, 7, '2024-03-28', 'Sakit perut'),
(8, 8, '2024-03-28', 'Operasi plastik'),
(9, 9, '2024-03-29', 'Pingsan'),
(10, 10, '2024-03-29', 'Sesak napas'),
(11, 11, '2024-03-30', 'Demam dan sakit kepala'),
(12, 12, '2024-03-30', 'Sakit perut dan muntah'),
(13, 13, '2024-03-31', 'Flu dan pilek'),
(14, 14, '2024-03-31', 'Sakit gigi berlubang'),
(15, 15, '2024-04-01', 'Kehilangan nafsu makan'),
(16, 16, '2024-04-01', 'Nyeri dada'),
(17, 17, '2024-04-02', 'Mata merah dan gatal'),
(18, 18, '2024-04-02', 'Luka bakar'),
(19, 19, '2024-04-03', 'Gangguan jantung'),
(20, 20, '2024-04-03', 'Insomnia dan kecemasan');

INSERT INTO Obat (nama_obat, jenis_obat, harga, stok) VALUES
('Paracetamol', 'Pil', 5000, 100),
('Amoxicillin', 'Kapsul', 10000, 50),
('Omeprazole', 'Tablet', 15000, 30),
('Ibuprofen', 'Sirup', 8000, 60),
('Cetirizine', 'Tablet', 12000, 40),
('Loratadine', 'Tablet', 11000, 45),
('Cefixime', 'Kapsul', 13000, 35),
('Dexamethasone', 'Injeksi', 20000, 20),
('Ranitidine', 'Sirup', 9000, 55),
('Aspirin', 'Tablet', 10000, 70),
('Metformin', 'Tablet', 9000, 40),
('Simvastatin', 'Tablet', 11000, 50),
('Lisinopril', 'Tablet', 12000, 30),
('Metoprolol', 'Tablet', 10000, 45),
('Warfarin', 'Tablet', 15000, 25),
('Alprazolam', 'Tablet', 8000, 55),
('Fluoxetine', 'Kapsul', 13000, 35),
('Diazepam', 'Tablet', 12000, 40),
('Pregabalin', 'Kapsul', 10000, 60),
('Atorvastatin', 'Tablet', 14000, 30);

INSERT INTO Resep (pemeriksaan_id, obat_id, jumlah) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1),
(6, 6, 2),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 2),
(11, 11, 1),
(12, 12, 2),
(13, 13, 1),
(14, 14, 2),
(15, 15, 1),
(16, 16, 2),
(17, 17, 1),
(18, 18, 2),
(19, 19, 1),
(20, 20, 2);

select * from dokter where spesialisasi="dokter Gigi"


