DELIMITER $$
CREATE PROCEDURE CekObatTerlaris(
    IN obat_id_param INT
)
BEGIN
    DECLARE jumlah_resep INT;

    SELECT COUNT(DISTINCT pemeriksaan_id) INTO jumlah_resep
    FROM Resep
    WHERE obat_id = obat_id_param;

    IF jumlah_resep > 1 THEN
        SELECT CONCAT((SELECT nama_obat FROM Obat WHERE obat_id = obat_id_param), ' adalah obat terlaris') AS STATUS;
    ELSE
        SELECT CONCAT((SELECT nama_obat FROM Obat WHERE obat_id = obat_id_param), ' bukan obat terlaris') AS STATUS;
    END IF;
END$$
DELIMITER ;
CALL CekObatTerlaris(11);


DELIMITER //
CREATE PROCEDURE TampilkanDataDokter()
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE selesai INT DEFAULT 0;
	DECLARE namaDokter VARCHAR (225);
	DECLARE Spes VARCHAR (225);
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = 1;
	
	WHILE i <= 10 AND selesai = 0 DO
		SELECT nama_dokter , spesialisasi INTO namaDokter, Spes
		FROM dokter
		WHERE dokter_id = i;
		
		IF selesai = 0 THEN
			SELECT dokter_id, nama_dokter, alamat
			FROM dokter
			WHERE dokter_id = i;
		END IF;
		SET i = i + 1;
	END WHILE;
END//
DELIMITER ;
CALL TampilkanDataDokter();