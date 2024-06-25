DELIMITER $$
CREATE PROCEDURE HitungHariSejakPemeriksaanTerakhir(
    IN pasien_id_param INT,
    OUT hari_sejak_terakhir INT
)
BEGIN
    DECLARE tanggal_terakhir DATE;

    SELECT MAX(tanggal_pemeriksaan)
    INTO tanggal_terakhir
    FROM Pemeriksaan
    WHERE pasien_id = pasien_id_param;

    
    IF tanggal_terakhir IS NULL THEN
        SET hari_sejak_terakhir = NULL;
    ELSE
        SET hari_sejak_terakhir = DATEDIFF(CURDATE(), tanggal_terakhir);
    END IF;
END$$
DELIMITER ;


--setting variabel--
SET @hari_sejak_terakhir = 0;
CALL HitungHariSejakPemeriksaanTerakhir(2, @hari_sejak_terakhir);
SELECT @hari_sejak_terakhir AS HariSejakPemeriksaanTerakhir;




DELIMITER $$
CREATE PROCEDURE JumlahPemeriksaanBulanan(
    IN tahun_param INT,
    IN bulan_param INT,
    OUT jumlah_pemeriksaan INT
)
BEGIN
    SELECT COUNT(*)
    INTO jumlah_pemeriksaan
    FROM Pemeriksaan
    WHERE YEAR(tanggal_pemeriksaan) = tahun_param
    AND MONTH(tanggal_pemeriksaan) = bulan_param;
END$$
DELIMITER ;


SET @jumlah_pemeriksaan = 0;
CALL JumlahPemeriksaanBulanan(2024, 4, @jumlah_pemeriksaan);
SELECT @jumlah_pemeriksaan AS JumlahPemeriksaanBulanan;


DELIMITER $$
CREATE PROCEDURE TambahPemeriksaan(
    IN pasien_id_param INT,
    IN dokter_id_param INT,
    IN keluhan_param TEXT
)
BEGIN
    INSERT INTO Pemeriksaan (pasien_id, dokter_id, tanggal_pemeriksaan, keluhan)
    VALUES (pasien_id_param, dokter_id_param, CURRENT_DATE(), keluhan_param);
END$$
DELIMITER ;

CALL TambahPemeriksaan(20, 2, 'Sakit Hati');
