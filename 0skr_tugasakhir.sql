/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50620
 Source Host           : localhost:3306
 Source Schema         : 0skr_tugasakhir

 Target Server Type    : MySQL
 Target Server Version : 50620
 File Encoding         : 65001

 Date: 20/07/2018 04:03:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for akademik
-- ----------------------------
DROP TABLE IF EXISTS `akademik`;
CREATE TABLE `akademik`  (
  `id` int(5) NOT NULL,
  `nip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_akademik` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of akademik
-- ----------------------------
INSERT INTO `akademik` VALUES (1, '11111', 'Akademik TA', 'akademikta@gmail.com', '08312131212');

-- ----------------------------
-- Table structure for dosen
-- ----------------------------
DROP TABLE IF EXISTS `dosen`;
CREATE TABLE `dosen`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_dosen` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_hp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dosen
-- ----------------------------
INSERT INTO `dosen` VALUES (1, '11111', 'Dosen 1, S.Kom', 'dosen1@gmail.com', '082131231');
INSERT INTO `dosen` VALUES (2, '22222', 'Dosen 2, S.Kom', 'dosen1@gmail.com', '0852131212');
INSERT INTO `dosen` VALUES (3, '33333', 'Dosen 3, S.Kom', 'dosen3@gmail.com', '0832131212');
INSERT INTO `dosen` VALUES (4, '44444', 'Dosen 4, S.Kom', 'dosen4@gmail.com', '0823123123');
INSERT INTO `dosen` VALUES (5, '55555', 'Dosen 5, S.Kom', 'dosen5@gmail.com', '08213121312');

-- ----------------------------
-- Table structure for judul
-- ----------------------------
DROP TABLE IF EXISTS `judul`;
CREATE TABLE `judul`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `mhsid` int(5) NOT NULL,
  `judul` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pembimbing` int(5) NOT NULL,
  `penguji1` int(5) NULL DEFAULT NULL,
  `penguji2` int(5) NULL DEFAULT NULL,
  `status` tinyint(5) NOT NULL COMMENT '0=arsip; 1=belum diajukan; 2=sudah diajukan; 3=sudah diacc',
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for judul_detail
-- ----------------------------
DROP TABLE IF EXISTS `judul_detail`;
CREATE TABLE `judul_detail`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_judul` int(5) NOT NULL,
  `ringkas_masalah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `metode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `judul_id`(`id_judul`) USING BTREE,
  CONSTRAINT `judul_id` FOREIGN KEY (`id_judul`) REFERENCES `judul` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `fakultas` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jurusan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (1, 'Ilmu Komputer', 'Teknik Informatika');
INSERT INTO `jurusan` VALUES (2, 'Ilmu Komputer', 'Sistem Informasi');

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_mhs` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jurusan` int(5) NOT NULL,
  `email` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES (1, '11111001', 'Mahasiswa 1', 1, 'mahasiswa1@gmail.com');
INSERT INTO `mahasiswa` VALUES (2, '11111002', 'Mahasiswa 2', 1, 'mahasiswa2@gmail.com');
INSERT INTO `mahasiswa` VALUES (3, '11111003', 'Mahasiswa 3', 1, 'mahasiswa1@gmail.com');
INSERT INTO `mahasiswa` VALUES (4, '11111004', 'Mahasiswa 4', 2, 'mahasiswa@gmail.com');
INSERT INTO `mahasiswa` VALUES (5, '11111005', 'Mahasiswa 5', 2, 'mahasiswa5@gmail.com');

-- ----------------------------
-- Table structure for pengajuan
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan`;
CREATE TABLE `pengajuan`  (
  `id` int(5) NOT NULL,
  `judulid` int(5) NOT NULL,
  `mhsid` int(5) NOT NULL,
  `tanggal_pengajuan` datetime(6) NOT NULL,
  `status` tinyint(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for seminar
-- ----------------------------
DROP TABLE IF EXISTS `seminar`;
CREATE TABLE `seminar`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  `judulid` int(5) NOT NULL,
  `mhsid` int(5) NOT NULL,
  `nilai_pembimbing` int(5) NULL DEFAULT NULL,
  `nilai_penguji1` int(5) NULL DEFAULT NULL,
  `nilai_penguji2` int(5) NULL DEFAULT NULL,
  `status_pengajuan` tinyint(5) NOT NULL COMMENT '0=arsip;1=ready;2=diajukan;3=acc',
  `status` tinyint(5) NOT NULL COMMENT '0-tidak lulus;1=lulus',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sidang
-- ----------------------------
DROP TABLE IF EXISTS `sidang`;
CREATE TABLE `sidang`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  `judulid` int(5) NOT NULL,
  `mhsid` int(5) NOT NULL,
  `nilai_pembimbing` int(5) NULL DEFAULT NULL,
  `nilai_penguji1` int(5) NULL DEFAULT NULL,
  `nilai_penguji2` int(5) NULL DEFAULT NULL,
  `status_pengajuan` tinyint(5) NOT NULL COMMENT '0=arsip;1=ready;2=diajukan;3=acc',
  `status` tinyint(5) NOT NULL COMMENT '0-tidak lulus;1=lulus',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis_user` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'akademik; mahasiswa; dosen;',
  `userid` int(5) NOT NULL,
  `username` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `last_login` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (5, 'mahasiswa', 1, '11111001', 'd969b436bdf5d694384ab43bcb26351c', '2018-07-20 03:49:58.000000', '2018-07-20 03:56:39.932394', NULL);
INSERT INTO `user` VALUES (6, 'mahasiswa', 2, '11111002', '20abd8a2643f34feee2705ed712e8348', '2018-07-20 03:51:00.000000', '2018-07-20 03:56:45.683050', NULL);
INSERT INTO `user` VALUES (7, 'mahasiswa', 3, '11111003', 'd85e8aaca1c4d60e148f95a890da8218', '2018-07-20 03:51:24.000000', '2018-07-20 03:56:51.751812', NULL);
INSERT INTO `user` VALUES (8, 'akademik', 1, 'akademik', '0b5652714faf87700d60a912f753cc55', '2018-07-20 03:52:26.000000', '2018-07-20 03:56:58.085434', NULL);
INSERT INTO `user` VALUES (9, 'dosen', 1, 'dosen1', 'f499263a253447dd5cb68dafb9f13235', '2018-07-20 03:55:47.000000', '2018-07-20 03:57:03.350468', '0000-00-00 00:00:00.000000');
INSERT INTO `user` VALUES (10, 'dosen', 2, 'dosen2', 'ac41c4e0e6ef7ac51f0c8f3895f82ce5', '2018-07-20 03:55:52.000000', '2018-07-20 03:57:07.676412', '0000-00-00 00:00:00.000000');
INSERT INTO `user` VALUES (11, 'dosen', 3, 'dosen3', '1192feff42fadff1d7e0aa1210fed1e3', '2018-07-20 03:55:57.000000', '2018-07-20 03:57:13.667278', '0000-00-00 00:00:00.000000');
INSERT INTO `user` VALUES (12, 'dosen', 4, 'dosen4', 'd3a0a76dd6fe8e4935d0f3bcc8b9ca63', '2018-07-20 03:56:03.000000', '2018-07-20 03:57:17.497082', '0000-00-00 00:00:00.000000');
INSERT INTO `user` VALUES (13, 'dosen', 5, 'dosen5', '9cc22c7f0fbb92caa139ded4f21ff8c8', '2018-07-20 03:56:08.000000', '2018-07-20 03:57:22.346865', '0000-00-00 00:00:00.000000');

SET FOREIGN_KEY_CHECKS = 1;
