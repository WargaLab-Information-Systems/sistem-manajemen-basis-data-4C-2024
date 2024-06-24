-- Stored Procedure dengan Parameter:

DELIMITER //

CREATE PROCEDURE sp_example_parameters(
    IN param_in INT,
    OUT param_out INT,
    INOUT param_inout INT
)
BEGIN
    -- Gunakan parameter IN
    SELECT param_in;

    -- Gunakan parameter OUT
    SET param_out = 10;

    -- Gunakan parameter INOUT
    SET param_inout = param_inout + 5;
END //

DELIMITER ;

-- Inisialisasi variabel
SET @inout_value = 7;

-- Mencetak nilai parameter_in yang diberikan pemanggil
CALL sp_example_parameters(7, @out_value, @inout_value);

-- Mengambil nilai parameter OUT yang ditetapkan
SELECT @out_value;

-- Mengambil nilai parameter INOUT yang telah dimodifikasi oleh prosedur
SELECT @inout_value;

-- Stored Procedure untuk Memasukkan Data Baru:
DELIMITER //

CREATE PROCEDURE sp_insert_penduduk(
    IN p_nama VARCHAR(100),
    IN p_tempat_lahir VARCHAR(100),
    IN p_tanggal_lahir DATE,
    IN p_alamat TEXT,
    IN p_jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    IN p_pekerjaan VARCHAR(100),
    IN p_nomor_kk VARCHAR(20),
    IN p_hubungan_dengan_kepala_keluarga VARCHAR(50),
    IN p_pendidikan_terakhir VARCHAR(100),
    IN p_tahun_lulus YEAR
)
BEGIN
    -- Memasukkan data penduduk ke dalam tabel Penduduk
    INSERT INTO Penduduk (nama, tempat_lahir, tanggal_lahir, alamat, jenis_kelamin, pekerjaan)
    VALUES (p_nama, p_tempat_lahir, p_tanggal_lahir, p_alamat, p_jenis_kelamin, p_pekerjaan);

    -- Dapatkan ID penduduk yang baru saja dimasukkan
    SET @last_id_penduduk = LAST_INSERT_ID();

    -- Memasukkan data alamat dan nomor kk ke dalam tabel Kartu Keluarga
    INSERT INTO Kartu_Keluarga (nomor_kk, alamat)
    VALUES (p_nomor_kk, p_alamat);

    -- Dapatkan ID Kartu Keluarga yang baru saja dimasukkan
    SET @last_id_kk = LAST_INSERT_ID();

    -- Memasukkan hubungan antara penduduk dan Kartu Keluarga ke dalam tabel Hubungan_Penduduk_KK
    INSERT INTO Hubungan_Penduduk_KK (id_penduduk, id_kk, hubungan_dengan_kepala_keluarga)
    VALUES (@last_id_penduduk, @last_id_kk, p_hubungan_dengan_kepala_keluarga);

    -- Memasukkan data pendidikan terakhir ke dalam tabel Pendidikan
    INSERT INTO Pendidikan (pendidikan_terakhir)
    VALUES (p_pendidikan_terakhir);

    -- Dapatkan ID pendidikan yang baru saja dimasukkan
    SET @last_id_pendidikan = LAST_INSERT_ID();

    -- Memasukkan data riwayat pendidikan ke dalam tabelriwayat pendidikan
    INSERT INTO Riwayat_Pendidikan (id_penduduk, id_pendidikan, tahun_lulus)
    VALUES (@last_id_penduduk, @last_id_pendidikan, p_tahun_lulus);
END //

DELIMITER ;

CALL sp_insert_penduduk('Agus Setiawan', 'Surabaya', '1990-03-25', 'Jl. Diponegoro No. 123', 'Laki-laki', 'Guru', '1234567890123456', 'Anak', 'Sarjana', 2015);

SELECT * FROM Penduduk WHERE nama = 'Agus Setiawan';
SELECT * FROM Kartu_Keluarga WHERE nomor_kk = '1234567890123456';
SELECT * FROM Hubungan_Penduduk_KK WHERE id_penduduk = '21';
SELECT * FROM Pendidikan WHERE pendidikan_terakhir = 'Sarjana';
SELECT * FROM Riwayat_Pendidikan WHERE id_penduduk = '21';


-- Stored Procedure yang Bisa Memperbaharui Data Pada Sebuah Tabel Penduduk
DELIMITER //

CREATE PROCEDURE sp_update_penduduk(
    IN p_id_penduduk INT,
    IN p_nama VARCHAR(100),
    IN p_tempat_lahir VARCHAR(100),
    IN p_tanggal_lahir DATE,
    IN p_alamat TEXT,
    IN p_jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    IN p_pekerjaan VARCHAR(100)
)
BEGIN
    -- Perbarui data pada tabel Penduduk berdasarkan ID penduduk, menggunakan perintah
    UPDATE Penduduk
    SET nama = p_nama,
        tempat_lahir = p_tempat_lahir,
        tanggal_lahir = p_tanggal_lahir,
        alamat = p_alamat,
        jenis_kelamin = p_jenis_kelamin,
        pekerjaan = p_pekerjaan
    WHERE id_penduduk = p_id_penduduk;
END //

DELIMITER ;

CALL sp_update_penduduk(1, 'Jojo Saputra', 'Surabaya', '1990-01-01', 'Jl. Raya Surabaya No. 123', 'Laki-laki', 'PNS');

SELECT * FROM Penduduk WHERE id_penduduk = 1;

-- Stored Procedure yang Bisa Menghapus Data Pada Sebuah Tabel
DELIMITER //

CREATE PROCEDURE sp_delete_penduduk(
    IN p_id_penduduk INT
)
BEGIN
    -- Hapus data dari tabel Riwayat_Pendidikan yang terkait dengan penduduk yang akan dihapus
    DELETE FROM Riwayat_Pendidikan WHERE id_penduduk = p_id_penduduk;

    -- Hapus data dari tabel Hubungan_Penduduk_KK yang terkait dengan penduduk yang akan dihapus
    DELETE FROM Hubungan_Penduduk_KK WHERE id_penduduk = p_id_penduduk;

    -- Hapus data dari tabel Penduduk berdasarkan ID penduduk
    DELETE FROM Penduduk WHERE id_penduduk = p_id_penduduk;
END //

DELIMITER ;

CALL sp_delete_penduduk(1);

SELECT * FROM Penduduk;