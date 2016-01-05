/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : rogersalon

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2016-01-05 22:22:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cl_kota`
-- ----------------------------
DROP TABLE IF EXISTS `cl_kota`;
CREATE TABLE `cl_kota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kota` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cl_kota
-- ----------------------------
INSERT INTO `cl_kota` VALUES ('1', 'Jakarta', null, null);
INSERT INTO `cl_kota` VALUES ('2', 'Bandung', null, null);

-- ----------------------------
-- Table structure for `cl_lokasi`
-- ----------------------------
DROP TABLE IF EXISTS `cl_lokasi`;
CREATE TABLE `cl_lokasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cl_kota_id` int(11) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `alamat_ind` text,
  `alamat_eng` text,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `tlp` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cl_lokasi
-- ----------------------------
INSERT INTO `cl_lokasi` VALUES ('1', '1', 'Senopati', 'Jl. Senopati No. 48-50, Kebayoran Baru, Jakarta Selatan', 'Jl. Senopati No. 48-50, Kebayoran Baru, Jakarta Selatan', null, null, '(021) 7203992, 7269025', 'senopati@rogersalon.com', '(021) 7269024');
INSERT INTO `cl_lokasi` VALUES ('2', '1', 'Gunawarman', 'Jl. Gunawarman No. 59, Kebayoran Baru, Jakarta Selatan', 'Jl. Gunawarman No. 59, Kebayoran Baru, Jakarta Selatan', null, null, '(021) 7258652, 7258653', 'gunawarman@rogersalon.com', '(021) 7222728');

-- ----------------------------
-- Table structure for `cl_product_type`
-- ----------------------------
DROP TABLE IF EXISTS `cl_product_type`;
CREATE TABLE `cl_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cl_product_type
-- ----------------------------
INSERT INTO `cl_product_type` VALUES ('1', 'SPA', null, null);

-- ----------------------------
-- Table structure for `cl_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `cl_user_group`;
CREATE TABLE `cl_user_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `group_user` varchar(200) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cl_user_group
-- ----------------------------
INSERT INTO `cl_user_group` VALUES ('1', 'Administrator', '1');
INSERT INTO `cl_user_group` VALUES ('2', 'Guest', '1');

-- ----------------------------
-- Table structure for `tbl_berita`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_berita`;
CREATE TABLE `tbl_berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul_ind` varchar(200) DEFAULT NULL,
  `judul_eng` varchar(200) DEFAULT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `isi_berita_ind` text,
  `isi_berita_eng` text,
  `file_foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_berita
-- ----------------------------
INSERT INTO `tbl_berita` VALUES ('3', 'Festival Pasta Hari Minggu', 'Pasta Festival On Sunday', 'admin', '2016-01-04 11:07:23', '<p><span style=\"color: #000000; font-family: Verdana; font-size: small;\"><span style=\"font-weight: bold;\">Hanya&nbsp; dengan&nbsp; Rp.10.000,- anda&nbsp; dapat&nbsp; menikmati&nbsp; menu&nbsp; pasta ( Khas Italian Food ) seperti : spaghetti, fettucini, penne, makaroni, Farfalle, Fusilli, Lasagna, Makaroni&nbsp; Schootel, Dll .</span></span></p>\r\n<p><span style=\"font-family: Verdana;\">Setiap hari : Minggu&nbsp; ( Setiap Hari Minggu ) CAR&nbsp; FREE&nbsp; DAY</span></p>\r\n<p><span style=\"font-family: Verdana;\">Waktu &nbsp; &nbsp; &nbsp; &nbsp; : Pukul 07.00 Pagi&nbsp; s/d&nbsp; Pukul 10.00 Pagi&nbsp;</span></p>\r\n<p><span style=\"font-family: Verdana;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( at&nbsp; 07.00 am&nbsp; until 10.00 am ) .</span></p>\r\n<p>Tempat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Halaman&nbsp; Depan&nbsp; Roger\'s&nbsp; Salon&nbsp; Dago , Bandung</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Front Page Roger\'s Salon Dago , Bandung )</p>\r\n<p>&nbsp;</p>', '<p><span style=\"color: #3366ff; font-family: Comic Sans MS; font-size: small;\"><em>Only&nbsp; IDR 10.000 ,- ++ We&nbsp; will&nbsp; Serving&nbsp; You&nbsp; with&nbsp; all&nbsp; kind&nbsp; of&nbsp; Italian&nbsp; Pasta ( Spaghetti, Fettucini, Penne, Makaroni, Farfalle, Fusilli, Lasagna, Makaroni&nbsp; Schootel, ext .</em></span></p>\r\n<p><span style=\"font-family: Verdana;\">Setiap hari : Minggu&nbsp; ( Setiap Hari Minggu ) CAR&nbsp; FREE&nbsp; DAY</span></p>\r\n<p><span style=\"font-family: Verdana;\">Waktu &nbsp; &nbsp; &nbsp; &nbsp; : Pukul 07.00 Pagi&nbsp; s/d&nbsp; Pukul 10.00 Pagi&nbsp;</span></p>\r\n<p><span style=\"font-family: Verdana;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( at&nbsp; 07.00 am&nbsp; until 10.00 am ) .</span></p>\r\n<p>Tempat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Halaman&nbsp; Depan&nbsp; Roger\'s&nbsp; Salon&nbsp; Dago , Bandung</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Front Page Roger\'s Salon Dago , Bandung )</p>\r\n<p>&nbsp;</p>', '20160104110723_news.jpg');
INSERT INTO `tbl_berita` VALUES ('5', 'Special Promo Spa Diskon 30%', 'Special Promo On Spa Services Discount 30%', 'admin', '2015-12-28 20:19:44', '<p><span style=\"color: #000000; font-family: Verdana; font-size: small;\"><span style=\"font-weight: bold;\">Diskon 30% untuk layanan Spa dengan menunjukkan kartu pelajar atau identitas<br /></span></span></p>\r\n<p><span style=\"font-family: Verdana;\">Tanggal&nbsp; : 20 Januari 2016 - 21 Januari 2016<br /></span></p>\r\n<p><span style=\"font-family: Verdana;\">Waktu &nbsp; &nbsp; &nbsp; &nbsp; : Pukul 07.00 Pagi&nbsp; s/d&nbsp; Pukul 10.00 Pagi&nbsp;</span></p>\r\n<p><span style=\"font-family: Verdana;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( at&nbsp; 07.00 am&nbsp; until 10.00 am ) .</span></p>\r\n<p>Tempat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Halaman&nbsp; Depan&nbsp; Roger\'s&nbsp; Salon&nbsp; Dago , Bandung</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Front Page Roger\'s Salon Dago , Bandung )</p>\r\n<p>&nbsp;</p>', '<p><span style=\"color: #000000; font-family: Verdana; font-size: small;\"><span style=\"font-weight: bold;\">Special Promo On Spa Service with Diskon 30%.<br /></span></span></p>\r\n<p><span style=\"font-family: Verdana;\">Date&nbsp; : 20 Januari 2016 - 21 Januari 2016<br /></span></p>\r\n<p><span style=\"font-family: Verdana;\">Time &nbsp; &nbsp; &nbsp; &nbsp; : Pukul 07.00 Pagi&nbsp; s/d&nbsp; Pukul 10.00 Pagi&nbsp;</span></p>\r\n<p><span style=\"font-family: Verdana;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( at&nbsp; 07.00 am&nbsp; until 10.00 am ) .</span></p>\r\n<p>Place &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Halaman&nbsp; Depan&nbsp; Roger\'s&nbsp; Salon&nbsp; Dago , Bandung</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Front Page Roger\'s Salon Dago , Bandung )</p>\r\n<p>&nbsp;</p>', '20151228201944_news.jpeg');
INSERT INTO `tbl_berita` VALUES ('6', 'Diskon Perawatan Wajah', 'Special Promo FaceCare', 'admin', '2015-12-28 20:19:22', '<p><span style=\"color: #000000; font-family: Verdana; font-size: small;\"><span style=\"font-weight: bold;\">Promo diskon 70% untuk pembelian layanan perawatan wajah<br /></span></span></p>\r\n<p><span style=\"font-family: Verdana;\">Date&nbsp; : 20 Januari 2016 - 21 Januari 2016<br /></span></p>\r\n<p><span style=\"font-family: Verdana;\">Time &nbsp; &nbsp; &nbsp; &nbsp; : Pukul 07.00 Pagi&nbsp; s/d&nbsp; Pukul 10.00 Pagi&nbsp;</span></p>\r\n<p><span style=\"font-family: Verdana;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( at&nbsp; 07.00 am&nbsp; until 10.00 am ) .</span></p>\r\n<p>Place &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Halaman&nbsp; Depan&nbsp; Roger\'s&nbsp; Salon&nbsp; Dago , Bandung</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Front Page Roger\'s Salon Dago , Bandung )</p>\r\n<p>&nbsp;</p>', '<p><span style=\"color: #000000; font-family: Verdana; font-size: small;\"><span style=\"font-weight: bold;\">Special Promo On FaceCare in Clinic Service with Diskon 30%.<br /></span></span></p>\r\n<p><span style=\"font-family: Verdana;\">Date&nbsp; : 22 Januari 2016 - 27 Januari 2016<br /></span></p>\r\n<p><span style=\"font-family: Verdana;\">Time &nbsp; &nbsp; &nbsp; &nbsp; : Pukul 07.00 Pagi&nbsp; s/d&nbsp; Pukul 10.00 Pagi&nbsp;</span></p>\r\n<p><span style=\"font-family: Verdana;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( at&nbsp; 07.00 am&nbsp; until 10.00 am ) .</span></p>\r\n<p>Place &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Halaman&nbsp; Depan&nbsp; Roger\'s&nbsp; Salon&nbsp; Dago , Bandung</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Front Page Roger\'s Salon Dago , Bandung )</p>\r\n<p>&nbsp;</p>', '20151228201922_news.jpg');

-- ----------------------------
-- Table structure for `tbl_gallery`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gallery`;
CREATE TABLE `tbl_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cl_lokasi_id` int(11) DEFAULT NULL,
  `file_foto` varchar(100) DEFAULT NULL,
  `flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_gallery
-- ----------------------------
INSERT INTO `tbl_gallery` VALUES ('5', '1', '20151229191715_0.jpeg', '1');
INSERT INTO `tbl_gallery` VALUES ('6', '1', '20151229191715_1.jpeg', '1');
INSERT INTO `tbl_gallery` VALUES ('7', '1', '20151229191715_2.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('8', '1', '20151229191715_3.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('9', '1', '20151229191715_4.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('11', '1', '20151229191737_1.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('12', '1', '20151229191737_2.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('13', '1', '20151229191737_3.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('14', '1', '20151229191737_4.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('15', '1', '20151229191857_0.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('16', '1', '20151229191857_1.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('17', '1', '20151229191858_2.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('18', '1', '20151229191858_3.jpg', '1');

-- ----------------------------
-- Table structure for `tbl_newslatter`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_newslatter`;
CREATE TABLE `tbl_newslatter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_newslatter
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_product`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_product_ind` varchar(200) DEFAULT NULL,
  `nama_product_eng` varchar(200) DEFAULT NULL,
  `cl_product_type_id` int(11) DEFAULT NULL,
  `deskripsi_ind` text,
  `deskripsi_eng` text,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_product
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_product_foto`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product_foto`;
CREATE TABLE `tbl_product_foto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_product_id` int(11) DEFAULT NULL,
  `file_foto` varchar(100) DEFAULT NULL,
  `flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_product_foto
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_reservasi`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reservasi`;
CREATE TABLE `tbl_reservasi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cl_lokasi_id` int(11) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `id_member` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `cl_product_type` int(11) DEFAULT NULL,
  `request` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_reservasi
-- ----------------------------
INSERT INTO `tbl_reservasi` VALUES ('1', '1', 'Goyz', '11-0112', '332123', 'goyz87@gmail.com', '2015-12-27 23:26:54', '1', 'Testing Coyzzzz');

-- ----------------------------
-- Table structure for `tbl_services`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_services`;
CREATE TABLE `tbl_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto_icon` varchar(255) DEFAULT NULL,
  `nama_service_eng` varchar(200) DEFAULT NULL,
  `nama_service_ind` varchar(200) DEFAULT NULL,
  `deskripsi_eng` text,
  `deskripsi_ind` text,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_services
-- ----------------------------
INSERT INTO `tbl_services` VALUES ('1', '20151228131713_Salon.png', 'Salon', 'Salon', '<p>Description Of Salon</p>', '<p>Deskripsi dari Layanan Salon</p>', '2015-12-28 17:44:21', 'admin');
INSERT INTO `tbl_services` VALUES ('2', '20151228131854_Klinik.png', 'Clinic', 'Klinik', '<p>Description Of Clinic</p>', '<p>Deskripsi dari Layanan Klinik</p>', '2015-12-28 13:18:54', 'admin');
INSERT INTO `tbl_services` VALUES ('3', '20151228132014_Spa.png', 'Spa', 'Spa', '<p>Description Of Spa</p>', '<p>Deskripsi dari Layanan Spa</p>', '2015-12-28 13:20:14', 'admin');
INSERT INTO `tbl_services` VALUES ('4', '20151228132209_Pusat Kebugaran.png', 'Wellness Centre', 'Pusat Kebugaran', '<p>Description Of Wellness Centre</p>', '<p>Deskripsi dari Layanan Pusat Kebugaran..</p>', '2015-12-28 13:22:09', 'admin');
INSERT INTO `tbl_services` VALUES ('5', '20151228132556_Kafe & Lounge.png', 'Cafeteria', 'kafetaria', '<p>Description Of Cafe &amp; Lounge</p>', '<p>Deskripsi dari Layanan Kafe dan Lounge</p>', '2015-12-30 04:19:51', 'admin');

-- ----------------------------
-- Table structure for `tbl_services_foto`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_services_foto`;
CREATE TABLE `tbl_services_foto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_services_id` int(11) DEFAULT NULL,
  `file_foto` varchar(200) DEFAULT NULL,
  `flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_services_foto
-- ----------------------------
INSERT INTO `tbl_services_foto` VALUES ('1', '1', '20151228131713_0.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('2', '1', '20151228131713_1.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('3', '1', '20151228131713_2.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('4', '1', '20151228131713_3.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('5', '2', '20151228131854_0.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('6', '2', '20151228131854_1.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('7', '2', '20151228131854_2.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('8', '3', '20151228132014_0.jpeg', '1');
INSERT INTO `tbl_services_foto` VALUES ('9', '3', '20151228132014_1.jpeg', '1');
INSERT INTO `tbl_services_foto` VALUES ('10', '3', '20151228132014_2.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('11', '4', '20151228132209_0.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('12', '4', '20151228132209_1.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('13', '4', '20151228132209_2.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('14', '4', '20151228132209_3.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('15', '5', '20151228132556_0.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('16', '5', '20151228132556_1.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('17', '5', '20151228132556_2.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('18', '5', '20151228132556_3.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('19', '1', '20151228174321_0.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('20', '1', '20151228174321_1.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('21', '1', '20151228174321_2.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('22', '1', '20151228174321_3.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('23', '1', '20151228174421_0.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('24', '1', '20151228174421_1.jpg', '1');
INSERT INTO `tbl_services_foto` VALUES ('25', '1', '20151228174421_2.jpg', '1');

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `cl_user_group_id` smallint(6) DEFAULT NULL,
  `nama_lengkap` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `jenis_kelamin` varchar(1) DEFAULT NULL,
  `tlp` varchar(15) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'admin', 'w8nRgzJ8q9W6/04js1nnJwKOHTideqmajzAcg7qmotOyPsh99akca9HqPPuK9U0A8po69U8txljPE/dGpyPTNg==', '1', 'Goyz Crotz', 'goyz87@gmail.com', 'L', '0251-388716', '1');
INSERT INTO `tbl_user` VALUES ('2', 'user', 'w8nRgzJ8q9W6/04js1nnJwKOHTideqmajzAcg7qmotOyPsh99akca9HqPPuK9U0A8po69U8txljPE/dGpyPTNg==', '2', 'User Guest', null, 'L', null, '1');
INSERT INTO `tbl_user` VALUES ('4', 'user_2', 'R2s+MzlfaarWwB2lVu9qQX5V1jEjKvkfMuZHnmzayO2kB4Engg9px0X3OtpYlhMx1ADCOlkDcC3pvjo5OvIlMg==', '2', 'User Guest 2', 'guest@gmail.com', 'L', '021-99889898', '1');
