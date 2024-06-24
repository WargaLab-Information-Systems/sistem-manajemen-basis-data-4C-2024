/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - tugas_modul2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tugas_modul2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tugas_modul2`;

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `posisi` varchar(50) DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pegawai` */

insert  into `pegawai`(`id`,`nama`,`posisi`,`gaji`) values 
(1,'John Doe','Manager',5000.00),
(2,'Jane Smith','Staf',3500.00),
(3,'Michael Johnson','Analyst',4500.00),
(4,'Emily Brown','Kontrak',2500.00),
(5,'David Lee','Manager',5200.00);

/*Table structure for table `view_pegawai_dengan_gaji_tinggi` */

DROP TABLE IF EXISTS `view_pegawai_dengan_gaji_tinggi`;

/*!50001 DROP VIEW IF EXISTS `view_pegawai_dengan_gaji_tinggi` */;
/*!50001 DROP TABLE IF EXISTS `view_pegawai_dengan_gaji_tinggi` */;

/*!50001 CREATE TABLE  `view_pegawai_dengan_gaji_tinggi`(
 `id` int(11) ,
 `nama` varchar(100) ,
 `posisi` varchar(50) ,
 `gaji` decimal(10,2) 
)*/;

/*Table structure for table `view_pegawai_gaji_naik` */

DROP TABLE IF EXISTS `view_pegawai_gaji_naik`;

/*!50001 DROP VIEW IF EXISTS `view_pegawai_gaji_naik` */;
/*!50001 DROP TABLE IF EXISTS `view_pegawai_gaji_naik` */;

/*!50001 CREATE TABLE  `view_pegawai_gaji_naik`(
 `id` int(11) ,
 `nama` varchar(100) ,
 `posisi` varchar(50) ,
 `gaji` decimal(10,2) 
)*/;

/*Table structure for table `view_pegawai_kontrak` */

DROP TABLE IF EXISTS `view_pegawai_kontrak`;

/*!50001 DROP VIEW IF EXISTS `view_pegawai_kontrak` */;
/*!50001 DROP TABLE IF EXISTS `view_pegawai_kontrak` */;

/*!50001 CREATE TABLE  `view_pegawai_kontrak`(
 `id` int(11) ,
 `nama` varchar(100) ,
 `posisi` varchar(50) ,
 `gaji` decimal(10,2) 
)*/;

/*Table structure for table `view_pegawai_tidak_aktif` */

DROP TABLE IF EXISTS `view_pegawai_tidak_aktif`;

/*!50001 DROP VIEW IF EXISTS `view_pegawai_tidak_aktif` */;
/*!50001 DROP TABLE IF EXISTS `view_pegawai_tidak_aktif` */;

/*!50001 CREATE TABLE  `view_pegawai_tidak_aktif`(
 `id` int(11) ,
 `nama` varchar(100) ,
 `posisi` varchar(50) ,
 `gaji` decimal(10,2) 
)*/;

/*View structure for view view_pegawai_dengan_gaji_tinggi */

/*!50001 DROP TABLE IF EXISTS `view_pegawai_dengan_gaji_tinggi` */;
/*!50001 DROP VIEW IF EXISTS `view_pegawai_dengan_gaji_tinggi` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pegawai_dengan_gaji_tinggi` AS select `pegawai`.`id` AS `id`,`pegawai`.`nama` AS `nama`,`pegawai`.`posisi` AS `posisi`,`pegawai`.`gaji` AS `gaji` from `pegawai` where `pegawai`.`gaji` > 10000000 */;

/*View structure for view view_pegawai_gaji_naik */

/*!50001 DROP TABLE IF EXISTS `view_pegawai_gaji_naik` */;
/*!50001 DROP VIEW IF EXISTS `view_pegawai_gaji_naik` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pegawai_gaji_naik` AS select `pegawai`.`id` AS `id`,`pegawai`.`nama` AS `nama`,`pegawai`.`posisi` AS `posisi`,`pegawai`.`gaji` AS `gaji` from `pegawai` where `pegawai`.`posisi` = 'Manager' */;

/*View structure for view view_pegawai_kontrak */

/*!50001 DROP TABLE IF EXISTS `view_pegawai_kontrak` */;
/*!50001 DROP VIEW IF EXISTS `view_pegawai_kontrak` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pegawai_kontrak` AS select `pegawai`.`id` AS `id`,`pegawai`.`nama` AS `nama`,`pegawai`.`posisi` AS `posisi`,`pegawai`.`gaji` AS `gaji` from `pegawai` where `pegawai`.`posisi` = 'Kontrak' */;

/*View structure for view view_pegawai_tidak_aktif */

/*!50001 DROP TABLE IF EXISTS `view_pegawai_tidak_aktif` */;
/*!50001 DROP VIEW IF EXISTS `view_pegawai_tidak_aktif` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pegawai_tidak_aktif` AS select `pegawai`.`id` AS `id`,`pegawai`.`nama` AS `nama`,`pegawai`.`posisi` AS `posisi`,`pegawai`.`gaji` AS `gaji` from `pegawai` where `pegawai`.`posisi` = 'Resign' or `pegawai`.`posisi` = 'Pensiun' */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
