-- Menampilkan data buku diurutkan berdasarkan judul secara ascending (ASC)
SELECT * FROM buku ORDER BY judul ASC;

-- Menampilkan data buku diurutkan berdasarkan tahun terbit secara descending (DESC)
SELECT * FROM buku ORDER BY tahun_terbit DESC;

-- Menampilkan jumlah buku berdasarkan penulis, hanya menampilkan penulis yang memiliki lebih dari 5 buku
SELECT penulis, COUNT(*) AS jumlah_buku
FROM buku
GROUP BY penulis
HAVING jumlah_buku > 5;

-- Menampilkan peminjaman buku pada rentang tanggal tertentu (misalnya Januari 2023)
SELECT *
FROM peminjaman
WHERE tanggal_pinjam BETWEEN '2024-03-01' AND '2024-03-05';

-- Menampilkan buku yang paling banyak muncul berdasarkan judul
SELECT judul, COUNT(*) AS jumlah
FROM peminjaman
GROUP BY judul
ORDER BY jumlah DESC
LIMIT 1;

-- Menampilkan buku yang paling sedikit muncul berdasarkan judul
SELECT judul, COUNT(*) AS jumlah
FROM peminjaman
GROUP BY judul
ORDER BY jumlah ASC
LIMIT 1;

-- Menampilkan buku yang judulnya diawali dengan huruf "a"
SELECT *
FROM buku
WHERE judul LIKE 'a%';

-- Mencari peminjam yang paling banyak melakukan transaksi
SELECT nama_peminjam, COUNT(*) AS jumlah_transaksi
FROM transaksi
GROUP BY nama_peminjam
ORDER BY jumlah_transaksi DESC
LIMIT 1;

-- Mencari konsumen yang melakukan transaksi lebih dari 3 kali
SELECT nama_peminjam, COUNT(*) AS jumlah_transaksi
FROM transaksi
GROUP BY nama_peminjam
HAVING jumlah_transaksi > 3;

-- Menampilkan data seluruh konsumen mulai dari data diri dan transaksi
SELECT anggota.*, transaksi.*
FROM anggota
LEFT JOIN transaksi ON anggota_id = transaksi_id;
