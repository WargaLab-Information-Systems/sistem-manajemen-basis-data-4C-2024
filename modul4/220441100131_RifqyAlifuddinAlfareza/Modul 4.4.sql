SELECT spesialisasi AS Spesialisasi, COUNT(*) AS Jumlah_Pemeriksaan 
	FROM Dokter GROUP BY spesialisasi ORDER BY Jumlah_Pemeriksaan DESC LIMIT 1;
SELECT spesialisasi AS Spesialisasi, COUNT(*) AS Jumlah_Pemeriksaan FROM Dokter GROUP BY spesialisasi ORDER BY Jumlah_Pemeriksaan ASC LIMIT 1;
SELECT nama_obat AS Nama_Obat FROM obat WHERE nama_obat LIKE "A%";

SELECT nama_pasien AS "Nama Pasien" , COUNT(pasien_id) AS Jumlah 
	FROM pemeriksaan NATURAL JOIN pasien GROUP BY pasien_id HAVING COUNT(pasien_id) > 1 ORDER BY pasien_id LIMIT 1;

SELECT nama_pasien AS "Nama Pasien" , COUNT(pasien_id) AS Jumlah 
	FROM pemeriksaan NATURAL JOIN pasien GROUP BY pasien_id HAVING COUNT(pasien_id) >= 3 ORDER BY pasien_id LIMIT 1;
	
SELECT pasien.*, pemeriksaan.tanggal_pemeriksaan,pemeriksaan.keluhan, obat.nama_obat ,obat.harga
FROM obat NATURAL JOIN resep NATURAL JOIN pasien NATURAL JOIN pemeriksaan;