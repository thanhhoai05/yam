-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 29, 2024 lúc 11:30 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `yam`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(10) NOT NULL COMMENT 'id hóa đơn',
  `id_user` int(10) NOT NULL COMMENT 'mã KH',
  `ma_donhang` varchar(20) NOT NULL COMMENT 'Mã hóa đơn',
  `nguoinhan_ten` varchar(255) DEFAULT NULL COMMENT 'Tên người nhận',
  `nguoinhan_diachi` varchar(255) DEFAULT NULL COMMENT 'địa chỉ nhận',
  `nguoinhan_sdt` int(10) DEFAULT NULL COMMENT 'SĐT nhận',
  `nguoinhan_email` varchar(50) NOT NULL,
  `pt_thanhtoan` tinyint(1) DEFAULT 0 COMMENT '0:POD 1:OP ',
  `voucher` varchar(10) DEFAULT NULL,
  `ship` int(5) NOT NULL DEFAULT 0 COMMENT 'tiền giao hàng',
  `tong_thanhtoan` int(10) NOT NULL,
  `ngay_dat_hang` date DEFAULT NULL,
  `order_notes` varchar(200) DEFAULT NULL,
  `trangthai` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billchitiet`
--

CREATE TABLE `billchitiet` (
  `id` int(10) NOT NULL COMMENT 'ID chi tiết hóa đơn',
  `id_bill` int(10) NOT NULL COMMENT 'Mã hóa đơn',
  `id_product` int(9) NOT NULL COMMENT 'Mã sản phẩm',
  `id_user` int(11) NOT NULL,
  `so_luong` int(3) NOT NULL COMMENT 'Số lượng',
  `gia` int(10) NOT NULL COMMENT 'Giá',
  `thanh_tien` int(10) NOT NULL COMMENT 'Thành tiền'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(10) NOT NULL,
  `id_product` int(10) NOT NULL COMMENT 'Mã sản phẩm',
  `id_user` int(10) NOT NULL COMMENT 'Mã khác hàng',
  `noi_dung` text NOT NULL COMMENT 'Nội dung',
  `ngay_bl` varchar(25) NOT NULL COMMENT 'Ngày bình luận'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `id_product`, `id_user`, `noi_dung`, `ngay_bl`) VALUES
(54, 41, 138, 'Sản phẩm này rất bơ phẹt __++', '05:42:30 05/12/2023'),
(55, 41, 138, 'Nhưng giá lại quá đắt !', '05:44:11 05/12/2023'),
(56, 41, 140, 'Chỉ có bọn nghèo mới chê đắt thôi !', '05:45:05 05/12/2023'),
(57, 49, 141, 'Quá Đẹp', '18:58:56 05/12/2023'),
(58, 56, 141, 'Nên Mua nhé , bao bền', '07:29:56 07/12/2023'),
(59, 53, 141, 'Quá đẹp , \r\n', '06:01:50 08/12/2023');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(4) NOT NULL COMMENT 'Mã loại hàng',
  `ten_loai` varchar(50) NOT NULL COMMENT 'Tên loại hàng',
  `stt` int(2) NOT NULL DEFAULT 0 COMMENT 'Sắp xếp danh mục',
  `sethome` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Danh mục xuất hiện trang chủ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `ten_loai`, `stt`, `sethome`) VALUES
(101, 'ÁO POLO', 1, b'0'),
(102, 'QUẦN JEAN', 2, b'0'),
(103, 'BALO', 3, b'0'),
(104, 'SẢN PHẨM HOT', 4, b'1'),
(106, 'PHỤ KIỆN', 0, b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` int(10) NOT NULL COMMENT 'Mã giỏ hàng',
  `id_product` int(10) NOT NULL COMMENT 'id SP',
  `id_user` int(11) NOT NULL,
  `ten_sp` varchar(100) NOT NULL COMMENT 'Tên sp',
  `hinh` varchar(200) NOT NULL COMMENT 'Hình',
  `gia` int(10) NOT NULL COMMENT 'Giá',
  `soluong` int(3) NOT NULL COMMENT 'Số lượng',
  `thanhtien` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`id`, `id_product`, `id_user`, `ten_sp`, `hinh`, `gia`, `soluong`, `thanhtien`) VALUES
(165, 73, 138, 'PKTT Ví Da Thịnh Vượng 5', 'phukien10.jpg', 279000, 1, 279000),
(166, 42, 138, 'Balo Daily Phụ Kiện Nguyên Bản Ver6', 'balo2.jpg', 357000, 1, 357000),
(167, 77, 143, 'PKTT Ví Nguyên Bản M1 ', 'phukien11.jpg', 278000, 1, 278000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(9) NOT NULL COMMENT 'Mã hàng hóa',
  `id_catalog` int(4) NOT NULL COMMENT 'Mã loại hàng',
  `ma_sp` varchar(10) DEFAULT NULL COMMENT 'Mã sản phẩm',
  `ten_sp` varchar(50) NOT NULL COMMENT 'Tên hàng hóa',
  `gia` int(10) NOT NULL COMMENT 'Giá chính',
  `giam_gia` int(10) DEFAULT NULL COMMENT 'Giá giảm',
  `hinh` varchar(50) NOT NULL COMMENT 'Hình ảnh',
  `hinh1` varchar(50) DEFAULT NULL COMMENT 'Hình phụ 1',
  `hinh2` varchar(50) DEFAULT NULL COMMENT 'Hình phụ 2',
  `hinh3` varchar(50) DEFAULT NULL COMMENT 'Hình phụ 3',
  `ngay_nhap` date NOT NULL COMMENT 'Ngày nhập hàng',
  `mo_ta` text DEFAULT NULL COMMENT 'Mô tả chi tiết hàng hóa',
  `dac_biet` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:HOT 2:NEW',
  `so_luot_xem` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `id_catalog`, `ma_sp`, `ten_sp`, `gia`, `giam_gia`, `hinh`, `hinh1`, `hinh2`, `hinh3`, `ngay_nhap`, `mo_ta`, `dac_biet`, `so_luot_xem`) VALUES
(33, 101, '#0022342', 'Áo Polo Cổ Bẻ Tay Ngắn Thiết Kế  SPEED 04', 327000, 0, 'aopolo1.jpg', 'aopolo1.1.jpg', 'aopolo1.2.jpg', 'aopolo1.3.jpg', '2023-11-20', 'Chất liệu: Cotton Compact 2S\r\nThành phần: 100% Cotton <br>\r\n- Thấm hút thoát ẩm <br>\r\n- Mềm mại <br>\r\n- Thân thiện với môi trường <br>\r\n- Kiểm soát mùi <br>\r\n- Điều hòa nhiệt <br>\r\n+ Kỹ thuật: Thêu Motif Run + Thêu 2D <br>\r\n+ Áo thun cổ trụ dùng vải chính may cổ <br>\r\n+ Dùng vải cotton trắng chạy 2 đường sọc bên tay. <br>\r\n+ Lai áo + lai tay + chạy chỉ trắng tạo kiểu. <br>\r\n+ Dưới lai thêu miếng đắp được thiết kế riêng cho BST thêu dạng viền zigzag <br>', 2, 4),
(34, 101, '#0022332', 'Áo Polo Cổ Bẻ Tay Ngắn Thiết Kế SPEED 39', 287000, 0, 'aopolo2.jpg', 'aopolo2.2.jpg', 'aopolo2.3.jpg', 'aopolo2.1.jpg', '2023-11-20', 'Chất liệu: Cotton Compact 2S\r\nThành phần: 100% Cotton\r\n- Thấm hút thoát ẩm\r\n- Mềm mại\r\n- Thân thiện với môi trường\r\n- Kiểm soát mùi\r\n- Điều hòa nhiệt\r\n+ Kỹ thuật: In dẻo + In thành cao\r\n+ Dùng bo cotton trắng làm cổ áo\r\n+ Phần trụ + vai rã phối vải trắng\r\n+ Vai viền dây gân thun đỏ tạo kiểu', 2, 11),
(35, 101, '#0022102', 'Áo Polo Cổ Bẻ Tay Ngắn Thiết Kế The Days Eye 36', 327000, 0, 'aopolo3.jpg', 'aopolo3.1.jpg', 'aopolo3.2.jpg', 'aopolo3.3.jpg', '2023-12-21', 'Chất liệu: Cotton Compact 2S <br>\r\nThành phần: 100% Cotton <br>\r\n- Thấm hút thoát ẩm <br>\r\n- Mềm mại <br>\r\n- Thân thiện <br>\r\n- Kiểm soát mùi <br>\r\n- Điều hòa nhiệt <br>\r\n+ Kỹ thuật in dẻo <br>\r\n+ Thiết kế cổ Polo <br>\r\n+ Bo cổ + bo tay + bo trụ Poly khác màu tạo điểm nhấn <br>\r\n+ May nhãn dệt được thiết kế dấu ấn riêng cho BST ', 1, 6),
(36, 101, '#0021203', 'Áo Polo Cổ Bẻ Tay Dài Thiết Kế Y2010 Originals Ver', 357000, 0, 'aopolo4.jpg', 'aopolo4.4.jpg', 'aopolo4.3.jpg', 'aopolo4.2.jpg', '2023-11-21', 'Áo Thun Sweater Y Nguyên Bản 18- Ver83\r\nChất liệu: COTTON DOUBLE FACE\r\n- Vải sợi Cotton được dệt theo &quot;DOUBLE-FACE&quot; có cấu trúc 2 bề mặt giống nhau, có thể sử dụng được cả 2 mặt vải .\r\nThành phần: 85% Cotton 15% Polyester\r\n- Co giãn\r\n- Độ bền cao\r\n- Thoáng Khí\r\n- Nhanh khô\r\n+ Họa tiết in dẻo + may đắp miếng kim loại', 1, 3),
(37, 102, '#0022484', 'Quần Jean Lưng Gài Ống Rộng Vải Cotton Mềm Trơn Dá', 457000, 0, 'quanjean1.jpg', 'quanjean1.1.jpg', 'quanjean1.2.jpg', 'quanjean1.3.jpg', '2023-11-22', '(*) Form dáng quần cổ điển và rất phổ biến với thiết kế thoải mái, rộng rãi, có phần mông, đùi và ống rộng trung bình, chu vi ống từ phần đùi đến cổ chân xấp xỉ nhau. Đôi khi người ta còn gọi dáng này là quần “ống suông\" bởi thiết kế thẳng tắp từ hồng cho đến ống quần.<br>\r\n(*) Ưu điểm: Sự thoải mái của chiếc quần này phù hợp với cả đi du lịch, dã ngoại hay đi mua sắm. Còn có thể che giấu một số khuyết điểm ở đùi và bắp chân cho người mặc.', 2, 2),
(38, 102, '#0019733', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Tru', 425000, 0, 'quanjean2.jpg', 'quanjean2.2.jpg', 'quanjean2.3.jpg', 'quanjean2.1.jpg', '2023-11-22', '(*) Form dáng skinny với chất liệu siêu co dãn, ôm vừa vặn, tôn dáng người mặc. Quần skinny mang lại cảm giác ôm khít hơn khi chúng bỏ <br>\r\n(*) Ưu điểm: Giúp đôi chân của người mặc trở nên thon gọn và dài hơn hẳn so với các loại quần khác\r\n', 2, 11),
(39, 106, '#0022734', 'PKTT Ví Da Nguyên Bản M4', 477000, 0, 'phukien1.jpg', 'phukien1.1.jpg', 'phukien1.2.jpg', 'phukien1.3.jpg', '2023-11-23', '-  Chất liệu: Da bò tự nhiên italy dày 1,2-1,4mm. <br>\r\n- Thiết kế gồm 2 ngăn chính, 2 ngăn khóa kéo, và nhiều ngăn phụ chứ thẻ card. <br>\r\n- Logo + dây kéo bằng kim loại.  \r\n\r\n ', 1, 13),
(40, 106, '#0022317', 'PKTT Nón Vải Cotton Phụ Kiện Di Sản Ver1', 177000, 0, 'phukien2.jpg', 'phukien2.2.jpg', 'phukien2.1.jpg', 'phukien2.3.jpg', '2023-11-24', 'Chất liệu: Vải kaki <br>\r\nKích thước: Vòng đầu 56-58cm <br>\r\nĐặc điểm:<br>\r\nForm dáng bucket cổ điển, trẻ trung\r\nChất liệu vải kaki bền đẹp, thấm hút mồ hôi tốt\r\nLogo YaMe Originals thêu nổi bật. <br>\r\nĐánh giá chung: Nón bucket nam YaMe Originals là một sản phẩm chất lượng cao, có thiết kế đẹp mắt và nhiều tính năng tiện dụng. Nón phù hợp với nhiều đối tượng sử dụng, có thể đội đi học, đi làm hoặc đi chơi.', 1, 20),
(41, 103, '#0022423', 'Balo Daily Phụ Kiện Khởi Nguyên 9', 457000, 0, 'balo1.jpg', 'balo1.1.jpg', 'balo1.2.jpg', 'balo1.3.jpg', '2023-11-24', '-Chất liệu:\r\n900HD PU Den 900HD PU Trắng in chuyển nhiệt\r\nDây kéo YKK #5/8 Đầu kéo YKK#5/8 <br>\r\n- PE foam 5mm/8mm • chống sốc tuyệt đối\r\nTHIẾT KẾ NHIỀU NGĂN TIỆN DỤNG', 1, 119),
(42, 103, '#0021289', 'Balo Daily Phụ Kiện Nguyên Bản Ver6', 357000, 0, 'balo2.jpg', 'balo2.1.jpg', 'balo2.2.jpg', 'balo2.3.jpg', '2023-11-25', 'Balo Daily Y Nguyên Bản Ver6\r\nChất liệu: 900HD PU Đen + 900HD PU Trắng in chuyển nhiệt\r\n- Lót 210PU Xám logo chữ Y mặt trái\r\n- PE foam 5mm/8mm chống sốc tuyệt đối\r\n- Dây kéo YKK #5/8 - Đầu kéo YKK#5/8\r\n- Thêu Y2010\r\n- Thiết kế nhiều ngăn tiện dụng\r\n- Kích thước 42cm x 30cm x 13cm', 2, 61),
(44, 106, '#0022616', 'PKTT Nón Sợi Nhân Tạo Phụ Kiện Nguyên Bản Ver4', 120000, 0, 'phukien3.jpg', 'phukien3.1.jpg', 'phukien3.2.jpg', 'phukien3.3.jpg', '2023-12-02', '- Hạn chế xù lông : tránh tiếp xúc bề mặt nhám, sần sẽ tạo ra các hạt xoắn trên bề mặt gây mất thẩm mỹ.<br>\r\n- Nên giặt tay, giặt riêng với các sản phẩm khác. Chọn loại bột giặt/nước giặt hoặc chất tẩy chuyên dụng để giặt mũ\r\nlen, chất tẩy không chứa Clo để tránh làm xơ cứng, phai màu sợi vải.<br>\r\n- Nên vắt thật nhẹ hoặc không vắt dùng khăn tắm bao quanh cho hút bớt nước từ SP. - Phơi nơi thông thoáng, tránh ánh nắng mặt trời.', 1, 6),
(45, 102, ' #0022053', 'Quần Jean Lưng Gài Ống Rộng - No Style 47', 397000, 0, 'quanjean3.jpg', 'quanjean3.1.jpg', 'quanjean3.2.jpg', 'quanjean3.3.jpg', '2023-12-03', 'Chất liệu: Jean Cotton\r\nThành phần: 100% Cotton\r\n- Chất liệu mềm mỏng thoải mái\r\n- Độ co giãn vừa phải\r\n- Wash nhẹ hiệu ứng trẻ trung\r\n- Thiết kế túi nhỏ đồng hồ', 1, 23),
(46, 106, '#0022670', 'PKTT Ví Nguyên Bản M3', 197000, NULL, 'phukien4.jpg', 'phukien4.1.jpg', 'phukien4.2.jpg', 'phukien4.3.jpg', '2023-12-05', '- Chất Liệu: Simily, dày 1,1mm\r\n- Chống nhăn trầy xước tối ưu, bền màu.\r\n- Ít bám bụi, dễ dàng vệ sinh. \r\n- Sử dụng khăn mền và sạch để lau bề mặt bên ngoài. ', 0, 8),
(47, 106, '#0022671', 'PKTT Nón Vải Cotton Phụ Kiện Nguyên Bản Ver13 PKTT', 157000, NULL, 'phukien5.jpg', 'phukien5.1.jpg', 'phukien5.2.jpg', 'phukien5.3.jpg', '2023-12-06', '- Mũ lưỡi trai trucker là một phụ kiện thời trang phổ biến, phù hợp với mọi lứa tuổi và phong cách. Mũ được làm bằng chất liệu kaki dày dặn, bền đẹp, có khả năng thấm hút mồ hôi tốt. <br><br>\r\n- Mũ có thiết kế đơn giản, dễ phối đồ, phù hợp với nhiều dịp khác nhau, từ đi học, đi làm đến đi chơi. Mũ có thể được điều chỉnh kích thước bằng nút bấm phía sau, phù hợp với mọi kích cỡ đầu.', 0, 9),
(48, 106, '#0022672', 'PKTT Nón Vải Cotton Phụ Kiện Nguyên Bản Ver8', 177000, NULL, 'phukien6.jpg', 'phukien6.1.jpg', 'phukien6.2.jpg', 'phukien6.3.jpg', '2023-12-06', '- Mũ lưỡi trai nam màu nâu là một phụ kiện thời trang đơn giản, nhưng không kém phần tinh tế và sang trọng. Mũ được làm bằng chất liệu kaki dày dặn, bền đẹp, có khả năng thấm hút mồ hôi tốt. Logo thương hiệu được thêu sắc nét, nổi bật, mang lại vẻ đẹp cá tính và thời thượng cho người đội.<br><br>\r\n- Mũ có thiết kế đơn giản, dễ phối đồ, phù hợp với nhiều dịp khác nhau, từ đi học, đi làm đến đi chơi. Mũ có thể được điều chỉnh kích thước bằng nút bấm phía sau, phù hợp với mọi kích cỡ đầu.', 0, 11),
(49, 106, '#0022673', 'PKTT Ví Da Tài Lộc 02', 397000, NULL, 'phukien7.jpg', 'phukien7.1.jpg', 'phukien7.2.jpg', 'phukien7.3.jpg', '2023-12-06', '- Ví có thiết kế đơn giản, với một ngăn chính rộng rãi, có thể đựng tiền, thẻ, giấy tờ tùy thân,... Ví được làm bằng chất liệu da bò thật, có độ bền cao và sang trọng.', 0, 14),
(50, 101, '#0022674', 'Áo Polo Cổ Bẻ Tay Dài Vải Cotton 4 Chiều Thấm Hút ', 310000, NULL, 'aopolo5.jpg', 'aopolo5.1.jpg', 'aopolo5.2.jpg', 'aopolo5.3.jpg', '2023-12-06', '- Form dáng: áo được  thiết kế vừa vặn, thoải mái. Phần eo, nách được thiết kế  vừa phải, tự do vận động. <br>\r\n- Tips: Phù hợp để kết hợp với nhiều trang phục, đa phong cách : lịch sự, thể thao ...', 0, 2),
(51, 101, NULL, 'Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 2 Chiều Thấm Hút', 287000, NULL, 'aopolo6.jpg', 'aopolo6.1.jpg', 'aopolo6.2.jpg', 'aopolo6.3.jpg', '2023-12-06', '- Form dáng: áo được  thiết kế vừa vặn, thoải mái. Phần eo, nách được thiết kế  vừa phải, tự do vận động. <br>\r\n- Tips: Phù hợp để kết hợp với nhiều trang phục, đa phong cách : lịch sự, thể thao ...', 0, 0),
(52, 101, NULL, 'Áo Polo Cổ Bẻ Tay Ngắn Cá Sấu 4 Chiều Thoáng Mát T', 257000, NULL, 'aopolo7.jpg', 'aopolo7.1.jpg', 'aopolo7.2.jpg', 'aopolo7.3.jpg', '2023-12-06', '- Form dáng: áo được  thiết kế vừa vặn, thoải mái. Phần eo, nách được thiết kế  vừa phải, tự do vận động. <br>\r\n- Tips: Phù hợp để kết hợp với nhiều trang phục, đa phong cách : lịch sự, thể thao ...', 0, 2),
(53, 103, NULL, 'Balo Daily Phụ Kiện Nguyên Bản Ver6', 357000, NULL, 'balo3.jpg', 'balo3.1.jpg', 'balo3.2.jpg', 'balo3.4.jpg', '2023-12-04', 'Chất liệu: <br>\r\n* Vỏ ngoài: 900HD PU Đen + 900HD PU Trắng in chuyển nhiệt <br>\r\n* Lót trong: 210PU Xám logo chữ Y mặt trái <br>\r\n* Lớp đệm: PE foam 5mm/8mm chống sốc tuyệt đối <br>\r\nKích thước: 42cm x 30cm x 13cm <br>\r\nTính năng:<br>\r\n* Thiết kế nhiều ngăn tiện dụng <br>\r\n* Thêu logo Y2010 <br>\r\n* Dây kéo YKK #5/8 <br>\r\n* Đầu kéo YKK#5/8 <br>\r\n', 0, 6),
(54, 103, NULL, 'Balo Daily Phụ Kiện Nguyên Bản Ver6', 357000, NULL, 'balo4.jpg', 'balo4.1.jpg', 'balo4.2.jpg', 'balo4.3.jpg', '2023-12-04', 'Chất liệu:<br>\r\n* Vỏ ngoài: 900HD PU Đen + 900HD PU Xanh in chuyển nhiệt<br>\r\n* Lót trong: 210PU Xám logo chữ Y mặt trái<br>\r\n* Lớp đệm: PE foam 5mm/8mm chống sốc tuyệt đối<br>\r\n\r\nKích thước: 42cm x 30cm x 13cm <br>\r\n\r\nTính năng:<br>\r\n* Thiết kế nhiều ngăn tiện dụng <br>\r\n* Thêu logo Y2010 <br>\r\n* Dây kéo YKK #5/8 <br>\r\n* Đầu kéo YKK#5/8 ', 0, 4),
(55, 103, NULL, 'Balo Daily Phụ Kiện Nguyên Bản Ver6', 357000, NULL, 'balo5.jpg', 'balo5.1.jpg', 'balo5.2.jpg', 'balo5.3.jpg', '2023-12-04', 'Chất liệu:<br>\r\n* Vỏ ngoài: 900HD PU Đen + 900HD PU  in Xanh dương chuyển nhiệt<br>\r\n* Lót trong: 210PU Xám logo chữ Y mặt trái<br>\r\n* Lớp đệm: PE foam 5mm/8mm chống sốc tuyệt đối<br>\r\n\r\nKích thước: 42cm x 30cm x 13cm <br>\r\n\r\nTính năng:<br>\r\n* Thiết kế nhiều ngăn tiện dụng<br>\r\n* Thêu logo Y2010 <br>\r\n* Dây kéo YKK #5/8 <br>\r\n* Đầu kéo YKK#5/8', 0, 1),
(56, 103, '#0022680', 'Balo Vintage Phụ Kiện Miền Gió Cát 04', 547000, NULL, 'balo6.jpg', 'balo6.2.jpg', 'balo6.3.jpg', 'balo6.1.jpg', '2023-12-04', 'Chất liệu: Balo được làm từ chất liệu vải Canvas cao cấp, có độ bền cao, chống thấm nước tốt, chống bám bụi và dễ dàng vệ sinh.<br>\r\nKích thước: Balo có kích thước vừa phải, phù hợp với người lớn. Balo có thể đựng được nhiều đồ đạc, bao gồm sách vở, laptop, điện thoại,...<br>\r\nKỹ thuật: Balo được thêu đắp giống, mang lại vẻ đẹp cổ điển và tinh tế.<br>\r\nKhóa bóp: Balo có khóa bóp giúp bảo vệ đồ đạc bên trong an toàn.<br>\r\nDây kéo YKK #5: Dây kéo YKK #5 bền bỉ và dễ dàng sử dụng.<br>', 0, 12),
(57, 103, '#0022682', 'Balo Modern Phụ Kiện Nguyên Bản M7', 327000, NULL, 'balo7.jpg', 'balo7.1.jpg', 'balo7.2.jpg', 'balo7.3.jpg', '2023-12-04', 'Chất liệu: Balo được làm từ chất liệu 900HD PU in chuyển nhiệt và lót 210PU. Đây là chất liệu cao cấp, có độ bền cao, chống thấm nước tốt, chống bám bụi và dễ dàng vệ sinh.<br>\r\nKích thước: Balo có kích thước vừa phải, phù hợp với người lớn. Balo có thể đựng được nhiều đồ đạc, bao gồm sách vở, laptop, điện thoại,...<br>\r\nThiết kế: Balo có thiết kế hiện đại, trẻ trung, phù hợp với nhiều đối tượng sử dụng. Balo có nhiều ngăn tiện dụng, giúp người dùng dễ dàng phân chia đồ đạc.<br>', 0, 3),
(58, 102, ' #0021868', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Tru', 427000, NULL, 'quanjean4.jpg', 'quanjean4.1.jpg', 'quanjean4.2.jpg', 'quanjean4.3.jpg', '2023-12-06', '(*) Form dáng Slim-fit: Không quá bó sát, form ôm dọc theo chiều dài của chân, phần ống rộng ở bắp đùi và thu nhỏ dần xuống cổ chân nhưng không bỏ sát và không túm ống như quần skinny mang lại cảm giác thoải mái, năng động khi mặc.<br>\r\n(*) Ưu điểm: là sự cân bằng giữa phong cách và sự thoải mái. Giúp tôn lên đôi chân của người mặc nhưng vẫn có những có sự thoải mái khi vận động', 0, 0),
(59, 102, '#0021623', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Tru', 425000, NULL, 'quanjean5.jpg', 'quanjean5.1.jpg', 'quanjean5.2.jpg', 'quanjean5.3.jpg', '2023-12-04', '(*) Form dáng Slim-fit: Không quá bó sát, form ôm dọc theo chiều dài của chân, phần ống rộng ở bắp đùi và thu nhỏ dần xuống cổ chân nhưng không bỏ sát và không túm ống như quần skinny mang lại cảm giác thoải mái, năng động khi mặc.<br>\r\n(*) Ưu điểm: là sự cân bằng giữa phong cách và sự thoải mái. Giúp tôn lên đôi chân của người mặc nhưng vẫn có những có sự thoải mái khi vận động', 0, 0),
(60, 102, '#0020189', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Tru', 455000, NULL, 'quanjean6.jpg', 'quanjean6.1.jpg', 'quanjean6.2.jpg', 'quanjean6.3.jpg', '2023-12-04', '(*) Form dáng Slim-fit: Không quá bó sát, form ôm dọc theo chiều dài của chân, phần ống rộng ở bắp đùi và thu nhỏ dần xuống cổ chân nhưng không bỏ sát và không túm ống như quần skinny mang lại cảm giác thoải mái, năng động khi mặc.<br>\r\n(*) Ưu điểm: là sự cân bằng giữa phong cách và sự thoải mái. Giúp tôn lên đôi chân của người mặc nhưng vẫn có những có sự thoải mái khi vận động', 0, 0),
(61, 102, '#0019786', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Tru', 425000, NULL, 'quanjean7.jpg', 'quanjean7.1.jpg', 'quanjean7.2.jpg', 'quanjean7.3.jpg', '2023-12-07', '(*) Form dáng Slim-fit: Không quá bó sát, form ôm dọc theo chiều dài của chân, phần ống rộng ở bắp đùi và thu nhỏ dần xuống cổ chân nhưng không bỏ sát và không túm ống như quần skinny mang lại cảm giác thoải mái, năng động khi mặc.<br>\r\n(*) Ưu điểm: là sự cân bằng giữa phong cách và sự thoải mái. Giúp tôn lên đôi chân của người mặc nhưng vẫn có những có sự thoải mái khi vận động', 0, 6),
(62, 101, '#0022501', 'Áo Polo Cổ Bẻ Tay Ngắn Cá Sấu 4 chiều Nhanh Khô Ph', 277000, NULL, 'aopolo8.jpg', 'aopolo8.1.jpg', 'aopolo8.2.jpg', 'aopolo8.3.jpg', '2023-12-08', 'Áo polo là một loại áo thun có cổ bẻ, thường được làm từ cotton hoặc polyester.<br>\r\n Áo polo có nguồn gốc từ môn thể thao polo, nơi nó được mặc bởi các vận động viên để giữ cho cổ họng được bảo vệ.<nr>\r\n Áo polo ngày nay được mặc phổ biến trong các dịp trang trọng và thường được sử dụng trong môi trường công sở hoặc trường học. ', 0, 0),
(63, 101, '#0020780', 'Áo Polo Cổ Bẻ Tay Dài Vải Cotton 2 Chiều Thoáng Má', 248500, NULL, 'aopolo9.jpg', 'aopolo9.1.jpg', 'aopolo9.2.jpg', 'aopolo9.3.jpg', '2023-12-08', 'Áo thun sweater vải cotton plus Y2010 Originals được làm từ chất liệu cotton double face 87%, polyester 13%, mang đến sự mềm mại, thoải mái và thấm hút mồ hôi tốt.<br>\r\n Áo có kiểu dáng cổ tròn, tay dài, mang đến sự trẻ trung và năng động. Áo có màu xanh đen thời trang, phù hợp với nhiều phong cách.<br>\r\nÁo có thiết kế đơn giản nhưng tinh tế, với đường may chắc chắn, tỉ mỉ. Áo có thể được mặc trong nhiều dịp khác nhau, từ đi chơi, đi học đến đi làm.', 0, 0),
(64, 101, ' #0020454', 'Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 2 Chiều Thấm Hút', 204000, NULL, 'aopolo10.jpg', 'aopolo10.1.jpg', 'aopolo10.2.jpg', 'aopolo10.3.jpg', '2023-12-08', 'Áo thun polo cổ bẻ màu xanh với cổ trắng được làm từ chất liệu 100% cotton, mang đến sự mềm mại, thoải mái và thấm hút mồ hôi tốt.<br>\r\nÁo có kiểu dáng cổ bẻ, tay ngắn, mang đến sự trẻ trung và năng động. Áo có màu xanh dương thời trang, phù hợp với nhiều phong cách.<br>\r\nÁo có thiết kế đơn giản nhưng tinh tế, với đường may chắc chắn, tỉ mỉ. Áo có thể được mặc trong nhiều dịp khác nhau, từ đi chơi, đi học đến đi làm.', 0, 0),
(65, 102, ' #0022207', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Tru', 357000, NULL, 'quanjean8.jpg', 'quanjean8.1.jpg', 'quanjean8.2.jpg', 'quanjean8.3.jpg', '2023-12-08', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Trung Bình Trơn Dáng Vừa Đơn Giản Cosmo 04 được làm từ chất liệu 85% cotton, 14% polyester, 1% spandex, mang đến sự mềm mại, thoải mái và co giãn tốt. <br>\r\nQuần có kiểu dáng lưng gài, ống đứng, dáng vừa, mang đến sự trẻ trung và năng động. Quần có màu xanh nhạt thời trang, phù hợp với nhiều phong cách. ', 0, 0),
(66, 102, ' #0021624', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Tru', 340000, NULL, 'quanjean9.jpg', 'quanjean9.1.jpg', 'quanjean9.2.jpg', 'quanjean9.3.jpg', '2023-12-08', 'Quần jean dài slim fit màu xanh sáng được làm từ chất liệu 100% cotton, mang đến sự mềm mại, thoải mái và thấm hút mồ hôi tốt.<br>\r\nQuần có kiểu dáng slim fit, ôm sát theo chiều dài của chân, mang đến sự trẻ trung và năng động. Quần có màu xanh sáng thời trang, phù hợp với nhiều phong cách. ', 0, 0),
(67, 102, '#0018694', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Tru', 279500, NULL, 'quanjean10.jpg', 'quanjean10.1.jpg', 'quanjean10.2.jpg', 'quanjean10.3.jpg', '2023-12-08', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Co Giãn Trung Bình Trơn Dáng Vừa Đơn Giản Cosmo 04 được làm từ chất liệu 85% cotton, 14% polyester, 1% spandex, mang đến sự mềm mại, thoải mái và co giãn tốt. <br>\r\nQuần có kiểu dáng lưng gài, ống đứng, dáng vừa, mang đến sự trẻ trung và năng động. Quần có màu xanh nhạt thời trang, phù hợp với nhiều phong cách. ', 0, 1),
(68, 103, '#0021782', 'Balo Daily Phụ Kiện Nguyên Bản Ver10 ', 397000, NULL, 'balo8.jpg', 'balo8.1.jpg', 'balo8.2.jpg', 'balo8.3.jpg', '2023-12-08', 'Balo Daily Phụ Kiện Nguyên Bản Ver10 là một sản phẩm của thương hiệu thời trang YaMe.vn. Balo được làm từ chất liệu 900HD Den/600D Twill PVC + Lót 210D Den, có độ bền cao và khả năng chống thấm nước tốt. Balo có màu đen, là màu sắc phổ biến và dễ phối đồ. Kích thước balo là 43cm x 31cm x 10.5cm, phù hợp với nhu cầu sử dụng của cả nam và nữ.\r\n<br>\r\nBalo có thiết kế đơn giản nhưng tinh tế, với các chi tiết nổi bật như logo thương hiệu ở mặt trước và quai đeo Air mesh êm ái. Balo có nhiều ngăn chứa, giúp bạn dễ dàng sắp xếp đồ đạc. Ngăn chính rộng rãi có thể chứa laptop, sách vở, và các vật dụng cá nhân khác. Ngăn phụ ngoài tiện dụng để đựng đồ dùng cần thiết như điện thoại, ví, chìa khóa,... Balo có khóa kéo YKK chắc chắn, giúp bạn bảo vệ đồ đạc bên trong an toàn.\r\n<br>\r\nBalo Daily Phụ Kiện Nguyên Bản Ver10 là một sản phẩm thời trang tiện dụng, phù hợp với nhiều nhu cầu sử dụng khác nhau. Balo là lựa chọn lý tưởng cho những người đang tìm kiếm một chiếc balo chất lượng, bền đẹp, và giá cả phải chăng.', 0, 2),
(69, 103, '#0020912', 'Balo Daily Phụ Kiện Nguyên Bản M1', 240000, NULL, 'balo9.jpg', 'balo9.1.jpg', 'balo9.2.jpg', 'balo9.3.jpg', '2023-12-08', 'Balo Mini Nam Nữ Màu Đen Đơn Giản Y2010 Nguyên Bản M1 20912 là một sản phẩm của thương hiệu thời trang YaMe. Balo được làm từ chất liệu Vải chính 900HD PU Đen + Lót 210PU, có độ bền cao và khả năng chống thấm nước tốt. Balo có màu đen, là màu sắc phổ biến và dễ phối đồ. Kích thước balo là 30 x 22 x 9cm, phù hợp với nhu cầu sử dụng của cả nam và nữ.\r\n<br>\r\nBalo có thiết kế đơn giản nhưng tinh tế, với các chi tiết nổi bật như logo thương hiệu ở mặt trước và quai đeo Air mesh êm ái. Balo có nhiều ngăn chứa, giúp bạn dễ dàng sắp xếp đồ đạc. Ngăn chính rộng rãi có thể chứa laptop, sách vở, và các vật dụng cá nhân khác. Ngăn phụ ngoài tiện dụng để đựng đồ dùng cần thiết như điện thoại, ví, chìa khóa,... Balo có khóa kéo YKK chắc chắn, giúp bạn bảo vệ đồ đạc bên trong an toàn.\r\n<br>\r\nBalo Mini Nam Nữ Màu Đen Đơn Giản Y2010 Nguyên Bản M1 20912 là một sản phẩm thời trang tiện dụng, phù hợp với nhiều nhu cầu sử dụng khác nhau. Balo là lựa chọn lý tưởng cho những người đang tìm kiếm một chiếc balo chất lượng, bền đẹp, và giá cả phải chăng.', 0, 2),
(70, 103, '#0021242', 'Balo Daily Phụ Kiện Nguyên Bản Ver5 Balo Daily Phụ', 357000, NULL, 'balo10.jpg', 'balo10.1.jpg', 'balo10.2.jpg', 'balo10.3.jpg', '2023-12-08', 'Balo Gear Bomber Eco Statement 2C 25L là một sản phẩm của thương hiệu thời trang Gear. Balo được làm từ chất liệu vải kaki nhung + 900HD PU đen, có độ bền cao và khả năng chống thấm nước tốt. Balo có màu xanh lá (bottle green) + đen, là màu sắc trẻ trung và năng động. Kích thước balo là 42cm x 32cm x 15cm, phù hợp với nhu cầu sử dụng của cả nam và nữ.\r\n<br>\r\nBalo có thiết kế đơn giản nhưng tinh tế, với các chi tiết nổi bật như logo thương hiệu ở mặt trước và quai đeo Air mesh êm ái. Balo có nhiều ngăn chứa, giúp bạn dễ dàng sắp xếp đồ đạc. Ngăn chính rộng rãi có thể chứa laptop, sách vở, và các vật dụng cá nhân khác. Ngăn phụ ngoài tiện dụng để đựng đồ dùng cần thiết như điện thoại, ví, chìa khóa,... Balo có khóa kéo YKK chắc chắn, giúp bạn bảo vệ đồ đạc bên trong an toàn.\r\n<br>\r\nBalo Gear Bomber Eco Statement 2C 25L là một sản phẩm thời trang tiện dụng, phù hợp với nhiều nhu cầu sử dụng khác nhau. Balo là lựa chọn lý tưởng cho những người đang tìm kiếm một chiếc balo chất lượng, bền đẹp, và giá cả phải chăng.', 0, 2),
(71, 106, ' #0022059', 'PKTT Nón Vải Cotton BST Thiết Kế The Day\'s Eye 17', 157000, NULL, 'phukien8.jpg', 'phukien8.1.jpg', 'phukien8.2.jpg', 'phukien8.3.jpg', '2023-12-08', 'Mũ lưỡi trai thêu hoa là một sản phẩm của thương hiệu thời trang THE DAY\'S EYE. Mũ được làm từ chất liệu kaki dày dặn, mang lại độ bền cũng như tạo form mũ cứng và đẹp mắt. Mũ có màu đen, là màu sắc phổ biến và dễ phối đồ.\r\n<br>\r\nMũ có thiết kế đơn giản nhưng tinh tế, với phần thêu hoa ở mặt trước. Hoa được thêu tỉ mỉ và sắc nét, mang lại vẻ đẹp sang trọng và nữ tính cho chiếc mũ. Mũ có quai đeo điều chỉnh, giúp bạn dễ dàng điều chỉnh kích thước phù hợp với khuôn đầu của mình.\r\n<br>\r\nMũ lưỡi trai thêu hoa là một sản phẩm thời trang tiện dụng, phù hợp với nhiều dịp khác nhau. Mũ có thể được sử dụng trong nhiều dịp khác nhau, từ đi học, đi làm, đến đi chơi.', 0, 1),
(72, 106, '#0020573', 'PKTT Nón Vải Cotton Phụ Kiện Bbuff Ver1 ', 155000, NULL, 'phukien9.jpg', 'phukien9.1.jpg', 'phukien9.2.jpg', 'phukien9.3.jpg', '2023-12-08', 'Nón lưỡi trai NY Yankees là một sản phẩm của thương hiệu thời trang New Era. Nón được làm từ chất liệu vải cotton, mang lại sự thoải mái và bền bỉ. Nón có màu xanh dương, trắng, đỏ, là màu sắc đặc trưng của đội bóng chày New York Yankees.\r\n<br>\r\nNón có thiết kế đơn giản nhưng tinh tế, với logo NY Yankees ở mặt trước. Logo được thêu tỉ mỉ và sắc nét, mang lại vẻ đẹp mạnh mẽ và cá tính cho chiếc nón. Nón có quai đeo điều chỉnh, giúp bạn dễ dàng điều chỉnh kích thước phù hợp với khuôn đầu của mình.\r\n<br>\r\nNón lưỡi trai NY Yankees là một sản phẩm thời trang tiện dụng, phù hợp với nhiều dịp khác nhau. Nón có thể được sử dụng trong nhiều dịp khác nhau, từ đi học, đi làm, đến đi chơi.', 0, 5),
(73, 106, '#0022409', 'PKTT Ví Da Thịnh Vượng 5', 279000, NULL, 'phukien10.jpg', 'phukien10.1.jpg', 'phukien10.2.jpg', 'phukien10.3.jpg', '2023-12-08', '- Chất liệu: Da bò nhập khẩu cao cấp <br>\r\n- Dáng ví: Ngang <br>\r\n- Kích thước: Ngang 12cm x Cao 9.5cm <br>\r\n- Số ngăn: 11 ngăn tiện dụng vẫn đầy đủ công năng <br>\r\n- Mỗi sản phẩm ví YaMe đều có hộp kraf đựng riêng cứng cáp, có nắp đậy sang trọng. <br>', 0, 7),
(74, 101, '#0020651', 'Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 2 Chiều Thấm Hút', 114000, NULL, 'aopolo11.jpg', 'aopolo11.1.jpg', 'aopolo11.2.jpg', 'aopolo11.3.jpg', '2023-12-09', 'Chất liệu: Cotton Compact <br>\r\nThành phần: 100% Cotton <br>\r\n- Thân thiện <br> \r\n- Thấm hút thoát ẩm <br>\r\n- Mềm mại <br>\r\n- Kiểm soát mùi <br> \r\n- Điều hòa nhiệt <br>\r\n+ Họa tiết thêu đắp giống, thêu xù <br>\r\n- HDSD: <br>\r\n+ Nên giặt chung với sản phẩm cùng màu <br>\r\n+ Không dùng thuốc tẩy hoặc xà phòng có tính tẩy mạnh <br>\r\n+ Nên phơi trong bóng râm để giữ sp bền màu', 0, 1),
(75, 102, '#0022488', 'Quần Jean Lưng Gài Ống Đứng Vải Cotton Mặc Mềm Trơ', 457000, NULL, 'quanjean11.jpg', 'quanjean11.1.jpg', 'quanjean11.2.jpg', 'quanjean11.3.jpg', '2023-12-09', 'Chất liệu: Jean Cotton Spandex <br>\r\nThành phần: 98% Cotton 2% Spandex <br>\r\n- Mềm mịn <br>\r\n- Thoáng khí <br>\r\n- Co giãn <br>\r\n+ Độ dày: 10,5 oz <br>\r\n+ Jean trơn đơn giản <br>\r\n+ Túi đồng hồ bên phải khi mặc <br>\r\n+ 2 túi đắp phía sau rộng, đường may chắc chắn dễ dàng để các vật dụng như ví, điện thoại <br>\r\n+ Mag giấy thiết kế riêng cho BST', 0, 2),
(76, 103, '#0022415', 'Balo Modern BST Thiết Kế SPEED 52', 427000, NULL, 'balo11.jpg', 'balo11.1.jpg', 'balo11.2.jpg', 'balo11.3.jpg', '2023-12-09', 'Chất liệu: 900DPU Đen + 600D PU in chuyển nhiệt Xám Đậm <br>\r\n- Lót 210D PU Đen <br>\r\n- Phối Simily PVC Trắng <br> \r\n- PE foam 5mm/8mm chống sốc tuyệt đối <br>\r\n- Dây kéo - Đầu kéo YKK #5/8 <br>\r\n- Ngăn chính rộng với sức chức lớn <br>\r\n- Nhiều ngăn nhỏ tiện dụng <br>\r\n- Dây móc chìa khóa tiện lợi <br>\r\n+ Kỹ thuật: Thêu đắp giống Logo Racing <br>\r\n+ Kích thước: 42x30x13cm <br>', 0, 3),
(77, 106, ' #0022280', 'PKTT Ví Nguyên Bản M1 ', 278000, NULL, 'phukien11.jpg', 'phukien11.1.jpg', 'phukien11.2.jpg', 'phukien11.3.jpg', '2023-12-09', 'Chất liệu :Simily dày 1,1mm - Logo + dây kéo kim loại <br>\r\n- Chống nhăn và trầy xước tối ưu, bền màu <br>\r\n- It bám bụi, dễ dàng vệ sinh <br?\r\n- Bạn chỉ cần sử dụng khăn mềm và sạch để lau nhẹ trên bề mặt da. <br>\r\n- Thiết kế gồm 1 ngăn chính, 2 ngăn khóa kéo và nhiều ngăn phụ đựng thẻ card <br>\r\n- Thiết ké quai cầm chắc chắn, linh hoạt <br>\r\n- Kích thước: Cao 17cm x Ngang 27cm', 0, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL COMMENT 'Mã khách hàng',
  `username` varchar(50) NOT NULL COMMENT 'Tên ĐN',
  `password` varchar(500) NOT NULL COMMENT 'Mật khẩu',
  `hoten` varchar(50) DEFAULT NULL COMMENT 'Họ và tên',
  `hinh` varchar(500) DEFAULT 'hinh_defaut.jpg' COMMENT 'Tên hình ảnh',
  `email` varchar(50) NOT NULL COMMENT 'Đia chỉ Email',
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:user 1:admin 2:block',
  `diachi` varchar(500) DEFAULT NULL COMMENT 'Địa chỉ',
  `dienthoai` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `hoten`, `hinh`, `email`, `role`, `diachi`, `dienthoai`) VALUES
(138, 'taokhongbiet', '$2y$10$RhT.AqQH8C0HruTSOtM5j.SFpLnBueJjwMk5lb35e.GpzoyxIzuBW', 'Nguyễn Trần Duy', 'user1.jpg', 'duyntps29110@fpt.edu.vn', 0, '564/37/9', 346363180),
(139, 'admin', '$2y$10$DWUMtE9s9ZyRuvyIZ/tWQuF2QtjIXKFflmkCYLBuHVFqAEOqq9IK2', 'adminstore', 'hinh_defaut.jpg', 'admin@gmail.com', 1, 'CVPM Quang Trung, Q.12, TP.HCM', 19001000),
(140, 'binh123', '$2y$10$5C9yYOiYa/nKl/BTHjTwoevBwAKATkaQ/RedIZ/fNrcuPcXKyoGK6', 'Bình ĐẸP ZAI', 'hinh_defaut.jpg', 'binh@gmail.com', 0, NULL, 213123412),
(141, 'binhka', '$2y$10$wgYdxHOd83R.QhjPMvvbE.POD6gS5Ru7h301qXsMXc/dVY5/aKVhO', 'Đặng Duy Bình', 'hinh_defaut.jpg', 'binhdtcl47@gmail.com', 0, '472/56 Lê Đức Thọ , Phường 17, Gò vấp , HCM', 889020487),
(142, 'trunglee0101', '$2y$10$LHz5lZB5jYknWUvkxzjmHeDZlWUzs.TlAcT85hc4PSX1r5mE7xmoO', 'trunglee', 'hinh_defaut.jpg', 'trunhle36@gmail.com', 0, NULL, 372179063),
(143, 'trunglee0102', '$2y$10$GoEImERiNT16J36SwlAeVO4bqkCZA9fmB79vvzEHJTwhvaleTEs4i', 'lee', 'hinh_defaut.jpg', 'trunhle36@gmail.com', 0, NULL, 372179063);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bill_user` (`id_user`);

--
-- Chỉ mục cho bảng `billchitiet`
--
ALTER TABLE `billchitiet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bill` (`id_bill`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `fk_billchitiet_user` (`id_user`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_binhluan_user` (`id_user`),
  ADD KEY `fk_binhluan_sanpham` (`id_product`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_giohang_sanpham` (`id_product`),
  ADD KEY `fk_giohang_user` (`id_user`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sanpham_danhmuc` (`id_catalog`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id hóa đơn', AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT cho bảng `billchitiet`
--
ALTER TABLE `billchitiet`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID chi tiết hóa đơn', AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Mã loại hàng', AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Mã giỏ hàng', AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT COMMENT 'Mã hàng hóa', AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'Mã khách hàng', AUTO_INCREMENT=144;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_bill_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `billchitiet`
--
ALTER TABLE `billchitiet`
  ADD CONSTRAINT `billchitiet_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `fk_billchitiet_bill` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `fk_billchitiet_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `fk_binhluan_sanpham` FOREIGN KEY (`id_product`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `fk_binhluan_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `fk_giohang_sanpham` FOREIGN KEY (`id_product`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `fk_giohang_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_sanpham_danhmuc` FOREIGN KEY (`id_catalog`) REFERENCES `danhmuc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
