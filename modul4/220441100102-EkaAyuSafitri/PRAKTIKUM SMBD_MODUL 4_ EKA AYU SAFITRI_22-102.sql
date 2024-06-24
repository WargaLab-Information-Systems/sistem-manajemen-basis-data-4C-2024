-- Menampilkan data Penduduk diurutkan berdasarkan nama secara ascending
SELECT * FROM Penduduk ORDER BY nama ASC;

-- Menampilkan data Kartu Keluarga diurutkan berdasarkan nomor KK secara descending
SELECT * FROM Kartu_Keluarga ORDER BY nomor_kk DESC;

-- Menampilkan data Riwayat Pendidikan diurutkan berdasarkan tahun lulus secara ascending
SELECT * FROM Riwayat_Pendidikan ORDER BY tahun_lulus ASC;

-- Menampilkan jumlah penduduk per pekerjaan yang memiliki lebih dari 2 orang
SELECT pekerjaan, COUNT(*) AS jumlah_penduduk 
FROM Penduduk 
GROUP BY pekerjaan 
HAVING COUNT(*) > 2 
ORDER BY jumlah_penduduk DESC;

-- Menampilkan data penduduk yang lahir antara tahun 1990 dan 1995
SELECT * FROM Penduduk WHERE YEAR(tanggal_lahir) BETWEEN 1990 AND 1995;

-- Tampilkan pekerjaan yang paling banyak dijalankan oleh penduduk
SELECT pekerjaan, COUNT(*) AS jumlah_penduduk 
FROM Penduduk 
GROUP BY pekerjaan 
ORDER BY jumlah_penduduk DESC 
LIMIT 1;

-- Tampilkan pekerjaan yang paling sedikit dijalankan oleh penduduk
SELECT pekerjaan, COUNT(*) AS jumlah_penduduk 
FROM Penduduk 
GROUP BY pekerjaan 
ORDER BY jumlah_penduduk ASC 
LIMIT 1;

-- Tampilkan pekerjaan yang memiliki huruf 'a' di depan katanya
SELECT pekerjaan 
FROM Penduduk 
WHERE pekerjaan LIKE 'a%' 
GROUP BY pekerjaan;

-- Cari jenis hubungan dengan kepala keluarga yang paling banyak muncul
SELECT hubungan_dengan_kepala_keluarga, COUNT(*) AS jumlah_anggota 
FROM Hubungan_Penduduk_KK 
GROUP BY hubungan_dengan_kepala_keluarga 
ORDER BY jumlah_anggota DESC 
LIMIT 1;

-- Cari kartu keluarga yang memiliki lebih dari 3 anggota
SELECT id_kk, COUNT(*) AS jumlah_anggota 
FROM Hubungan_Penduduk_KK 
GROUP BY id_kk 
HAVING COUNT(*) > 3;

-- Gabungkan tabel Penduduk dan Hubungan_Penduduk_KK untuk menampilkan data konsumen dan transaksinya
SELECT Penduduk.*, Hubungan_Penduduk_KK.hubungan_dengan_kepala_keluarga
FROM Penduduk
JOIN Hubungan_Penduduk_KK ON Penduduk.id_penduduk = Hubungan_Penduduk_KK.id_penduduk;