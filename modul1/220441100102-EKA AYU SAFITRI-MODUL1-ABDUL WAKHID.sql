CREATE DATABASE IF NOT EXISTS pendataan_kependudukan;

USE pendataan_kependudukan;

-- Tabel master penduduk
CREATE TABLE IF NOT EXISTS penduduk (
    id_penduduk INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    tempat_lahir VARCHAR(50) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL,
    alamat TEXT NOT NULL
);

-- Tabel keluarga
CREATE TABLE IF NOT EXISTS keluarga (
    id_keluarga INT AUTO_INCREMENT PRIMARY KEY,
    kepala_keluarga VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL
);

-- Tabel hubungan keluarga
CREATE TABLE IF NOT EXISTS hubungan_keluarga (
    id_hubungan INT AUTO_INCREMENT PRIMARY KEY,
    id_keluarga INT NOT NULL,
    id_penduduk INT NOT NULL,
    hubungan ENUM('Kepala Keluarga', 'Istri', 'Anak', 'Orang Tua') NOT NULL,
    FOREIGN KEY (id_keluarga) REFERENCES keluarga(id_keluarga),
    FOREIGN KEY (id_penduduk) REFERENCES penduduk(id_penduduk)
);

-- Tabel pekerjaan
CREATE TABLE IF NOT EXISTS pekerjaan (
    id_pekerjaan INT AUTO_INCREMENT PRIMARY KEY,
    nama_pekerjaan VARCHAR(100) NOT NULL
);

-- Tabel pendidikan
CREATE TABLE IF NOT EXISTS pendidikan (
    id_pendidikan INT AUTO_INCREMENT PRIMARY KEY,
    id_penduduk INT NOT NULL,
    jenjang_pendidikan VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_penduduk) REFERENCES penduduk(id_penduduk)
);

-- Tabel transaksi penduduk (contoh: pendaftaran, perubahan status, dll)
CREATE TABLE IF NOT EXISTS transaksi_penduduk (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_penduduk INT NOT NULL,
    tipe_transaksi VARCHAR(50) NOT NULL,
    tanggal_transaksi DATE NOT NULL,
    FOREIGN KEY (id_penduduk) REFERENCES penduduk(id_penduduk)
);

-- Memasukkan data ke dalam tabel penduduk
INSERT INTO penduduk (nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat)
VALUES
    ('Lee Johny', 'Jakarta', '1990-05-15', 'Laki-laki', 'Jl. Putih No. 178'),
    ('Firdausi Putri', 'Surabaya', '1995-10-20', 'Perempuan', 'Jl. Merah No. 045'),
    ('Eka Ayu', 'Surabaya', '2002-12-27', 'Perempuan', 'Jl. Tandes Lor No. 001'),
    ('Nisaur Rohmah', 'Nganjuk', '2003-10-17', 'Perempuan', 'Jl. Andre No.141'),
    ('Cindy Permata', 'Pacet', '2003-01-10', 'Perempuan', 'Jl. Ardi No.099'),
    ('Herdiyanti Fifin', 'Gresik', '2004-05-18', 'Perempuan', 'Jl. Kebris No.144'), 
    ('Akra Santara', 'Lamongan', '2001-07-19', 'Laki-laki', 'JL. Wicak No.120'),
    ('Bara Anaka', 'Pasuruan', '2000-01-11', 'Laki-laki', 'JL. Dara No.111'),
    ('Cakra Winata', 'Mojokerto', '1999-09-19', 'Laki-laki', 'JL. Anggrek No.010'),
    ('Danu Ratala', 'Sidoarjo', '2003-07-25', 'Laki-laki', 'JL. Patri No. 008'),
    ('Eko Raharjo', 'Surabaya', '1997-01-01', 'Laki-laki', 'JL. Manalan No.040'),
    ('Anasya Suretno', 'Sidoarjo', '2005-10-10', 'Perempuan', 'JL. Tanghulu No.121'),
    ('Barbara Delio', 'Gresik', '2005-03-11', 'Perempuan', 'JL. Suleman No.156'),
    ('Cinta Putri', 'Pacet', '2007-02-16', 'Perempuan', 'JL. Bandaan No.145'),
    ('Dinda Syara', 'Bojonegoro', '2008-04-26', 'Perempuan', 'JL. Soetomo No.134'),
    ('Safitra Ana', 'Pasuruan', '2008-03-07', 'Perempuan', 'JL. Gaharno No.166'),
    ('Fabian Sesa', 'Jakarta', '1999-12-10', 'Laki-laki', 'JL. Soedirman No.178'),
    ('Febian Sesa', 'Semarang', '1998-12-18', 'Laki-laki', 'JL. Fajar No.004'),
    ('Fira Natra', 'Bangkalan', '1998-07-03', 'Perempuan', 'JL. Kajerang No.076'),
    ('Ganis Serandra', 'Sampang', '1997-04-24', 'Perempuan', 'JL. Wijangan No.129');
    
    SELECT * FROM penduduk

-- Memasukkan data ke dalam tabel keluarga
INSERT INTO keluarga (kepala_keluarga, alamat)
VALUES
    ('Lee Johny', 'Jl. Putih No. 178'),
    ('Firdausi Putri', 'Jl. Merah No. 045'),
    ('Eka Ayu', 'Jl. Tandes Lor No. 001'),
    ('Nisaur Rohmah', 'Jl. Andre No.141'),
    ('Cindy Permata', 'Jl. Ardi No.099'),
    ('Herdiyanti Fifin', 'Jl. Kebris No.144'), 
    ('Akra Santara', 'JL. Wicak No.120'),
    ('Bara Anaka', 'JL. Dara No.111'),
    ('Cakra Winata', 'JL. Anggrek No.010'),
    ('Danu Ratala', 'JL. Patri No. 008'),
    ('Eko Raharjo', 'JL. Manalan No.040'),
    ('Anasya Suretno', 'JL. Tanghulu No.121'),
    ('Barbara Delio', 'JL. Suleman No.156'),
    ('Cinta Putri', 'JL. Bandaan No.145'),
    ('Dinda Syara', 'JL. Soetomo No.134'),
    ('Safitra Ana', 'JL. Gaharno No.166'),
    ('Fabian Sesa', 'JL. Soedirman No.178'),
    ('Febian Sesa', 'JL. Fajar No.004'),
    ('Fira Natra', 'JL. Kajerang No.076'),
    ('Ganis Serandra', 'JL. Wijangan No.129');
    
    SELECT * FROM keluarga

-- Memasukkan data ke dalam tabel hubungan_keluarga
INSERT INTO hubungan_keluarga (id_keluarga, id_penduduk, hubungan)
VALUES
    (1, 1, 'Kepala Keluarga'),
    (2, 2, 'Istri'),
    (3, 3, 'Anak'),
    (4, 4, 'Orang Tua'),
    (5, 5, 'Kepala Keluarga'),
    (6, 6, 'Istri'),
    (7, 7, 'Anak'),
    (8, 8, 'Orang Tua'),
    (9, 9, 'Kepala Keluarga'),
    (10, 10, 'Anak'),
    (11, 11, 'Anak'),
    (12, 12, 'Orang Tua'),
    (13, 13, 'Kepala Keluarga'),
    (14, 14, 'Istri'),
    (15, 15, 'Anak'),
    (16, 16, 'Orang Tua'),
    (17, 17, 'Kepala Keluarga'),
    (18, 18, 'Anak'),
    (19, 19, 'Anak'),
    (20, 20, 'Orang Tua');
    
    SELECT * FROM hubungan_keluarga

-- Memasukkan data ke dalam tabel pekerjaan
INSERT INTO pekerjaan (nama_pekerjaan) VALUES
    ('Guru'),
    ('Dokter'),
    ('Pengacara'),
    ('Arsitek'),
    ('Penulis'),
    ('Petani'),
    ('Pengusaha'),
    ('Pilot'),
    ('Desainer'),
    ('Insinyur'),
    ('Seniman'),
    ('Akuntan'),
    ('Montir'),
    ('Perawat'),
    ('Wiraswasta'),
    ('Pramugari'),
    ('Peneliti'),
    ('Polisi'),
    ('Tukang Kayu'),
    ('Pedagang');
    
    SELECT * FROM pekerjaan

-- Memasukkan data ke dalam tabel pendidikan
INSERT INTO pendidikan (id_penduduk, jenjang_pendidikan) VALUES
    (1, 'SMA'),
    (2, 'SMA'),
    (3, 'SMK'),
    (4, 'D1'),
    (5, 'D2'),
    (6, 'D3'),
    (7, 'S1'),
    (8, 'D4'),
    (9, 'S2'),
    (10, 'SD'),
    (11, 'SMP'), 
    (12, 'S2'),
    (13, 'S1'),
    (14, 'D3'),
    (15, 'SD'),
    (16, 'SMK'),
    (17, 'D4'),
    (18, 'Tidak Sekolah'),
    (19, 'SD'),
    (20, 'S2');
    
    SELECT * FROM pendidikan

-- Memasukkan data ke dalam tabel transaksi_penduduk
INSERT INTO transaksi_penduduk (id_penduduk, tipe_transaksi, tanggal_transaksi) VALUES
    (1, 'Pendaftaran', '2024-01-01'),
    (2, 'Pendaftaran', '2024-01-02'),
    (3, 'Pendaftaran', '2024-01-03'),
    (4, 'Pendaftaran', '2024-01-04'),
    (5, 'Pendaftaran', '2024-01-05'),
    (6, 'Pendaftaran', '2024-01-06'),
    (7, 'Pendaftaran', '2024-01-07'),
    (8, 'Pendaftaran', '2024-01-08'),
    (9, 'Pendaftaran', '2024-01-09'),
    (10, 'Pendaftaran', '2024-01-10'),
    (11, 'Pendaftaran', '2024-01-11'),
    (12, 'Pendaftaran', '2024-01-12'),
    (13, 'Pendaftaran', '2024-01-13'),
    (14, 'Pendaftaran', '2024-01-14'),
    (15, 'Pendaftaran', '2024-01-15'),
    (16, 'Pendaftaran', '2024-01-16'),
    (17, 'Pendaftaran', '2024-01-17'),
    (18, 'Pendaftaran', '2024-01-18'),
    (19, 'Pendaftaran', '2024-01-19'),
    (20, 'Pendaftaran', '2024-01-20');
    
    SELECT * FROM transaksi_penduduk


