USE [QuanLyLichThi]
GO
/****** Object:  Table [dbo].[DoiLichThi]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiLichThi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [varchar](255) NOT NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[LyDo] [nvarchar](max) NULL,
	[MaND] [int] NULL,
	[MSND] [varchar](10) NULL,
	[XetDuyet] [int] NULL,
	[MaLich] [int] NULL,
	[MaGV] [int] NULL,
	[EmailGV] [nvarchar](255) NULL,
	[HoTenSV] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HinhThucThi]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhThucThi](
	[MaHT] [int] IDENTITY(1,1) NOT NULL,
	[TenHT] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [int] IDENTITY(1,1) NOT NULL,
	[TenKhoa] [nvarchar](255) NOT NULL,
	[HinhAnh] [nvarchar](255) NULL,
	[VietTat] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichThi]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichThi](
	[MaLich] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NULL,
	[MaPhong] [int] NULL,
	[MaKhoa] [int] NULL,
	[MaNhom] [int] NULL,
	[MaTG] [int] NULL,
	[MaHT] [int] NULL,
	[SLGV] [int] NULL,
	[Note] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiNguoiDung]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNguoiDung](
	[MaLND] [int] IDENTITY(1,1) NOT NULL,
	[TenLND] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaMon] [varchar](10) NULL,
	[TenMon] [nvarchar](255) NULL,
	[MaPhong] [int] NULL,
	[MaKhoa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaND] [int] IDENTITY(1,1) NOT NULL,
	[TenND] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Pass] [nvarchar](255) NULL,
	[SDT] [varchar](10) NULL,
	[MaKhoa] [int] NULL,
	[MaLND] [int] NULL,
	[MSND] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomMonHoc]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomMonHoc](
	[MaNhom] [int] IDENTITY(1,1) NOT NULL,
	[MaMon] [int] NULL,
	[MaGV] [int] NULL,
	[SoLuong] [int] NULL,
	[TenNhom] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongHoc]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongHoc](
	[MaPhong] [int] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThoiGian]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThoiGian](
	[MaTG] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongBao]    Script Date: 6/20/2023 11:43:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [varchar](255) NOT NULL,
	[MaND] [int] NULL,
	[MaDoiLich] [int] NULL,
	[DaXem] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DoiLichThi] ON 

INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (1, N'6/9/2023 3:53:51 PM', N'online-shopping-ecommerce-ss-1920.png', NULL, 1, N'B1900000', 1, 2, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (2, N'6/9/2023 3:56:16 PM', N'65f949bd0e0fd2518b1e.jpg', N'e bi benh', 1, N'B1900000', 2, 14, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (3, N'6/9/2023 4:37:46 PM', N'55a4587981a05cfe05b1.jpg', N'nhà e có việc', 1, N'B1900000', 1, 12, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (4, N'6/9/2023 4:37:53 PM', N'55a4587981a05cfe05b1.jpg', N'nhà e có việc', 1, N'B1900000', 0, 12, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (5, N'6/9/2023 4:38:18 PM', N'lazada1910.jpg', N'fff', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (6, N'6/9/2023 4:39:29 PM', N'lazada1910.jpg', N'eeeeee', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (7, N'6/9/2023 4:41:00 PM', N'lazada-mall.jpeg', N'dddd', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (8, N'6/9/2023 4:42:53 PM', N'lazada1910.jpg', N'ddffsa', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (9, N'6/9/2023 4:43:02 PM', N'lazada1910.jpg', N'ddffsa', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (10, N'6/9/2023 4:48:36 PM', N'online-shopping-ecommerce-ss-1920.png', N'ee', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (11, N'6/9/2023 4:48:39 PM', N'online-shopping-ecommerce-ss-1920.png', N'ee', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (12, N'6/9/2023 4:48:41 PM', N'online-shopping-ecommerce-ss-1920.png', N'ee', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (13, N'6/9/2023 4:48:43 PM', N'online-shopping-ecommerce-ss-1920.png', N'ee', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (14, N'6/9/2023 4:50:40 PM', N'Nodejs_logo_light.png', N'ee', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (15, N'6/9/2023 4:53:02 PM', N'lazada1910.jpg', N'eee', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (16, N'6/9/2023 4:54:16 PM', N'6f721d876ca9b1f7e8b8.jpg', N'rrwER', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (17, N'6/9/2023 4:54:29 PM', N'6f721d876ca9b1f7e8b8.jpg', N'rrwER', 1, N'B1900000', 0, 16, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
INSERT [dbo].[DoiLichThi] ([ID], [NgayTao], [HinhAnh], [LyDo], [MaND], [MSND], [XetDuyet], [MaLich], [MaGV], [EmailGV], [HoTenSV]) VALUES (18, N'6/10/2023 3:30:50 PM', N'online-shopping-a-pandemic-habit-that-stuck (1).jpg', N'alo', 1, N'B1900000', 0, 2, 2, N'huyenxinhdep2402@gmail.com', N'Bảo Quốc')
SET IDENTITY_INSERT [dbo].[DoiLichThi] OFF
GO
SET IDENTITY_INSERT [dbo].[HinhThucThi] ON 

INSERT [dbo].[HinhThucThi] ([MaHT], [TenHT]) VALUES (1, N'Lý thuyết')
INSERT [dbo].[HinhThucThi] ([MaHT], [TenHT]) VALUES (2, N'Thực hành')
SET IDENTITY_INSERT [dbo].[HinhThucThi] OFF
GO
SET IDENTITY_INSERT [dbo].[Khoa] ON 

INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [HinhAnh], [VietTat]) VALUES (1, N'Công Nghệ Thông Tin và Truyền Thông', NULL, N'Khoa CNTT - TT')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [HinhAnh], [VietTat]) VALUES (2, N'Hệ Thống Thông Tin', NULL, N'Khoa HTTT')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [HinhAnh], [VietTat]) VALUES (3, N'Kĩ Thuật Phần Mềm', NULL, N'Khoa KTPM')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [HinhAnh], [VietTat]) VALUES (4, N'Khoa Học Máy Tính', NULL, N'Khoa KHMT')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [HinhAnh], [VietTat]) VALUES (5, N'Truyền Thông Đa Phương Tiện', NULL, N'Khoa TTDPT')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [HinhAnh], [VietTat]) VALUES (6, N'Công Nghệ Phần Mềm', NULL, N'Khoa CNPM')
SET IDENTITY_INSERT [dbo].[Khoa] OFF
GO
SET IDENTITY_INSERT [dbo].[LichThi] ON 

INSERT [dbo].[LichThi] ([MaLich], [ThoiGian], [MaPhong], [MaKhoa], [MaNhom], [MaTG], [MaHT], [SLGV], [Note]) VALUES (2, CAST(N'2023-07-06T07:00:00.000' AS DateTime), 1, 2, 2, 1, 1, 2, N'elcit')
INSERT [dbo].[LichThi] ([MaLich], [ThoiGian], [MaPhong], [MaKhoa], [MaNhom], [MaTG], [MaHT], [SLGV], [Note]) VALUES (12, CAST(N'2023-07-06T13:00:00.000' AS DateTime), 5, 2, 4, 2, 1, 1, N'elearning')
INSERT [dbo].[LichThi] ([MaLich], [ThoiGian], [MaPhong], [MaKhoa], [MaNhom], [MaTG], [MaHT], [SLGV], [Note]) VALUES (13, CAST(N'2023-08-06T07:00:00.000' AS DateTime), 10, 2, 3, 3, 2, 3, NULL)
INSERT [dbo].[LichThi] ([MaLich], [ThoiGian], [MaPhong], [MaKhoa], [MaNhom], [MaTG], [MaHT], [SLGV], [Note]) VALUES (14, CAST(N'2023-07-06T09:30:00.000' AS DateTime), 11, 2, 3, 5, 2, 3, NULL)
INSERT [dbo].[LichThi] ([MaLich], [ThoiGian], [MaPhong], [MaKhoa], [MaNhom], [MaTG], [MaHT], [SLGV], [Note]) VALUES (15, CAST(N'2023-07-06T15:30:00.000' AS DateTime), 2, 2, 3, 6, 1, 3, N'elcit')
INSERT [dbo].[LichThi] ([MaLich], [ThoiGian], [MaPhong], [MaKhoa], [MaNhom], [MaTG], [MaHT], [SLGV], [Note]) VALUES (16, CAST(N'2023-08-06T13:00:00.000' AS DateTime), 6, 2, 2, 4, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[LichThi] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiNguoiDung] ON 

INSERT [dbo].[LoaiNguoiDung] ([MaLND], [TenLND]) VALUES (1, N'Giảng Viên')
INSERT [dbo].[LoaiNguoiDung] ([MaLND], [TenLND]) VALUES (2, N'Sinh Viên')
INSERT [dbo].[LoaiNguoiDung] ([MaLND], [TenLND]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[LoaiNguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[MonHoc] ON 

INSERT [dbo].[MonHoc] ([ID], [MaMon], [TenMon], [MaPhong], [MaKhoa]) VALUES (1, N'CT472', N'Niên luận ngành', 1, 1)
INSERT [dbo].[MonHoc] ([ID], [MaMon], [TenMon], [MaPhong], [MaKhoa]) VALUES (2, N'CT175', N'Lý thuyết đồ thị', 7, 2)
INSERT [dbo].[MonHoc] ([ID], [MaMon], [TenMon], [MaPhong], [MaKhoa]) VALUES (3, N'CT112', N'Mạng máy tính', 8, 1)
SET IDENTITY_INSERT [dbo].[MonHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaND], [TenND], [Email], [Pass], [SDT], [MaKhoa], [MaLND], [MSND]) VALUES (1, N'Bảo Quốc', N'huyenb1910384@student.ctu.edu.vn', N'123', NULL, 2, 2, N'B1900000')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [Email], [Pass], [SDT], [MaKhoa], [MaLND], [MSND]) VALUES (2, N'Lê Văn Quan', N'huyenxinhdep2402@gmail.com', N'123', NULL, 2, 1, N'001707')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [Email], [Pass], [SDT], [MaKhoa], [MaLND], [MSND]) VALUES (3, N'Trần Việt Châu', N'chau@gmail.com', N'123', NULL, 2, 1, N'002640')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[NhomMonHoc] ON 

INSERT [dbo].[NhomMonHoc] ([MaNhom], [MaMon], [MaGV], [SoLuong], [TenNhom]) VALUES (2, 1, 2, 20, 1)
INSERT [dbo].[NhomMonHoc] ([MaNhom], [MaMon], [MaGV], [SoLuong], [TenNhom]) VALUES (3, 2, 3, 70, 12)
INSERT [dbo].[NhomMonHoc] ([MaNhom], [MaMon], [MaGV], [SoLuong], [TenNhom]) VALUES (4, 1, 2, 15, 2)
SET IDENTITY_INSERT [dbo].[NhomMonHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongHoc] ON 

INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (1, N'P01', 40)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (2, N'P02', 40)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (3, N'P03', 40)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (4, N'P04', 40)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (5, N'P05', 40)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (6, N'P06', 60)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (7, N'P07', 60)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (8, N'P08', 60)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (9, N'P09', 80)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (10, N'P10', 80)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (11, N'Phòng máy 1', 40)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (12, N'Phòng máy 2', 40)
INSERT [dbo].[PhongHoc] ([MaPhong], [TenPhong], [SoLuong]) VALUES (13, N'Phòng máy 17', 80)
SET IDENTITY_INSERT [dbo].[PhongHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[ThoiGian] ON 

INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (1, CAST(N'2023-07-06T07:00:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (2, CAST(N'2023-07-06T13:00:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (3, CAST(N'2023-08-06T07:00:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (4, CAST(N'2023-08-06T13:00:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (5, CAST(N'2023-07-06T09:30:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (6, CAST(N'2023-07-06T15:30:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (7, CAST(N'2023-08-06T09:30:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (8, CAST(N'2023-08-06T15:30:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (9, CAST(N'2023-09-06T07:00:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (10, CAST(N'2023-09-06T09:30:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (11, CAST(N'2023-09-06T15:30:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (12, CAST(N'2023-09-06T13:00:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (13, CAST(N'2023-10-06T07:00:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (14, CAST(N'2023-10-06T13:00:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (15, CAST(N'2023-10-06T09:30:00.000' AS DateTime))
INSERT [dbo].[ThoiGian] ([MaTG], [ThoiGian]) VALUES (16, CAST(N'2023-10-06T15:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ThoiGian] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongBao] ON 

INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (1, N'6/9/2023 3:53:51 PM', 1, 1, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (2, N'6/9/2023 4:37:46 PM', 1, 3, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (3, N'6/9/2023 4:37:53 PM', 1, 4, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (4, N'6/9/2023 4:38:18 PM', 1, 5, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (5, N'6/9/2023 4:39:29 PM', 1, 6, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (6, N'6/9/2023 4:41:00 PM', 1, 7, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (7, N'6/9/2023 4:42:53 PM', 1, 8, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (8, N'6/9/2023 4:43:02 PM', 1, 9, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (9, N'6/9/2023 4:48:36 PM', 1, 10, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (10, N'6/9/2023 4:48:39 PM', 1, 11, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (11, N'6/9/2023 4:48:41 PM', 1, 12, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (12, N'6/9/2023 4:48:43 PM', 1, 13, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (13, N'6/9/2023 4:50:40 PM', 1, 14, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (14, N'6/9/2023 4:53:02 PM', 1, 15, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (15, N'6/9/2023 4:54:16 PM', 1, 16, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (16, N'6/9/2023 4:54:29 PM', 1, 17, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (17, N'6/10/2023 3:30:50 PM', 1, 18, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (18, N'6/10/2023 4:08:20 PM', 2, 1, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (19, N'6/10/2023 4:12:14 PM', 2, 2, 1)
INSERT [dbo].[ThongBao] ([ID], [NgayTao], [MaND], [MaDoiLich], [DaXem]) VALUES (20, N'6/13/2023 8:41:39 AM', 2, 3, 1)
SET IDENTITY_INSERT [dbo].[ThongBao] OFF
GO
ALTER TABLE [dbo].[DoiLichThi]  WITH CHECK ADD FOREIGN KEY([MaLich])
REFERENCES [dbo].[LichThi] ([MaLich])
GO
ALTER TABLE [dbo].[DoiLichThi]  WITH CHECK ADD FOREIGN KEY([MaND])
REFERENCES [dbo].[NguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[LichThi]  WITH CHECK ADD FOREIGN KEY([MaHT])
REFERENCES [dbo].[HinhThucThi] ([MaHT])
GO
ALTER TABLE [dbo].[LichThi]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[LichThi]  WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NhomMonHoc] ([MaNhom])
GO
ALTER TABLE [dbo].[LichThi]  WITH CHECK ADD FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PhongHoc] ([MaPhong])
GO
ALTER TABLE [dbo].[LichThi]  WITH CHECK ADD FOREIGN KEY([MaTG])
REFERENCES [dbo].[ThoiGian] ([MaTG])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PhongHoc] ([MaPhong])
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD FOREIGN KEY([MaLND])
REFERENCES [dbo].[LoaiNguoiDung] ([MaLND])
GO
ALTER TABLE [dbo].[NhomMonHoc]  WITH CHECK ADD FOREIGN KEY([MaMon])
REFERENCES [dbo].[MonHoc] ([ID])
GO
ALTER TABLE [dbo].[NhomMonHoc]  WITH CHECK ADD FOREIGN KEY([MaGV])
REFERENCES [dbo].[NguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD FOREIGN KEY([MaDoiLich])
REFERENCES [dbo].[DoiLichThi] ([ID])
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD FOREIGN KEY([MaND])
REFERENCES [dbo].[NguoiDung] ([MaND])
GO
