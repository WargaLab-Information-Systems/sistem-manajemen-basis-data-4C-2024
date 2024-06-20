DELIMITER //

CREATE OR REPLACE PROCEDURE HitungHariSejakTransaksiTerakhir()
BEGIN
    SELECT nama_peminjam,MAX(Waktu_transaksi),CONCAT(DATEDIFF(CURDATE(),waktu_transaksi),' hari') AS lama_melakukan_transaksi
    FROM transaksi GROUP BY Waktu_transaksi ; 
    
END //

DELIMITER ;

CALL HitungHariSejakTransaksiTerakhir();

DELIMITER //
CREATE OR REPLACE PROCEDURE soal2 ()
BEGIN
	SELECT jenis_transaksi,COUNT(waktu_transaksi)AS total_transaksi FROM transaksi WHERE MONTH(waktu_transaksi) = 5 ;
END //

DELIMITER ;

CALL soal2();

DELIMITER //
CREATE OR REPLACE PROCEDURE soal3 ()
BEGIN
	INSERT INTO transaksi (transaksi_id,petugas_id,jenis_transaksi,waktu_transaksi,nama_peminjam) 
	VALUES (7,106,'peminjaman',CURDATE() ,'fahri');
END //

DELIMITER ;

CALL soal3();
SELECT * FROM transaksi;