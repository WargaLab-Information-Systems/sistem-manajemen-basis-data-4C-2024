SELECT nama_dokter AS "Nama Dokter" , COUNT(*) AS Jumlah_Pemeriksaan 
FROM Dokter 
NATURAL JOIN Pemeriksaan 
GROUP BY dokter_id 
HAVING Jumlah_Pemeriksaan >= 1 
ORDER BY dokter_id ASC;

SELECT nama_pasien AS Nama_Pasien, SUM(obat.harga * resep.jumlah) AS Total_Harga FROM obat NATURAL JOIN resep NATURAL JOIN pemeriksaan 
NATURAL JOIN pasien
GROUP BY pasien_id
HAVING Total_Harga >= 1
ORDER BY Total_Harga ASC;