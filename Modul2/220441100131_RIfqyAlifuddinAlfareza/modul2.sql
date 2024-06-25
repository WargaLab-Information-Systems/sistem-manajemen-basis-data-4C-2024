--read only--
CREATE VIEW pasiendokter AS
SELECT nama_pasien,nama_dokter FROM Pasien 
JOIN Pemeriksaan ON Pasien.pasien_id = Pemeriksaan.pasien_id 
JOIN dokter ON Pemeriksaan.dokter_id = dokter.dokter_id;

CREATE VIEW obatpasien AS
SELECT nama_pasien, nama_obat FROM pasien a 
JOIN pemeriksaan b ON a.pasien_id = b.pasien_id 
JOIN resep c ON b.pemeriksaan_id = c.pemeriksaan_id
JOIN obat d ON c.obat_id = d.obat_id;

--updatable-
CREATE VIEW dokterspesialis AS
SELECT nama_dokter,spesialisasi FROM dokter;

CREATE VIEW alamatpasien AS
SELECT nama_pasien,alamat FROM pasien;

UPDATE dokterspesialis SET spesialisasi = 'Bedah otak'
WHERE nama_dokter = 'Dr. Indah';

update pasiendokter set nama_dokter = "Dr. ajhsj" , nama_pasien = "POPOP"

 
SELECT*FROM pasiendokter;
SELECT*FROM obatpasien;

SELECT*FROM dokterspesialis;
SELECT*FROM alamatpasien;