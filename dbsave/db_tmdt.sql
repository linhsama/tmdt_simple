-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_tmdt
CREATE DATABASE IF NOT EXISTS `db_tmdt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `db_tmdt`;

-- Dumping structure for table db_tmdt.anhsp
CREATE TABLE IF NOT EXISTS `anhsp` (
  `maanh` int(11) NOT NULL AUTO_INCREMENT,
  `hinhanh` varchar(255) NOT NULL,
  `masp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`maanh`) USING BTREE,
  KEY `FK_anhsp_sanpham` (`masp`),
  CONSTRAINT `FK_anhsp_sanpham` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.anhsp: ~10 rows (approximately)
INSERT INTO `anhsp` (`maanh`, `hinhanh`, `masp`) VALUES
	(1, 'uploads/1/ss1_1706723500.png', 1),
	(2, 'uploads/1/ss2_1706723500.png', 1),
	(3, 'uploads/1/ss3_1706723500.png', 1),
	(4, 'uploads/1/ss4_1706723500.png', 1),
	(5, 'uploads/1/ss5_1706723500.png', 1),
	(6, 'uploads/2/s1_1706723820.png', 2),
	(7, 'uploads/2/s2_1706723820.png', 2),
	(8, 'uploads/2/s3_1706723820.png', 2),
	(9, 'uploads/2/s4_1706723820.png', 2),
	(10, 'uploads/2/s5_1706723820.png', 2),
	(11, 'uploads/3/1_1706725572.png', 3),
	(12, 'uploads/3/2_1706725572.png', 3),
	(13, 'uploads/3/3_1706725572.png', 3),
	(14, 'uploads/3/4_1706725572.png', 3),
	(15, 'uploads/3/5_1706725572.png', 3),
	(16, 'uploads/4/1_1706725678.png', 4),
	(17, 'uploads/4/2_1706725678.png', 4),
	(18, 'uploads/4/3_1706725678.png', 4),
	(19, 'uploads/4/4_1706725678.png', 4),
	(20, 'uploads/4/5_1706725678.png', 4),
	(21, 'uploads/5/1_1706725776.png', 5),
	(22, 'uploads/5/2_1706725776.png', 5),
	(23, 'uploads/5/3_1706725776.png', 5),
	(24, 'uploads/5/4_1706725776.png', 5),
	(25, 'uploads/5/5_1706725776.png', 5),
	(26, 'uploads/6/1_1706725861.png', 6),
	(27, 'uploads/6/2_1706725861.png', 6),
	(28, 'uploads/6/3_1706725861.png', 6),
	(29, 'uploads/6/4_1706725861.png', 6),
	(30, 'uploads/6/5_1706725861.png', 6);

-- Dumping structure for table db_tmdt.chitietdonhang
CREATE TABLE IF NOT EXISTS `chitietdonhang` (
  `mactdh` int(11) NOT NULL AUTO_INCREMENT,
  `madon` int(11) DEFAULT NULL,
  `masp` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `dongia` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`mactdh`),
  KEY `FK_chitietdonhang_donhang` (`madon`),
  KEY `FK_chitietdonhang_sanpham` (`masp`),
  CONSTRAINT `FK_chitietdonhang_donhang` FOREIGN KEY (`madon`) REFERENCES `donhang` (`madon`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_chitietdonhang_sanpham` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tmdt.chitietdonhang: ~3 rows (approximately)
INSERT INTO `chitietdonhang` (`mactdh`, `madon`, `masp`, `soluong`, `dongia`) VALUES
	(4, 2, 9, 20, 200000.00),
	(5, 2, 10, 10, 23000000.00),
	(6, 1, 9, 1, 180000.00);

-- Dumping structure for table db_tmdt.chitiettrangthai
CREATE TABLE IF NOT EXISTS `chitiettrangthai` (
  `machitiet` int(11) NOT NULL AUTO_INCREMENT,
  `madon` int(11) NOT NULL,
  `matt` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  `ngaytao` datetime NOT NULL,
  PRIMARY KEY (`machitiet`),
  KEY `FK_chitiettrangthai_donhang` (`madon`),
  KEY `FK_chitiettrangthai_nhanvien` (`manv`),
  KEY `FK_chitiettrangthai_trangthai` (`matt`) USING BTREE,
  CONSTRAINT `FK_chitiettrangthai_donhang` FOREIGN KEY (`madon`) REFERENCES `donhang` (`madon`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_chitiettrangthai_nhanvien` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_chitiettrangthai_trangthai` FOREIGN KEY (`matt`) REFERENCES `trangthai` (`matt`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.chitiettrangthai: ~3 rows (approximately)
INSERT INTO `chitiettrangthai` (`machitiet`, `madon`, `matt`, `manv`, `ngaytao`) VALUES
	(1, 1, 2, 2, '2024-01-31 02:52:45'),
	(2, 1, 3, 2, '2024-01-31 02:53:06'),
	(4, 2, 2, 2, '0000-00-00 00:00:00');

-- Dumping structure for table db_tmdt.donhang
CREATE TABLE IF NOT EXISTS `donhang` (
  `madon` int(11) NOT NULL AUTO_INCREMENT,
  `ngaydat` datetime NOT NULL DEFAULT current_timestamp(),
  `makh` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  PRIMARY KEY (`madon`) USING BTREE,
  KEY `FK_donhang_nhanvien` (`manv`),
  KEY `FK_donhang_khachhang` (`makh`) USING BTREE,
  CONSTRAINT `FK_donhang_khachhang` FOREIGN KEY (`makh`) REFERENCES `khachhang` (`makh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_donhang_nhanvien` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.donhang: ~0 rows (approximately)

-- Dumping structure for table db_tmdt.khachhang
CREATE TABLE IF NOT EXISTS `khachhang` (
  `makh` int(11) NOT NULL AUTO_INCREMENT,
  `tenkh` varchar(255) NOT NULL,
  `gioitinh` tinyint(1) NOT NULL DEFAULT 0,
  `ngaysinh` date NOT NULL,
  `sodienthoai` varchar(10) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`makh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.khachhang: ~2 rows (approximately)
INSERT INTO `khachhang` (`makh`, `tenkh`, `gioitinh`, `ngaysinh`, `sodienthoai`, `diachi`, `email`, `password`, `trangthai`) VALUES
	(2, 'kh1', 0, '2024-01-31', '0000000000', 'cr', 'kh1@gmail.com', '123456', 1),
	(3, 'kh2', 0, '2024-01-31', '1111111111', 'ct', 'kh2@gmaul.com', '111111', 1);

-- Dumping structure for table db_tmdt.loaisp
CREATE TABLE IF NOT EXISTS `loaisp` (
  `maloai` int(11) NOT NULL AUTO_INCREMENT,
  `tenloai` varchar(255) NOT NULL,
  `mota` text NOT NULL,
  PRIMARY KEY (`maloai`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.loaisp: ~4 rows (approximately)
INSERT INTO `loaisp` (`maloai`, `tenloai`, `mota`) VALUES
	(1, 'Điện thoại', 'Điện thoại'),
	(2, 'Máy tính bảng', 'Máy tính bảng'),
	(3, 'Laptop', 'Laptop'),
	(4, 'Phụ kiện', 'Phụ kiện');

-- Dumping structure for table db_tmdt.loaithuonghieu
CREATE TABLE IF NOT EXISTS `loaithuonghieu` (
  `malth` int(11) NOT NULL AUTO_INCREMENT,
  `maloai` int(11) NOT NULL DEFAULT 0,
  `math` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`malth`) USING BTREE,
  KEY `FK_loaithuonghieu_loaisp` (`maloai`),
  KEY `FK_loaithuonghieu_thuonghieu` (`math`),
  CONSTRAINT `FK_loaithuonghieu_loaisp` FOREIGN KEY (`maloai`) REFERENCES `loaisp` (`maloai`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_loaithuonghieu_thuonghieu` FOREIGN KEY (`math`) REFERENCES `thuonghieu` (`math`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.loaithuonghieu: ~2 rows (approximately)
INSERT INTO `loaithuonghieu` (`malth`, `maloai`, `math`) VALUES
	(1, 1, 1),
	(2, 1, 2);

-- Dumping structure for table db_tmdt.nhanvien
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `manv` int(11) NOT NULL AUTO_INCREMENT,
  `tennv` varchar(255) NOT NULL,
  `gioitinh` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: nam, 1:nữ',
  `ngaysinh` date NOT NULL,
  `sodienthoai` varchar(10) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT 1,
  `phanquyen` int(11) NOT NULL DEFAULT 1 COMMENT '0:admin, 1: manager 2:nhân viên, 3: khách hàng',
  PRIMARY KEY (`manv`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.nhanvien: ~2 rows (approximately)
INSERT INTO `nhanvien` (`manv`, `tennv`, `gioitinh`, `ngaysinh`, `sodienthoai`, `diachi`, `email`, `password`, `trangthai`, `phanquyen`) VALUES
	(1, 'admin', 0, '2024-01-30', '0000000000', 'sys', 'admin@gmail.com', 'admin', 1, 0),
	(2, 'nv2', 0, '2024-01-25', '0903891208', 'ád', 'levulinh.dev@gmail.com', '123', 1, 2),
	(3, 'ádkl', 0, '2024-01-31', '0903891208', 'ád', 'dev@gmail.com', '123', 1, 1);

-- Dumping structure for table db_tmdt.sanpham
CREATE TABLE IF NOT EXISTS `sanpham` (
  `masp` int(11) NOT NULL AUTO_INCREMENT,
  `tensp` varchar(255) NOT NULL,
  `dongia` decimal(10,2) NOT NULL,
  `mota` text NOT NULL,
  `ngaythem` datetime NOT NULL DEFAULT current_timestamp(),
  `trangthai` tinyint(1) NOT NULL DEFAULT 1,
  `luotthich` int(11) NOT NULL DEFAULT 0,
  `luotmua` int(11) NOT NULL DEFAULT 0,
  `luotxem` int(11) NOT NULL DEFAULT 0,
  `math` int(11) NOT NULL,
  `maloai` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`masp`),
  KEY `FK_sanpham_thuonghieu` (`math`),
  KEY `FK_sanpham_loaisp` (`maloai`),
  CONSTRAINT `FK_sanpham_loaisp` FOREIGN KEY (`maloai`) REFERENCES `loaisp` (`maloai`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sanpham_thuonghieu` FOREIGN KEY (`math`) REFERENCES `thuonghieu` (`math`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_tmdt.sanpham: ~0 rows (approximately)
INSERT INTO `sanpham` (`masp`, `tensp`, `dongia`, `mota`, `ngaythem`, `trangthai`, `luotthich`, `luotmua`, `luotxem`, `math`, `maloai`) VALUES
	(1, 'Điện thoại Samsung Galaxy S23 Plus 5G (8GB/256GB)', 15490000.00, '<table cellspacing="0" style="border-collapse:collapse; width:505px">\r\n	<tbody>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap; width:226px"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Th&ocirc;ng tin chi tiết</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap; width:278px">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Thương hiệu:&nbsp;</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Samsung</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Xuất xứ thương hiệu:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">H&agrave;n Quốc</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Camera sau:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Ch&iacute;nh 50 MP v&agrave; Phụ 12 MP, 10 MP</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Camera trước:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">MP</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Chip set:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Snapdragon 8 Gen 2 for Galaxy</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Dynamic AMOLED 2X</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Phụ kiện đi k&egrave;m:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">C&aacute;p Type C, C&acirc;y lấy sim, Hộp, S&aacute;ch hướng dẫn</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Xuất xứ (Made in):</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Trung Quốc</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">RAM:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">8GB</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Độ ph&acirc;n giải:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Full HD+ (1080 x 2340 Pixels)</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">ROM:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">256GB</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">K&iacute;ch thước m&agrave;n h&igrave;nh:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">6.6 inch</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Sản phẩm c&oacute; được bảo h&agrave;nh kh&ocirc;ng?:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">C&oacute;</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">H&igrave;nh thức bảo h&agrave;nh:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Điện tử</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Thời gian bảo h&agrave;nh</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">12 th&aacute;ng</span></span></span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2024-02-01 00:40:37', 1, 0, 0, 0, 2, 1),
	(2, 'Điện thoại AI Samsung Galaxy S24 Ultra, Camera 200MP Zoom 100x, S Pen - Hàng Chính Hãng', 33950000.00, '<table cellspacing="0" style="border-collapse:collapse; width:293px">\r\n	<tbody>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:21px; vertical-align:bottom; white-space:nowrap; width:230px"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Th&ocirc;ng tin chi tiết</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap; width:64px">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Sản phẩm c&oacute; được bảo h&agrave;nh kh&ocirc;ng?:&nbsp;</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">C&oacute;</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">C&oacute; thuế VAT:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">C&oacute;</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">H&igrave;nh thức bảo h&agrave;nh:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Điện tử</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Thời gian bảo h&agrave;nh:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">12</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Dung lượng pin:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">5000 mAh</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Bluetooth:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">v5.3</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Thương hiệu:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Samsung</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Xuất xứ thương hiệu:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">H&agrave;n Quốc</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Camera sau:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">12MP,200MP,50MP</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Camera trước:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">12MP</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Chip đồ họa (GPU):</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Adreno 750</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Đ&egrave;n Flash:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">C&oacute;</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">K&iacute;ch thước:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">D&agrave;i 147 mm - Ngang 70.6 mm - D&agrave;y 7.6 mm - Nặng 167 g</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">QHD+ Dynamic AMOLED 2X</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Hỗ trợ 5G:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">C&oacute;</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Phụ kiện đi k&egrave;m:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">S&aacute;ch hướng dẫn</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Model:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">S24 Ultra</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Số sim:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">2</span></span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; height:19px; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><strong><span style="color:black"><span style="font-family:Calibri,sans-serif">Loại pin:</span></span></strong></span></td>\r\n			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:bottom; white-space:nowrap"><span style="font-size:15px"><span style="color:black"><span style="font-family:Calibri,sans-serif">Li-Ion</span></span></span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2024-02-01 00:57:00', 1, 0, 0, 0, 2, 1),
	(3, 'Apple iPad Air (5th Gen) Wi-Fi, 2022', 13650000.00, '<p>Đang cập nhật...</p>\r\n', '2024-02-01 01:26:12', 1, 0, 0, 0, 1, 2),
	(4, 'Bộ Kích Sóng Wifi Xiaomi Repeater Pro - Hàng Nhập Khẩu', 249000.00, '<p>Đang cập nhật...</p>\r\n', '2024-02-01 01:27:58', 1, 0, 0, 0, 3, 4),
	(5, 'MacBook Air M1 13 inch 2020', 19540000.00, '<p>Đang cập nhật...</p>\r\n', '2024-02-01 01:29:36', 1, 0, 0, 0, 1, 3),
	(6, 'Laptop Asus ExpertBook B1500 (Chip Intel Core i5-1235U | RAM 16GB | SSD 512GB NVMe | 15.6\' Full HD | Bảo mật vân tay | Bảo mật TPM 2.0 | Độ bền chuẩn quân đội US) - Hàng Chính Hãng', 1690000.00, '<p>Đang cập nhật...</p>\r\n', '2024-02-01 01:31:01', 1, 0, 0, 0, 5, 3);

-- Dumping structure for table db_tmdt.thuonghieu
CREATE TABLE IF NOT EXISTS `thuonghieu` (
  `math` int(11) NOT NULL AUTO_INCREMENT,
  `tenth` varchar(255) NOT NULL,
  `mota` text NOT NULL,
  PRIMARY KEY (`math`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.thuonghieu: ~7 rows (approximately)
INSERT INTO `thuonghieu` (`math`, `tenth`, `mota`) VALUES
	(1, 'Apple', 'Apple'),
	(2, 'Samsung', 'Samsung'),
	(3, 'Xiaomi', 'Xiaomi'),
	(4, 'Realme', 'Realme'),
	(5, 'Asus', 'Asus'),
	(6, 'Nokia', 'Nokia'),
	(7, 'Vivo', 'Vivo');

-- Dumping structure for table db_tmdt.trangthai
CREATE TABLE IF NOT EXISTS `trangthai` (
  `matt` int(11) NOT NULL AUTO_INCREMENT,
  `tentt` varchar(255) NOT NULL,
  `mota` text NOT NULL,
  PRIMARY KEY (`matt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.trangthai: ~2 rows (approximately)
INSERT INTO `trangthai` (`matt`, `tentt`, `mota`) VALUES
	(2, 'Đang chờ', 'kjh'),
	(3, 'Đã giao', '');

-- Dumping structure for table db_tmdt.tuongtac
CREATE TABLE IF NOT EXISTS `tuongtac` (
  `matuongtac` int(11) NOT NULL AUTO_INCREMENT,
  `ngaytuongtac` datetime NOT NULL DEFAULT current_timestamp(),
  `noidung` text NOT NULL,
  `rating` int(11) NOT NULL,
  `loaituongtac` tinyint(4) NOT NULL,
  `masp` int(11) NOT NULL,
  `makh` int(11) NOT NULL,
  PRIMARY KEY (`matuongtac`) USING BTREE,
  KEY `FK_tuong_tac_chapter` (`masp`) USING BTREE,
  KEY `FK_tuong_tac_tai_khoan` (`makh`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_tmdt.tuongtac: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
