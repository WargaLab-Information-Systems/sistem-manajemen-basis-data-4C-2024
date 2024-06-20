-- Buat tabel Pelanggan
CREATE TABLE Pelanggan (
    ID_Pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Pelanggan VARCHAR(255),
    Alamat_pelanggan VARCHAR(255),
    No_Telepon VARCHAR(15)
);

-- Buat tabel Barang
CREATE TABLE Barang (
    ID_Barang INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Barang VARCHAR(255),
    Harga DECIMAL(10, 2),
    Stok INT
);

-- Buat tabel Supplier
CREATE TABLE Supplier (
    ID_Supplier INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Supplier VARCHAR(255),
    Alamat_Supplier VARCHAR(255),
    No_Telepon VARCHAR(15)
);

-- Buat tabel Pembelian supplier
CREATE TABLE pembelian_supplier (
    ID_Pembelian INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Pembelian DATE,
    ID_Supplier INT,
    ID_Barang INT,
    Jumlah INT,
    Total_Harga DECIMAL(10, 2),
    FOREIGN KEY (ID_Supplier) REFERENCES Supplier(ID_Supplier),
    FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang)
);

-- Buat tabel Retur
CREATE TABLE Pengembalian_barang (
    ID_Retur INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Retur DATE,
    ID_Pelanggan INT,
    ID_Barang INT,
    Jumlah_Retur INT,
    FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan(ID_Pelanggan),
    FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang)
);

-- Buat tabel Koreksi_Stok
CREATE TABLE Koreksi_Stok (
    ID_Koreksi INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Koreksi DATE,
    ID_Barang INT,
    Stok_Lama INT,
    Stok_Baru INT,
    FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang)
);

-- Buat tabel Keuangan
CREATE TABLE Keuangan (
    ID_Transaksi INT AUTO_INCREMENT PRIMARY KEY,
    Jenis_Transaksi VARCHAR(50),
    Tanggal_Transaksi DATE,
    Nominal DECIMAL(10, 2)
);

-- Buat tabel Laporan_Penjualan
CREATE TABLE Laporan_Penjualan (
    ID_Laporan_Penjualan INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Laporan DATE,
    ID_Pelanggan INT,
    Total_Penjualan DECIMAL(10, 2),
    FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan(ID_Pelanggan)
);

-- Buat tabel Laporan_Stok
CREATE TABLE Laporan_Stok (
    ID_Laporan_Stok INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Laporan DATE,
    ID_Barang INT,
    Stok_Awal INT,
    Stok_Akhir INT,
    FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang)
);


-- Tampilkan seluruh data pada setiap tabel
SELECT * FROM Pelanggan;
SELECT * FROM Barang;
SELECT * FROM Supplier;
SELECT * FROM Pembelian;
SELECT * FROM Retur;
SELECT * FROM Koreksi_Stok;
SELECT * FROM Keuangan;
SELECT * FROM Laporan_Penjualan;
SELECT * FROM Laporan_Stok;

-- Ubah nama tabel Retur menjadi Pengembalian
ALTER TABLE Retur RENAME TO Pengembalian;

-- Hapus database
DROP DATABASE toko_swalayan;
