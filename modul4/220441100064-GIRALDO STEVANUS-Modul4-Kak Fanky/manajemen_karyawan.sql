/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - manajement_karyawan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`manajement_karyawan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `manajement_karyawan`;

/*Table structure for table `absensi` */

DROP TABLE IF EXISTS `absensi`;

CREATE TABLE `absensi` (
  `id_absensi` int(11) NOT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_pulang` time DEFAULT NULL,
  PRIMARY KEY (`id_absensi`),
  KEY `id_karyawan` (`id_karyawan`),
  CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `absensi` */

insert  into `absensi`(`id_absensi`,`id_karyawan`,`tanggal`,`jam_masuk`,`jam_pulang`) values 
(1,1,'2024-03-01','08:00:00','17:00:00'),
(2,2,'2024-03-02','08:30:00','17:30:00'),
(3,2,'2024-03-03','08:30:00','17:30:00'),
(4,2,'2024-03-04','08:30:00','17:30:00'),
(5,2,'2024-03-05','08:30:00','17:30:00'),
(6,2,'2024-03-06','08:30:00','17:30:00'),
(7,2,'2024-03-07','08:30:00','17:30:00'),
(8,2,'2024-03-08','08:30:00','17:30:00'),
(9,2,'2024-03-09','08:30:00','17:30:00'),
(10,2,'2024-03-10','08:30:00','17:30:00'),
(11,2,'2024-03-11','08:30:00','17:30:00'),
(12,2,'2024-03-12','08:30:00','17:30:00'),
(13,2,'2024-03-13','08:30:00','17:30:00'),
(14,2,'2024-03-14','08:30:00','17:30:00'),
(15,2,'2024-03-15','08:30:00','17:30:00'),
(16,2,'2024-03-16','08:30:00','17:30:00'),
(17,2,'2024-03-17','08:30:00','17:30:00'),
(18,2,'2024-03-18','08:30:00','17:30:00'),
(19,2,'2024-03-19','08:30:00','17:30:00'),
(20,2,'2024-03-10','08:30:00','17:30:00');

/*Table structure for table `departemen` */

DROP TABLE IF EXISTS `departemen`;

CREATE TABLE `departemen` (
  `id_departemen` int(11) NOT NULL,
  `nama_departemen` varchar(100) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_departemen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `departemen` */

insert  into `departemen`(`id_departemen`,`nama_departemen`,`lokasi`) values 
(1,'IT','New York'),
(2,'HR','Los Angeles'),
(3,'HR','Los Angeles'),
(4,'HR','Los Angeles'),
(5,'HR','Los Angeles'),
(6,'HR','Los Angeles'),
(7,'HR','Los Angeles'),
(8,'HR','Los Angeles'),
(9,'HR','Los Angeles'),
(10,'HR','Los Angeles'),
(11,'HR','Los Angeles'),
(12,'HR','Los Angeles'),
(13,'HR','Los Angeles'),
(14,'HR','Los Angeles'),
(15,'HR','Los Angeles'),
(16,'HR','Los Angeles'),
(17,'HR','Los Angeles'),
(18,'HR','Los Angeles'),
(19,'HR','Los Angeles'),
(20,'HR','Los Angeles');

/*Table structure for table `evaluasikinerja` */

DROP TABLE IF EXISTS `evaluasikinerja`;

CREATE TABLE `evaluasikinerja` (
  `id_evaluasi` int(11) NOT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  `bulan` varchar(20) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `evaluasi` text DEFAULT NULL,
  PRIMARY KEY (`id_evaluasi`),
  KEY `id_karyawan` (`id_karyawan`),
  CONSTRAINT `evaluasikinerja_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `evaluasikinerja` */

insert  into `evaluasikinerja`(`id_evaluasi`,`id_karyawan`,`bulan`,`tahun`,`evaluasi`) values 
(0,NULL,NULL,NULL,NULL),
(1,1,'Januari',2024,'Karyawan yang berkinerja baik dan teliti.'),
(2,2,'Januari',2024,'Karyawan yang berkinerja memuaskan.'),
(3,3,'Januari',2024,'Karyawan yang berkinerja rapi.'),
(4,4,'Januari',2024,'Karyawan yang berkinerja cepat.'),
(5,5,'Januari',2024,'Karyawan yang berkinerja paruh waktu.'),
(6,6,'Januari',2024,'Karyawan yang berkinerja jarak jauh.'),
(7,7,'Januari',2024,'Karyawan yang berkinerja serius banget.'),
(8,8,'Januari',2024,'Karyawan yang berkinerja santai.'),
(9,9,'Januari',2024,'Karyawan yang berkinerja full time.'),
(10,10,'Januari',2024,'Karyawan yang berkinerja.'),
(11,11,'Januari',2024,'Karyawan yang berkinerja bermalas.'),
(12,12,'Januari',2024,'Karyawan yang berkinerja bercanda.'),
(13,13,'Januari',2024,'Karyawan yang berkinerja bising.'),
(14,14,'Januari',2024,'Karyawan yang berkinerja sembrono.'),
(15,15,'Januari',2024,'Karyawan yang berkinerja kasar.'),
(16,16,'Januari',2024,'Karyawan yang berkinerja lembut.'),
(17,17,'Januari',2024,'Karyawan yang berkinerja gesit.'),
(18,18,'Januari',2024,'Karyawan yang berkinerja sempurna.'),
(19,19,'Januari',2024,'Karyawan yang berkinerja tidak berisik.');

/*Table structure for table `karyawan` */

DROP TABLE IF EXISTS `karyawan`;

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `negara` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `karyawan` */

insert  into `karyawan`(`id_karyawan`,`nama`,`jabatan`,`tanggal_masuk`,`gaji`,`alamat`,`jenis_kelamin`,`negara`,`kota`) values 
(0,'Dafa','Mahasiswa','2022-08-24',20000.00,'Telang','L','Indonesia','Bangkalan'),
(1,'Project Manager','MauLana Nafudi','2024-04-25',5500.00,'jln Tunas Rajuk','L','Indonesia','Bojonegoro'),
(2,'Jane Smith','QA Engineer','2022-02-20',4500.00,'Telang','L','Indonesia','Bangkalan'),
(3,'Malik Fajar','Sofware Dev','2022-02-21',5500.00,'Jln Sudirman','L','Indonesia','Bekasi'),
(4,'Ahmad Yani','Project Manajer','2022-02-22',6500.00,'Telang','L','Indonesia','Bangkalan'),
(5,'Giraldo','UI & UX','2022-02-23',7500.00,'Telang','L','Indonesia','Bangkalan'),
(6,'Hikmah Rufi','QA Engineer','2022-02-24',4500.00,'Avda. de la Constitución 2222','L','Spain','Madrid'),
(7,'Darukh Fatih','QA Engineer','2022-02-25',4500.00,'Avda. de la Constitución 2222','L','Spain','Madrid'),
(8,'Martin Fitrian','QA Engineer','2022-02-26',4500.00,'Avda. de la Constitución 2222','L','Spain','Madrid'),
(9,'Mahmud','QA Engineer','2022-02-27',4500.00,'Avda. de la Constitución 2222','L','Spain','Madrid'),
(10,'Anvina','QA Engineer','2022-02-28',4500.00,'Obere Str. 57','P','Canada','Tsawassen'),
(11,'Hasnah','QA Engineer','2022-03-01',4500.00,'Obere Str. 57','P','Canada','Tsawassen'),
(12,'Vivin Viana','QA Engineer','2022-02-02',4500.00,'Obere Str. 57','P','Canada','Tsawassen'),
(13,'Natasyah\r\n','QA Engineer','2022-02-03',4500.00,'Obere Str. 57','P','Canada','Tsawassen'),
(14,'Aisyah','QA Engineer','2022-02-04',4500.00,'Obere Str. 57','P','Canada','Tsawassen'),
(15,'Siti Berkah','QA Engineer','2022-02-05',4500.00,'C/ Araquil, 67','P','France','Marseille'),
(16,'Rani Pandiangan','QA Engineer','2022-02-06',4500.00,'C/ Araquil, 67','P','France','Marseille'),
(17,'Siti Nella ','QA Engineer','2022-02-07',4500.00,'C/ Araquil, 67','P','France','Marseille'),
(18,'Meidah','QA Engineer','2022-02-08',4500.00,'C/ Araquil, 67','P','France','Marseille'),
(19,'Maria Nobel','QA Engineer','2022-02-09',4500.00,'C/ Araquil, 67','P','France','Marseille'),
(20,'Jane Smith','QA Engineer','2022-02-20',4500.00,'2732 Baker Blvd.','P','Inggris','London'),
(22,'Armando','QA Engineer','2022-02-20',4500.00,'Garden House Crowther Way','L','Inggris','Cowes');

/*Table structure for table `proyek` */

DROP TABLE IF EXISTS `proyek`;

CREATE TABLE `proyek` (
  `id_proyek` int(11) NOT NULL,
  `nama_proyek` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_proyek`),
  KEY `id_departemen` (`id_departemen`),
  CONSTRAINT `proyek_ibfk_1` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `proyek` */

insert  into `proyek`(`id_proyek`,`nama_proyek`,`deskripsi`,`id_departemen`) values 
(1,'Sistem Manajer','Pengembangan sistem manajemen',1),
(2,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(3,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(4,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(5,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(6,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(7,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(8,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(9,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(10,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(11,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(12,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(13,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(14,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(15,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(16,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(17,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(18,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(19,'Aplikasi Mobile','Pengembangan aplikasi mobile',1),
(20,'Aplikasi Mobile','Pengembangan aplikasi mobile',1);

/* Procedure structure for procedure `AddKaryawan` */

/*!50003 DROP PROCEDURE IF EXISTS  `AddKaryawan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AddKaryawan`(
    IN id_karyawan INT,
    IN nama VARCHAR(100),
    IN jabatan VARCHAR(100),
    IN tanggal_masuk DATE,
    IN gaji DECIMAL(10,2),
    IN alamat VARCHAR(225),
    IN jenis_kelamin CHAR(1)
)
BEGIN
    INSERT INTO karyawan
    VALUES (id_karyawan, nama, jabatan, tanggal_masuk, gaji, alamat, jenis_kelamin);
END */$$
DELIMITER ;

/* Procedure structure for procedure `CountByGender` */

/*!50003 DROP PROCEDURE IF EXISTS  `CountByGender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CountByGender`(
    IN gender CHAR(2),
    OUT total INT)
BEGIN
    SELECT COUNT(id_karyawan)
    INTO total
    FROM karyawan
    WHERE jenis_kelamin = gender;
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetKaryawan` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetKaryawan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetKaryawan`()
begin
select * from karyawan;
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetNamaByAlmtKelamin` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetNamaByAlmtKelamin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNamaByAlmtKelamin`(
in almt varchar(20),
in jklmn varchar(2))
begin
select * from karyawan
where jenis_kelamin = jklmn
and alamat = almt;
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetNamaByJenisKelamin` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetNamaByJenisKelamin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNamaByJenisKelamin`(In jeniskelamin varchar(1))
begin
select * from karyawan
where jenis_kelamin = jeniskelamin;
end */$$
DELIMITER ;

/* Procedure structure for procedure `JumlahKaryawan` */

/*!50003 DROP PROCEDURE IF EXISTS  `JumlahKaryawan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `JumlahKaryawan`(OUT jumlah_karyawan INT)
BEGIN
    SELECT COUNT(id_karyawan)
    INTO jumlah_karyawan
    FROM karyawan;
END */$$
DELIMITER ;

/*Table structure for table `tugas` */

DROP TABLE IF EXISTS `tugas`;

/*!50001 DROP VIEW IF EXISTS `tugas` */;
/*!50001 DROP TABLE IF EXISTS `tugas` */;

/*!50001 CREATE TABLE  `tugas`(
 `nama_proyek` varchar(100) 
)*/;

/*View structure for view tugas */

/*!50001 DROP TABLE IF EXISTS `tugas` */;
/*!50001 DROP VIEW IF EXISTS `tugas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tugas` AS select distinct `proyek`.`nama_proyek` AS `nama_proyek` from `proyek` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
