USE [master]
GO
/****** Object:  Database [CodingProject]    Script Date: 8/23/2018 2:00:44 AM ******/
CREATE DATABASE [CodingProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CodingProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CodingProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CodingProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CodingProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CodingProject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CodingProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CodingProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CodingProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CodingProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CodingProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CodingProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [CodingProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CodingProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CodingProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CodingProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CodingProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CodingProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CodingProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CodingProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CodingProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CodingProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CodingProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CodingProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CodingProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CodingProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CodingProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CodingProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CodingProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CodingProject] SET RECOVERY FULL 
GO
ALTER DATABASE [CodingProject] SET  MULTI_USER 
GO
ALTER DATABASE [CodingProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CodingProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CodingProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CodingProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CodingProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CodingProject', N'ON'
GO
ALTER DATABASE [CodingProject] SET QUERY_STORE = OFF
GO
USE [CodingProject]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CodingProject]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/23/2018 2:00:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 8/23/2018 2:00:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[UserID] [int] NOT NULL,
	[FeedBack] [nvarchar](500) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/23/2018 2:00:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[OrderID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/23/2018 2:00:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Status] [int] NULL,
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[UserID] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 8/23/2018 2:00:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[StatusID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/23/2018 2:00:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductName] [nvarchar](100) NULL,
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
	[Rate] [real] NULL,
	[UserID] [int] NULL,
	[CategoryID] [int] NULL,
	[Ban] [bit] NULL,
	[Active] [bit] NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 8/23/2018 2:00:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Commend] [nvarchar](200) NULL,
	[Rate] [real] NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/23/2018 2:00:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[NameRole] [nvarchar](20) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/23/2018 2:00:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[Gender] [nvarchar](10) NULL,
	[Phone] [nvarchar](20) NULL,
	[Role] [int] NULL,
	[Ban] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Đặt cơm')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Đồ uống')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Đồ ăn vặt')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Đồ công nghệ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Quần áo')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Ship nước')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Thẻ game')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Thẻ điện thoại')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Đồ dùng phòng ngủ')
SET IDENTITY_INSERT [dbo].[Category] OFF
INSERT [dbo].[Feedback] ([UserID], [FeedBack]) VALUES (19, N'Người ta gọi đây là "Truất"')
INSERT [dbo].[Feedback] ([UserID], [FeedBack]) VALUES (20, N'Website hay quá, cảm ơn team 5 chú ve sầu')
INSERT [dbo].[Feedback] ([UserID], [FeedBack]) VALUES (21, N'thích quá')
INSERT [dbo].[Feedback] ([UserID], [FeedBack]) VALUES (23, N'Good ')
INSERT [dbo].[Feedback] ([UserID], [FeedBack]) VALUES (24, N'Wow, beautiful web')
INSERT [dbo].[Feedback] ([UserID], [FeedBack]) VALUES (26, N'Nhờ website mà mình bán hàng hết nhanh hơn rất nhiều')
INSERT [dbo].[Feedback] ([UserID], [FeedBack]) VALUES (28, N'Thật không thể tin được')
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 1, 6, 4, 12000.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price]) VALUES (2, 5, 4, 4, 25000.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 2, 5, 2, 10000.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price]) VALUES (4, 7, 7, 1, 15000.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 24, 8, 10, 2000.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price]) VALUES (6, 25, 6, 4, 4000.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price]) VALUES (9, 4, 9, 1, 13000000.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price]) VALUES (10, 22, 4, 1, 95000.0000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Status], [OrderID], [Date], [UserID], [Active]) VALUES (1, 4, CAST(N'2018-08-22' AS Date), 20, 1)
INSERT [dbo].[Orders] ([Status], [OrderID], [Date], [UserID], [Active]) VALUES (2, 5, CAST(N'2018-08-26' AS Date), 23, 1)
INSERT [dbo].[Orders] ([Status], [OrderID], [Date], [UserID], [Active]) VALUES (1, 6, CAST(N'2018-08-22' AS Date), 21, 1)
INSERT [dbo].[Orders] ([Status], [OrderID], [Date], [UserID], [Active]) VALUES (3, 7, CAST(N'2018-09-01' AS Date), 22, 0)
INSERT [dbo].[Orders] ([Status], [OrderID], [Date], [UserID], [Active]) VALUES (2, 8, CAST(N'2018-08-01' AS Date), 22, 1)
INSERT [dbo].[Orders] ([Status], [OrderID], [Date], [UserID], [Active]) VALUES (1, 9, CAST(N'2018-08-09' AS Date), 26, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[OrderStatus] ([StatusID], [Name]) VALUES (1, N'Đang ship đi')
INSERT [dbo].[OrderStatus] ([StatusID], [Name]) VALUES (2, N'Đang xét đơn')
INSERT [dbo].[OrderStatus] ([StatusID], [Name]) VALUES (3, N'Hủy')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Bò húc', 1, 20, 12000.0000, 4, 23, 2, 0, 1, N'Bò húc được nhập khẩu từ Thái Lan')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'String', 2, 23, 10000.0000, 3.5, 21, 2, 0, 1, N'String mát lạnh')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Laptop DELL', 4, 1, 13000000.0000, 5, 20, 4, 0, 1, N'CPU:	Intel Core i3 Skylake, 6006U, 2.00 GHz
RAM:	4 GB, DDR4 (2 khe), 2400 MHz
Ổ cứng:	HDD: 500 GB
Màn hình:	14 inch, HD (1366 x 768)
Card màn hình:	Card đồ họa tích hợp, Intel® HD Graphics 520
Cổng kết nối:	2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)
Hệ điều hành:	Windows 10 Home SL
Thiết kế:	Vỏ nhựa, PIN rời
Kích thước:	Dày 23.4 mm, 1.95 kg')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Cơm Nguyễn Tuấn', 5, 100, 25000.0000, 2.5, 28, 1, 0, 1, N'Món ăn ''sạch''')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Rèm cửa ', 6, 9, 60000.0000, 4, 29, 9, 0, 1, N'Được may bằng 100% polyester dày, bền chắc

Giúp chắn bớt ánh sáng chiếu vào nhà

Móc treo được điều chỉnh lên xuống, tiện lợi sử dụng')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Nước Tority (19L)', 7, 40, 15000.0000, 4, 23, 6, 0, 1, N'Nước sạch từ siêu thị')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'IPhone X 64GB', 8, 5, 20000000.0000, 5, 26, 4, 0, 1, N'Chính hãng, Nguyên seal, Mới 100%, Chưa Active

Miễn phí giao hàng toàn quốc

Thiết kế: Nguyên khối

Màn hình: Super AMOLED capacitive touchscreen, 5.8 inch HD

Camera Trước/Sau: 7MP/ 2 camera 12MP

CPU: Apple A11 Bionic 6 nhân

Bộ Nhớ: 64GB

RAM: 3GB

SIM: 1 Nano SIM

Tính năng: Chống nước, chống bụi, Face ID')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Máy Ảnh Canon 750D + Lens 18-55 IS STM', 13, 10, 12000000.0000, 4.5, 26, 4, 0, 1, N'Cảm biến: CMOS 24.2MP

Bộ xử lý hình ảnh: DIGIC 6

ISO: ISO 100 - ISO 6400

Hệ thống lấy nét: 19 điểm

Chụp ảnh liên tục: tối đa khoảng 5,0 ảnh/giây

Truyền hình ảnh nhanh với kết nối Wifi')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Áo Lệch Vai 1 Dây Marc - Xanh', 14, 2, 99000.0000, 4, 27, 5, 0, 1, N'Đường may chắc chắn và tỉ mỉ

Chất vải mềm, bền đẹp, mát, thấm hút mồ hôi

Gam màu trẻ trung thời thượng, dễ phối đồ

Thiết kế trẻ trung, năng động')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Áo Cổ Tròn Rút Dây Tay Lở Marc - Trắng', 16, 3, 236000.0000, 4, 29, 5, 0, 1, N'Size M,L,SKU	5958576912676
Thương hiệu	Marc Fashion
, Sản xuất tại:    Việt Nam
Model:   JH052018
,Chất liệu: Cotton')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Máy Cạo Râu Nam Philips S5070', 17, 1, 2000000.0000, 4.5, 19, 4, 0, 1, N'Hệ thống lưỡi cạo ComfortCut

Dùng không dây 40 phút/sạc 1 giờ

Đầu tỉa chính xác SmartClick')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Macbook Air 2017 MQD32 (13.3 inch)', 18, 1, 20109000.0000, 5, 23, 4, 0, 1, N'Chip: Intel Core i5 Dual-core 1.8 GHz

RAM: 8GB 1600 MHz LPDDR3

Ổ cứng: 128GB PCIe-Based Flash

Chipset đồ họa: Intel HD Graphics 6000

Màn hình: 13.3 inch (900 x 1440 pixels) LED-backlit IPS LCD

Hệ điều hành: macOS Sierra

Pin: Li-Po 54 Wh')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Tai Nghe Bluetooth Chụp Tai Sennheiser Momentum 2.0 ', 20, 1, 10809000.0000, 5, 20, 4, 0, 1, N'Thiết kế hiện đại, phong cách

Chất lượng âm thanh vượt trội

Phím điều chỉnh phát nhạc và microphone

Pin có dung lượng 600 mAh')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Thẻ game Garena 200000', 21, 3, 194000.0000, 4.5, 21, 7, 0, 1, N'Rẻ nhất Hola')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Thẻ điện thoại Viettel, Mobi,Vina 100000', 22, 10, 95000.0000, 4.5, 21, 8, 0, 1, N'Rẻ nhất Hola')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Bánh Qui Đồng Tiền ', 23, 8, 13000.0000, 4, 19, 3, 0, 1, N' Ngon ngon, giảm béo')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Bim Bim trẻ em', 24, 30, 2000.0000, 4.5, 24, 3, 0, 1, N'Trở về tuổi thơ')
INSERT [dbo].[Products] ([ProductName], [ProductID], [Quantity], [Price], [Rate], [UserID], [CategoryID], [Ban], [Active], [Description]) VALUES (N'Sữa vinamilk', 25, 60, 4000.0000, 4.5, 24, 3, 0, 1, N'Rất tốt cho sức khỏe')
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Rating] ([Commend], [Rate], [UserID], [ProductID]) VALUES (N'Giá hợp lí, ăn ngon', 4.5, 20, 25)
INSERT [dbo].[Rating] ([Commend], [Rate], [UserID], [ProductID]) VALUES (N'Ship nhanh', 4, 21, 1)
INSERT [dbo].[Rating] ([Commend], [Rate], [UserID], [ProductID]) VALUES (N'Hay quá, mình ở tầng 5, nếu ship nước từ canteen thì quá mệt. Cảm ơn nhiều', 5, 24, 7)
INSERT [dbo].[Rating] ([Commend], [Rate], [UserID], [ProductID]) VALUES (N'Dùng quá ngon', 5, 26, 4)
INSERT [dbo].[Rating] ([Commend], [Rate], [UserID], [ProductID]) VALUES (N'Ship quá chậm', 3.5, 26, 5)
INSERT [dbo].[Rating] ([Commend], [Rate], [UserID], [ProductID]) VALUES (N'Trả tiền thiếu', 4, 27, 6)
INSERT [dbo].[Rating] ([Commend], [Rate], [UserID], [ProductID]) VALUES (N'Ship nhanh', 4.5, 28, 2)
INSERT [dbo].[Role] ([RoleID], [NameRole]) VALUES (0, N'Admin')
INSERT [dbo].[Role] ([RoleID], [NameRole]) VALUES (1, N'User')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Bui Thanh Tung', N'tungtim@gmail.com', N'tungtim', 19, N'C103', N'nam', N'123456789', 0, 0)
INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Do Van Tuan', N'tuandvse05339@fpt.edu.vn', N'ahihi', 20, N'C508', N'nam ', N'0868455987', 0, 0)
INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Ngyen Van Cuong', N'Cuongnv@gmail.com', N'noname', 21, N'B406', N'nam', N'1346546446', 1, 0)
INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Bui Thi Xuan', N'Conbuomxuan@gmail.com', N'12341234', 22, N'A106', N'nữ ', N'1131346478', 1, 0)
INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Bui Anh Tu', N'tubeo@gmail.com', N'noname', 23, N'D113', N'nam', N'0984625432', 1, 0)
INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Nguyen Van A', N'abc@gmail.com', N'abc@1234', 24, N'F103', N'nam', N'0945321569', 1, 0)
INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Nguyen Van B', N'bac@gmail.com', N'noname', 26, N'A504', N'nam ', N'0946666165', 1, 0)
INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Hoang Thi Mo', N'Mo@gmail.com', N'bietchetlien', 27, N'D306', N'nữ', N'01654232487', 1, 0)
INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Nguyễn Tuấn', N'nguyentuan@fpt.edu.vn', N'nguyentuan', 28, N'Ở Ngoài', N'nam', N'0985236145', 1, 0)
INSERT [dbo].[Users] ([FullName], [Email], [Password], [UserID], [Address], [Gender], [Phone], [Role], [Ban]) VALUES (N'Lưu Ly', N'Ly@fpt.edu.vn', N'lyrem', 29, N'C311', N'nữ', N'0964123455', 1, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Products_ProductName]    Script Date: 8/23/2018 2:00:45 AM ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [UK_Products_ProductName] UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Users_Email]    Script Date: 8/23/2018 2:00:45 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_UserID]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_OrderID]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[OrderStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_UserID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_CategoryID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_UserID]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_ProductID]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_UserID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [CodingProject] SET  READ_WRITE 
GO
