/*
Navicat MySQL Data Transfer

Source Server         : MysqlLocal
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : roger

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-12-28 00:10:41
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_berita
-- ----------------------------
INSERT INTO `tbl_berita` VALUES ('3', 'Festival Pasta', null, 'goyz', '2015-12-26 11:11:41', '<p><span style=\"color: #000000; font-family: Verdana; font-size: small;\"><span style=\"font-weight: bold;\">Hanya&nbsp; dengan&nbsp; Rp.10.000,- anda&nbsp; dapat&nbsp; menikmati&nbsp; menu&nbsp; pasta ( Khas Italian Food ) seperti : spaghetti, fettucini, penne, makaroni, Farfalle, Fusilli, Lasagna, Makaroni&nbsp; Schootel, Dll .</span></span></p>\r\n<h2><span style=\"color: #3366ff; font-family: Comic Sans MS; font-size: small;\"><em>Only&nbsp; Rp.10.000 ,- ++ We&nbsp; will&nbsp; Serving&nbsp; You&nbsp; with&nbsp; all&nbsp; kind&nbsp; of&nbsp; Italian&nbsp; Pasta ( Spaghetti, Fettucini, Penne, Makaroni, Farfalle, Fusilli, Lasagna, Makaroni&nbsp; Schootel, ext .</em></span></h2>\r\n<p><span style=\"font-family: Verdana;\">Setiap hari : Minggu&nbsp; ( Every&nbsp; Sunday ) CAR&nbsp; FREE&nbsp; DAY</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family: Verdana;\">Waktu &nbsp; &nbsp; &nbsp; &nbsp; : Pukul 07.00 Pagi&nbsp; s/d&nbsp; Pukul 10.00 Pagi&nbsp;</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family: Verdana;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( at&nbsp; 07.00 am&nbsp; until 10.00 am ) .</span></p>\r\n<p>Tempat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Halaman&nbsp; Depan&nbsp; Roger\'s&nbsp; Salon&nbsp; Dago , Bandung</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Front Page Roger\'s Salon Dago , Bandung )</p>\r\n<p>&nbsp;</p>', null, null);
INSERT INTO `tbl_berita` VALUES ('4', 'TessssTingg', null, 'goyz', '2015-12-27 22:33:40', '<p>XXXXX</p>', '<p>FFFFFFF</p>', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_gallery
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_product
-- ----------------------------
INSERT INTO `tbl_product` VALUES ('8', 'DAD', null, '1', '<p>dasd</p>', '<p>dasd</p>', '2015-12-27 22:48:44', 'goyz');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_product_foto
-- ----------------------------
INSERT INTO `tbl_product_foto` VALUES ('16', '8', '20151227224844_0.png', '1');

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
INSERT INTO `tbl_services` VALUES ('5', null, 'DADAD', '<p>qwed</p>', '<p>aqsd</p>', '2015-12-27 23:16:02', 'goyz');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_services_foto
-- ----------------------------
INSERT INTO `tbl_services_foto` VALUES ('9', '5', '20151227231602_0.png', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'goyz', 'eRuaCnTE754NHKNbPkeCHItt1ViJh/Nz5coPwx9K80khBoaRJLozwWlVKYpt1DIEjklv65vK83gTrxkwvHZKgw', '1', 'Goyz Crotz', 'goyz87@gmail.com', 'L', '0251-388716', '1');
INSERT INTO `tbl_user` VALUES ('2', 'user', 'eRuaCnTE754NHKNbPkeCHItt1ViJh/Nz5coPwx9K80khBoaRJLozwWlVKYpt1DIEjklv65vK83gTrxkwvHZKgw', '2', 'User Guest', null, 'L', null, '1');
