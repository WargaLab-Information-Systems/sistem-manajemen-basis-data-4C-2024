DELIMITER $$

CREATE OR REPLACE PROCEDURE produklaku()
BEGIN
    SELECT 
        p.ID, 
        p.Nama,
        CASE 
            WHEN SUM(lp.jumlah) IS NOT NULL AND SUM(lp.jumlah) > 80 THEN 'Laris' 
            ELSE 'Tidak' 
        END AS status_jual,
        COALESCE(SUM(lp.jumlah), 0) AS jumlah_penjualan
    FROM produk p
    LEFT JOIN laporan_penjualan lp ON p.ID = lp.id_produk
    GROUP BY p.ID, p.Nama
    ORDER BY jumlah_penjualan DESC;
END $$

DELIMITER ;

CALL produklaku;

DELIMITER $$
CREATE OR REPLACE PROCEDURE produk()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10 DO
        SELECT * FROM data_produk WHERE ID = i;
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

CALL produk;