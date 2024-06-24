-- Updatable View:
-- Updatable View untuk Tabel Penduduk:
CREATE VIEW Updatable_Penduduk AS
SELECT * FROM Penduduk;

SELECT * FROM Updatable_Penduduk;

UPDATE Updatable_Penduduk 
SET nama = 'Citra Karina' 
WHERE id_penduduk = 3;

-- Updatable View untuk Tabel Kartu_Keluarga:
CREATE VIEW Updatable_KK AS
SELECT * FROM Kartu_Keluarga;

SELECT * FROM Updatable_KK;

UPDATE Updatable_KK 
SET alamat = 'Jl. Dr. Soetomo No. 25' 
WHERE id_kk = 3;

-- Read-only View:
-- View untuk Melihat Informasi Penduduk dan KK:
CREATE VIEW Informasi_Penduduk_KK AS
SELECT p.nama, p.tempat_lahir, p.tanggal_lahir, p.alamat, p.jenis_kelamin, p.pekerjaan, k.nomor_kk, k.alamat AS alamat_kk, k.rt, k.rw
FROM Penduduk p
JOIN Hubungan_Penduduk_KK h ON p.id_penduduk = h.id_penduduk
JOIN Kartu_Keluarga k ON h.id_kk = k.id_kk;

UPDATE Informasi_Penduduk_KK
SET tempat_lahir = 'Kediri'
WHERE nomor_kk = '1234567890123456';

SELECT * FROM Informasi_Penduduk_KK;

-- View untuk Melihat Riwayat Pendidikan Penduduk:
CREATE VIEW Riwayat_Pendidikan_Penduduk AS
SELECT p.nama, p.tempat_lahir, p.tanggal_lahir, p.alamat, p.jenis_kelamin, p.pekerjaan, r.tahun_lulus, pd.pendidikan_terakhir
FROM Penduduk p
JOIN Riwayat_Pendidikan r ON p.id_penduduk = r.id_penduduk
JOIN Pendidikan pd ON r.id_pendidikan = pd.id_pendidikan;

SELECT * FROM Riwayat_Pendidikan_Penduduk;
