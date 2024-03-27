-- Membuat VIEW yang dapat diupdate
CREATE VIEW updatable_view1 AS
    SELECT penduduk.id_penduduk, penduduk.nama, penduduk.tempat_lahir, penduduk.tanggal_lahir, penduduk.jenis_kelamin, penduduk.alamat, hubungan_keluarga.hubungan
    FROM penduduk
    JOIN hubungan_keluarga ON penduduk.id_penduduk = hubungan_keluarga.id_penduduk;
    
CREATE VIEW updatable_view2 AS
    SELECT penduduk.id_penduduk, penduduk.nama, penduduk.tempat_lahir, penduduk.tanggal_lahir, penduduk.jenis_kelamin, penduduk.alamat, transaksi_penduduk.tipe_transaksi, transaksi_penduduk.tanggal_transaksi
    FROM penduduk
    JOIN transaksi_penduduk ON penduduk.id_penduduk = transaksi_penduduk.id_penduduk;

-- Membuat VIEW yang hanya bisa dibaca (readonly)
CREATE VIEW readonly_view1 AS
    SELECT penduduk.id_penduduk, penduduk.nama, penduduk.tempat_lahir, penduduk.tanggal_lahir, penduduk.jenis_kelamin, penduduk.alamat, pekerjaan.nama_pekerjaan
    FROM penduduk
    JOIN hubungan_keluarga ON penduduk.id_penduduk = hubungan_keluarga.id_penduduk
    JOIN pekerjaan ON penduduk.id_penduduk = pekerjaan.id_pekerjaan;
    
CREATE VIEW readonly_view2 AS
    SELECT penduduk.id_penduduk, penduduk.nama, penduduk.tempat_lahir, penduduk.tanggal_lahir, penduduk.jenis_kelamin, penduduk.alamat, pendidikan.jenjang_pendidikan
    FROM penduduk
    JOIN pendidikan ON penduduk.id_penduduk = pendidikan.id_penduduk;