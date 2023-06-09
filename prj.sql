USE [web_project]
GO
/****** Object:  User [root]    Script Date: 5/27/2023 4:53:24 AM ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[storeId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[count] [int] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[cartId] [bigint] NULL,
	[productId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[image] [varchar](255) NULL,
	[isDeleted] [bit] NULL,
	[name] [nvarchar](32) NOT NULL,
	[slug] [nvarchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commission]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commission](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[cost] [float] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[description] [varchar](3000) NOT NULL,
	[isDeleted] [bit] NULL,
	[name] [varchar](32) NOT NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[description] [nvarchar](1000) NOT NULL,
	[isDeleted] [bit] NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [int] NOT NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[count] [int] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[orderId] [bigint] NOT NULL,
	[productId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[amountFromStore] [float] NOT NULL,
	[amountFromUser] [float] NOT NULL,
	[amountToGD] [float] NOT NULL,
	[amountToStore] [float] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[isPaidBefore] [bit] NULL,
	[phone] [varchar](255) NOT NULL,
	[status] [nvarchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
	[commissionId] [bigint] NULL,
	[deliveryId] [bigint] NULL,
	[storeId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[description] [nvarchar](1000) NOT NULL,
	[isActive] [bit] NULL,
	[isSelling] [bit] NULL,
	[listImages] [varbinary](255) NULL,
	[name] [nvarchar](1000) NOT NULL,
	[price] [float] NOT NULL,
	[promotionalPrice] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[slug] [varchar](255) NULL,
	[sold] [int] NOT NULL,
	[updatedAt] [datetime2](7) NULL,
	[categoryId] [bigint] NULL,
	[storeId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NULL,
	[createdAt] [datetime2](7) NULL,
	[stars] [int] NOT NULL,
	[updatedAt] [datetime2](7) NULL,
	[orderId] [bigint] NULL,
	[productId] [bigint] NULL,
	[storeId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreLevel]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreLevel](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[discount] [float] NOT NULL,
	[isDeleted] [bit] NULL,
	[minPoint] [int] NOT NULL,
	[name] [varchar](32) NOT NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[avatar] [varchar](255) NULL,
	[bio] [nvarchar](1000) NOT NULL,
	[cover] [varchar](255) NULL,
	[createdAt] [datetime2](7) NULL,
	[eWallet] [float] NOT NULL,
	[featuredImages] [varbinary](255) NULL,
	[isActive] [bit] NULL,
	[isOpen] [bit] NULL,
	[name] [nvarchar](100) NOT NULL,
	[point] [int] NOT NULL,
	[rating] [varbinary](255) NULL,
	[slug] [varchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
	[commissionId] [bigint] NULL,
	[ownerId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Style]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Style](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
	[name] [nvarchar](255) NOT NULL,
	[updatedAt] [datetime2](7) NULL,
	[categoryId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StyleValue]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StyleValue](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
	[name] [nvarchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
	[styleId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[amount] [float] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[isUp] [bit] NOT NULL,
	[updatedAt] [datetime2](7) NULL,
	[storeId] [bigint] NOT NULL,
	[userId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFollowProduct]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFollowProduct](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[productId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFollowStore]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFollowStore](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[storeId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLevel]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLevel](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[discount] [float] NOT NULL,
	[isDeleted] [bit] NULL,
	[minPoint] [int] NOT NULL,
	[name] [varchar](32) NOT NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/27/2023 4:53:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[avatar] [varchar](255) NULL,
	[cover] [varchar](255) NULL,
	[createdAt] [datetime2](7) NULL,
	[eWallet] [float] NULL,
	[email] [varchar](255) NULL,
	[firstName] [nvarchar](32) NOT NULL,
	[hashedPassword] [varchar](255) NOT NULL,
	[idCard] [varchar](255) NULL,
	[isEmailActive] [bit] NOT NULL,
	[isPhoneActive] [bit] NOT NULL,
	[lastName] [nvarchar](32) NOT NULL,
	[phone] [varchar](255) NULL,
	[point] [int] NULL,
	[roles] [varchar](255) NULL,
	[salt] [varchar](255) NULL,
	[slug] [varchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([_id], [createdAt], [updatedAt], [storeId], [userId]) VALUES (1, CAST(N'2023-05-27T02:51:29.5990000' AS DateTime2), CAST(N'2023-05-27T02:51:29.5990000' AS DateTime2), 1, 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItem] ON 

INSERT [dbo].[CartItem] ([_id], [count], [createdAt], [updatedAt], [cartId], [productId]) VALUES (1, 1, CAST(N'2023-05-27T02:51:29.6150000' AS DateTime2), CAST(N'2023-05-27T02:51:29.6150000' AS DateTime2), 1, 1)
SET IDENTITY_INSERT [dbo].[CartItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([_id], [createdAt], [image], [isDeleted], [name], [slug], [updatedAt]) VALUES (1, NULL, N'p803dad32-f891-4df4-814a-cbedee66c30f.jpg', 0, N'Áo thun', N'sdafashf', CAST(N'2023-05-27T04:18:11.0320000' AS DateTime2))
INSERT [dbo].[Category] ([_id], [createdAt], [image], [isDeleted], [name], [slug], [updatedAt]) VALUES (2, CAST(N'2023-05-27T02:30:03.9280000' AS DateTime2), N'pef62f4a8-877a-41b7-99c2-80dc86908c87.jpg', 0, N'Áo sơ mi', N'b', CAST(N'2023-05-27T02:30:03.9280000' AS DateTime2))
INSERT [dbo].[Category] ([_id], [createdAt], [image], [isDeleted], [name], [slug], [updatedAt]) VALUES (3, CAST(N'2023-05-27T02:30:58.6800000' AS DateTime2), N'pf7a83e6e-dfc2-4596-9721-1aaf3872221f.jpg', 0, N'Áo polos', N'c', CAST(N'2023-05-27T02:30:58.6800000' AS DateTime2))
INSERT [dbo].[Category] ([_id], [createdAt], [image], [isDeleted], [name], [slug], [updatedAt]) VALUES (4, CAST(N'2023-05-27T02:32:17.0200000' AS DateTime2), N'p3f60bab8-b2b6-4ac3-93eb-c9116b2c9371.jpg', 0, N'Quần tây', N'd', CAST(N'2023-05-27T02:32:17.0200000' AS DateTime2))
INSERT [dbo].[Category] ([_id], [createdAt], [image], [isDeleted], [name], [slug], [updatedAt]) VALUES (5, CAST(N'2023-05-27T02:34:02.6710000' AS DateTime2), N'pe5a947d8-71dc-4f49-973f-c34b0592e100.jpg', 0, N'Quần kaki', N'e', CAST(N'2023-05-27T02:34:02.6710000' AS DateTime2))
INSERT [dbo].[Category] ([_id], [createdAt], [image], [isDeleted], [name], [slug], [updatedAt]) VALUES (6, CAST(N'2023-05-27T02:36:00.7970000' AS DateTime2), N'p7e14ec7d-a367-41a1-9622-30a5445821e2.jpg', 0, N'Quần jean', N'f', CAST(N'2023-05-27T02:36:00.7970000' AS DateTime2))
INSERT [dbo].[Category] ([_id], [createdAt], [image], [isDeleted], [name], [slug], [updatedAt]) VALUES (7, CAST(N'2023-05-27T02:38:24.3380000' AS DateTime2), N'p14078b3c-f4bd-4ce4-8ddb-cf502d03fb12.jpg', 0, N'Áo khoác', N'g', CAST(N'2023-05-27T02:38:24.3380000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([_id], [createdAt], [description], [isDeleted], [name], [price], [updatedAt]) VALUES (1, CAST(N'2023-05-27T03:36:30.1300000' AS DateTime2), N'Vận chuyển trong vòng 24h', 0, N'Vận chuyển nhanh', 50, CAST(N'2023-05-27T03:36:30.1300000' AS DateTime2))
INSERT [dbo].[Delivery] ([_id], [createdAt], [description], [isDeleted], [name], [price], [updatedAt]) VALUES (2, CAST(N'2023-05-27T03:37:09.2650000' AS DateTime2), N'', 0, N'Vận chuyển trong tuần', 30, CAST(N'2023-05-27T03:37:09.2650000' AS DateTime2))
INSERT [dbo].[Delivery] ([_id], [createdAt], [description], [isDeleted], [name], [price], [updatedAt]) VALUES (3, CAST(N'2023-05-27T03:37:26.6830000' AS DateTime2), N'', 0, N'Vận chuyển trong tháng', 20, CAST(N'2023-05-27T03:37:26.6830000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([_id], [count], [createdAt], [updatedAt], [orderId], [productId]) VALUES (1, 2, CAST(N'2023-05-27T03:38:32.2860000' AS DateTime2), CAST(N'2023-05-27T03:38:32.2860000' AS DateTime2), 1, 16)
INSERT [dbo].[OrderItem] ([_id], [count], [createdAt], [updatedAt], [orderId], [productId]) VALUES (2, 1, CAST(N'2023-05-27T03:38:32.2920000' AS DateTime2), CAST(N'2023-05-27T03:38:32.2920000' AS DateTime2), 1, 15)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([_id], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [commissionId], [deliveryId], [storeId], [userId]) VALUES (1, N'Hồ Chí Minh', 0, 1195, 0, 0, CAST(N'2023-05-27T03:38:32.2770000' AS DateTime2), NULL, N'0365817754', N'Chưa xác nhận', CAST(N'2023-05-27T03:38:32.3050000' AS DateTime2), NULL, 2, 4, 5)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (1, CAST(N'2023-05-27T02:41:57.8370000' AS DateTime2), N'Áo khoác nam, áo khoác old sailor', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297065613139616135622D656537662D346164302D386533372D3764646262623932303430372E6A7067, N'Áo khoác nam lót dù Old Sailor', 695, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T02:46:16.0670000' AS DateTime2), 7, 1)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (2, CAST(N'2023-05-27T02:55:29.6530000' AS DateTime2), N'Áo khoác nam, áo khoác old sailor, áo khoác the big size, áo khoác for man, áo khoác đi làm, áo khoác đi chơi, áo khoác nam Hàn Quốc, áo khoác nam đẹp, áo khoác nam form rộng, áo khoác nam form rộng', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297062643361346534372D376236362D343133612D623930352D3061336432646233633537332E6A7067, N'Áo khoác blazer nam Old Sailor', 895, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T02:55:29.6530000' AS DateTime2), 7, 3)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (3, CAST(N'2023-05-27T02:56:33.3300000' AS DateTime2), N'Áo polo nam, áo polo old sailor, áo polo the big size, áo polo for man, áo polo đi làm, áo polo đi chơi, áo polo nam Hàn Quốc', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297036646138653465662D643761312D346233662D613563652D3337313633343362396661612E6A7067, N'Áo polo nam phối màu Old Sailor - O.S.L EYES BIRD COLOR POLO', 365, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T02:58:22.7320000' AS DateTime2), 3, 3)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (4, CAST(N'2023-05-27T02:58:00.3760000' AS DateTime2), N'Áo sơ mi nam, áo sơ mi Old Sailor, áo sơ mi the Big size, áo sơ mi phù hợp phong cách, áo sơ mi họa tiết, áo sơ mi đơn giản, áo sơ mi tinh tế, áo sơ mi dành cho đàn ông, áo sơ mi dành cho đi làm, áo sơ mi dành cho đi chơi', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297063376637383432612D363138302D343434642D393032312D3863396330313532336365622E6A7067, N'Sơ mi nam vải bamboo Old Sailor', 445, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T02:58:00.3760000' AS DateTime2), 1, 3)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (5, CAST(N'2023-05-27T03:00:09.3880000' AS DateTime2), N'Quần kaki nam, quần kaki Hàn Quốc, quần kaki đi làm, quần kaki đi chơi, quần kaki thoải mái, quần kaki đẹp, quần kaki nam the big size, quần kaki Hàn Quốc the big size, quần kaki đi chơi the big size, quần kaki thoải mái the big size, quần kaki đẹp the big size', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297061343962643537382D653366362D343662632D383730392D6539353865306435663762652E6A7067, N'Quần khaki nam basic', 445, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:00:09.3880000' AS DateTime2), 1, 3)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (6, CAST(N'2023-05-27T03:01:38.2530000' AS DateTime2), N'Quần tây là một trong những lựa chọn phù hợp trong mọi hoàn cảnh (như đi làm, đi chơi, đi tiệc,...) nhưng vẫn trang trọng và lịch lãm.', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297035393838356136382D633935362D343462322D626663362D6461623537653131366363382E6A7067, N'Quần tây lưng thun nam', 335, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:01:38.2530000' AS DateTime2), 4, 3)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (7, CAST(N'2023-05-27T03:04:15.9910000' AS DateTime2), N'Sản phẩm của chúng tôi có đủ size từ M - 5XL, luôn luôn đầy đủ size cho tất cả mọi người vì Big size có nghĩa là size nào cũng có, bạn có quyền lựa chọn và bạn có quyền được thoải mái khi đến với Old Sailo', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297039336130613731642D373065372D346563382D613533372D6537666132326539353430652E6A7067, N'Áo polo nam phối màu ', 899, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:04:15.9910000' AS DateTime2), 3, 2)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (8, CAST(N'2023-05-27T03:05:39.3030000' AS DateTime2), N'Thiết kế trẻ trung, trendy cùng họa tiết kẻ ấn tượng sẽ giúp chàng có một diện mạo cuốn hút. Không chỉ vậy chàng muốn level up vẻ cool ngầu thì bung thêm cái cúc, sơ vin nửa vời là crush cũng phải xỉu ngang xỉu dọc.', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297035613738626434622D376161392D343563622D393262342D3236303532346334663233612E6A7067, N'Áo sơ mi nam họa tiết', 499, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:05:39.3030000' AS DateTime2), 2, 2)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (9, CAST(N'2023-05-27T03:07:02.2860000' AS DateTime2), N'Quần jeans, quần jeans nam, quần jeans kiểu cách, quần jeans đi tiệc, quần jeans đi làm, quần jeans đi chơi, quần jeans giá rẻ, quần jeans rách gối, quần jeans the big size, quần jeans nam the big size', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297033396431323863302D303761372D343833612D623034642D3964663333323335303763312E6A7067, N'Quần jean nam', 675, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:09:31.0360000' AS DateTime2), 6, 2)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (10, CAST(N'2023-05-27T03:09:08.7150000' AS DateTime2), N'Quần lửng nam, shorts nam, quần lửng đẹp, quần lửng thời trang, quần lửng mùa hè. Quần lửng thoáng mát, quần lửng cá tính, quần lửng mát mẻ đi biển, quần lửng đi chơi', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297036626463323831662D363833322D346534662D623433332D6230306338323465616466372E6A7067, N'Quần jogger nam', 245, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:09:08.7150000' AS DateTime2), 5, 2)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (11, CAST(N'2023-05-27T03:12:14.0260000' AS DateTime2), N'Áo thun nam, áo thun nam Old Sailor, áo thun nam the big size, áo thun cổ tròn, áo thun cá tính, áo thun năng động, áo thun thiết kế phù hợp xu hướng hiện nay', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297034343532383361622D646364352D343664632D626330612D6536376136656334373833662E6A7067, N'Áo thun nam vải xốp', 244, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:12:14.0260000' AS DateTime2), 1, 4)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (12, CAST(N'2023-05-27T03:13:47.4290000' AS DateTime2), N'Dù bạn ở đâu, dù thời tiết có nắng hay là mưa thì áo khoác chất liệu vải Micro, nút chặn kim loại, Túi ẩn của Old Sailor, the Big size cũng sẽ mang lại cho bạn cảm giác dễ chịu nhất, bởi ngoài kiểu cách thời trang chúng tôi còn muốn khách hàng cảm nhận được sự thoải mái từ bên trong.', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297037326634636332652D366133332D343632662D626136362D3563636362346336643165662E6A7067, N'Áo khoác có nón', 425, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:14:06.3040000' AS DateTime2), 7, 2)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (13, CAST(N'2023-05-27T03:15:44.0950000' AS DateTime2), N'Áo thun nam, áo thun nam Old Sailor, áo thun nam the big size, áo thun cổ tròn, áo thun cá tính, áo thun năng động, áo thun thiết kế phù hợp xu hướng hiện nay', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297065333936326236322D313739362D343066352D623530372D3865333838383236613063372E6A7067, N'Áo thun nam in họa tiết', 245, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:15:44.0950000' AS DateTime2), 1, 4)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (14, CAST(N'2023-05-27T03:18:00.9610000' AS DateTime2), N'Quần thun nam vải xốp Old Sailor - O.S.L ORIGINAL SHORT - BROWN - SHNA88542 - nâu - Big size upto 5XL', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297031323362373331662D353339362D343937652D383435302D3631633134656333363238342E6A7067, N'Quần thun nam vải xốp', 125, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:18:00.9610000' AS DateTime2), 4, 4)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (15, CAST(N'2023-05-27T03:19:42.3360000' AS DateTime2), N'Được làm và kết tinh ra từ chất liệu vải sợi tre tạo cảm giác dễ chịu và thoáng mát cho tất cả mọi người, từ công sở cho tới đi chơi hay chỉ đơn giản là mặc tại nhà, Áo sơ mi của chúng tôi cực kì dễ phối đồ bởi thiết kế đơn giản và tinh gọn.', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297061376339653463342D636166312D343761332D626539662D3563313237393438613234392E706E67, N'BAMBOO SHIRTS - PREMIUM', 375, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:19:42.3360000' AS DateTime2), 2, 4)
INSERT [dbo].[Product] ([_id], [createdAt], [description], [isActive], [isSelling], [listImages], [name], [price], [promotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [categoryId], [storeId]) VALUES (16, CAST(N'2023-05-27T03:21:27.7330000' AS DateTime2), N'Quần jeans, quần jeans nam, quần jeans kiểu cách, quần jeans đi tiệc, quần jeans đi làm, quần jeans đi chơi, quần jeans giá rẻ, quần jeans rách gối', NULL, NULL, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297061616233326336352D613063352D343335622D396231312D3431353432646632373461392E6A7067, N'quần jeans nghệ thuật', 395, 0, 0, 0, NULL, 0, CAST(N'2023-05-27T03:21:27.7330000' AS DateTime2), 6, 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([_id], [avatar], [bio], [cover], [createdAt], [eWallet], [featuredImages], [isActive], [isOpen], [name], [point], [rating], [slug], [updatedAt], [commissionId], [ownerId]) VALUES (1, N'p010d0e1e-acbf-4a97-8caa-6b0d15eb232e.jpg', N'a', N'p608334f6-838f-42c6-bf30-ec59ac62f043.jpg', CAST(N'2023-05-27T02:27:28.3650000' AS DateTime2), 0, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297032643562303236662D643865642D343539322D396165392D3661316530366638396264652E6A7067, NULL, NULL, N'AFK-Shop', 0, NULL, NULL, CAST(N'2023-05-27T02:27:28.3650000' AS DateTime2), NULL, 4)
INSERT [dbo].[Stores] ([_id], [avatar], [bio], [cover], [createdAt], [eWallet], [featuredImages], [isActive], [isOpen], [name], [point], [rating], [slug], [updatedAt], [commissionId], [ownerId]) VALUES (2, N'p799b13e6-3df8-4195-8147-5bc1dd8a888c.jpg', N'b', N'pf18bc9e7-aab5-4814-86ce-1ddf43e3d903.jpg', CAST(N'2023-05-27T02:45:42.1920000' AS DateTime2), 0, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297032376238643838342D373938342D346631312D616262302D3231633438376437393131312E6A7067, NULL, NULL, N'TTT-Shop', 0, NULL, NULL, CAST(N'2023-05-27T02:45:42.1920000' AS DateTime2), NULL, 5)
INSERT [dbo].[Stores] ([_id], [avatar], [bio], [cover], [createdAt], [eWallet], [featuredImages], [isActive], [isOpen], [name], [point], [rating], [slug], [updatedAt], [commissionId], [ownerId]) VALUES (3, N'p164be21d-0351-4bf2-990a-4a3094970cfe.jpg', N'f', N'paaaa45e8-53c4-4839-8526-c36528471308.jpg', CAST(N'2023-05-27T02:50:07.8240000' AS DateTime2), 0, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297033396630376234632D373166622D346635362D383730302D6235393836616666636538632E6A7067, NULL, NULL, N'Nam_Shop', 0, NULL, NULL, CAST(N'2023-05-27T02:50:07.8240000' AS DateTime2), NULL, 6)
INSERT [dbo].[Stores] ([_id], [avatar], [bio], [cover], [createdAt], [eWallet], [featuredImages], [isActive], [isOpen], [name], [point], [rating], [slug], [updatedAt], [commissionId], [ownerId]) VALUES (4, N'p58ee4aa8-7777-436a-9d95-ee53788b29ee.jpg', N'h', N'p4ad15aac-2965-45e3-b58f-5ebbadf1a401.jpg', CAST(N'2023-05-27T02:53:04.4430000' AS DateTime2), 0, 0xACED0005757200135B4C6A6176612E6C616E672E537472696E673BADD256E7E91D7B470200007870000000017400297066373164626236382D306337662D343637382D386235322D3034366239386236636135372E6A7067, NULL, NULL, N'Phat_PP-Shop', 0, NULL, NULL, CAST(N'2023-05-27T02:53:04.4430000' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
SET IDENTITY_INSERT [dbo].[Style] ON 

INSERT [dbo].[Style] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [categoryId]) VALUES (1, CAST(N'2023-05-27T03:40:45.8200000' AS DateTime2), 0, N'Màu sắc', CAST(N'2023-05-27T03:40:45.8200000' AS DateTime2), 1)
INSERT [dbo].[Style] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [categoryId]) VALUES (2, CAST(N'2023-05-27T03:41:27.2840000' AS DateTime2), 0, N'Size', CAST(N'2023-05-27T03:41:27.2840000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Style] OFF
GO
SET IDENTITY_INSERT [dbo].[StyleValue] ON 

INSERT [dbo].[StyleValue] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [styleId]) VALUES (1, CAST(N'2023-05-27T03:40:51.7950000' AS DateTime2), NULL, N'Xanh', CAST(N'2023-05-27T03:40:51.7950000' AS DateTime2), 1)
INSERT [dbo].[StyleValue] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [styleId]) VALUES (2, CAST(N'2023-05-27T03:40:56.2480000' AS DateTime2), NULL, N'Đỏ', CAST(N'2023-05-27T03:40:56.2480000' AS DateTime2), 1)
INSERT [dbo].[StyleValue] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [styleId]) VALUES (3, CAST(N'2023-05-27T03:41:03.6860000' AS DateTime2), NULL, N'Đen', CAST(N'2023-05-27T03:41:03.6860000' AS DateTime2), 1)
INSERT [dbo].[StyleValue] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [styleId]) VALUES (4, CAST(N'2023-05-27T03:41:08.6220000' AS DateTime2), NULL, N'Vàng', CAST(N'2023-05-27T03:41:08.6220000' AS DateTime2), 1)
INSERT [dbo].[StyleValue] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [styleId]) VALUES (5, CAST(N'2023-05-27T03:41:36.2180000' AS DateTime2), NULL, N'M', CAST(N'2023-05-27T03:41:36.2180000' AS DateTime2), 2)
INSERT [dbo].[StyleValue] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [styleId]) VALUES (6, CAST(N'2023-05-27T03:41:39.6840000' AS DateTime2), NULL, N'S', CAST(N'2023-05-27T03:41:39.6840000' AS DateTime2), 2)
INSERT [dbo].[StyleValue] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [styleId]) VALUES (7, CAST(N'2023-05-27T03:41:45.5970000' AS DateTime2), NULL, N'XL', CAST(N'2023-05-27T03:41:45.5970000' AS DateTime2), 2)
INSERT [dbo].[StyleValue] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [styleId]) VALUES (8, CAST(N'2023-05-27T03:41:48.2820000' AS DateTime2), NULL, N'L', CAST(N'2023-05-27T03:41:48.2820000' AS DateTime2), 2)
INSERT [dbo].[StyleValue] ([_id], [createdAt], [isDeleted], [name], [updatedAt], [styleId]) VALUES (9, CAST(N'2023-05-27T03:41:51.5750000' AS DateTime2), NULL, N'XXL', CAST(N'2023-05-27T03:41:51.5750000' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[StyleValue] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([_id], [address], [avatar], [cover], [createdAt], [eWallet], [email], [firstName], [hashedPassword], [idCard], [isEmailActive], [isPhoneActive], [lastName], [phone], [point], [roles], [salt], [slug], [updatedAt]) VALUES (1, NULL, NULL, NULL, CAST(N'2023-05-27T02:16:36.8160000' AS DateTime2), NULL, N'catphong2002@gmail.com', N'Nguyễn', N'$2a$10$kZjSjjUnC7bPRNTMke4pwOF81.6MAOick6tx3YlDJAeaNs2j.AoDi', N'215570371', 0, 0, N'Phát', N'0365817754', NULL, N'user', NULL, NULL, CAST(N'2023-05-27T02:16:36.8160000' AS DateTime2))
INSERT [dbo].[Users] ([_id], [address], [avatar], [cover], [createdAt], [eWallet], [email], [firstName], [hashedPassword], [idCard], [isEmailActive], [isPhoneActive], [lastName], [phone], [point], [roles], [salt], [slug], [updatedAt]) VALUES (3, NULL, NULL, NULL, CAST(N'2023-05-27T02:17:56.6780000' AS DateTime2), NULL, N'admin@gmail.com', N'Nguyễn', N'$2a$10$4CMR7jdSQFcJKLvLILqXce2zrUWGIqVnGovsIAorHd2XjOyzoDC5G', N'215570372', 0, 0, N'Phát', N'0898912345', NULL, N'admin', NULL, NULL, CAST(N'2023-05-27T02:17:56.6780000' AS DateTime2))
INSERT [dbo].[Users] ([_id], [address], [avatar], [cover], [createdAt], [eWallet], [email], [firstName], [hashedPassword], [idCard], [isEmailActive], [isPhoneActive], [lastName], [phone], [point], [roles], [salt], [slug], [updatedAt]) VALUES (4, NULL, NULL, NULL, CAST(N'2023-05-27T02:24:28.8390000' AS DateTime2), NULL, N'tien@gmail.com', N'Bùi', N'$2a$10$I5XVf/1ICXk6XzuUuGRDOOcLDGfqE/sas99ICdiflF1Vdci6dVybS', N'215570373', 0, 0, N'Tiên', N'1234567893', NULL, N'user', NULL, NULL, CAST(N'2023-05-27T02:24:28.8390000' AS DateTime2))
INSERT [dbo].[Users] ([_id], [address], [avatar], [cover], [createdAt], [eWallet], [email], [firstName], [hashedPassword], [idCard], [isEmailActive], [isPhoneActive], [lastName], [phone], [point], [roles], [salt], [slug], [updatedAt]) VALUES (5, NULL, NULL, NULL, CAST(N'2023-05-27T02:44:02.0130000' AS DateTime2), NULL, N'thoai@gmail.com', N'Từ', N'$2a$10$JWe.wxfwtzmxvnZhy6zUUO3q2COV5FRpXa0jUR1Ch5bW5tg8NtQrK', N'215570374', 0, 0, N'Thoại', N'098764362', NULL, N'user', NULL, NULL, CAST(N'2023-05-27T02:44:02.0130000' AS DateTime2))
INSERT [dbo].[Users] ([_id], [address], [avatar], [cover], [createdAt], [eWallet], [email], [firstName], [hashedPassword], [idCard], [isEmailActive], [isPhoneActive], [lastName], [phone], [point], [roles], [salt], [slug], [updatedAt]) VALUES (6, NULL, NULL, NULL, CAST(N'2023-05-27T02:49:01.6280000' AS DateTime2), NULL, N'nam@gmail.com', N'Trần', N'$2a$10$/6AaAyk2TjN2k/5lMgPq.urRSZxjahpTO8rWhYQRWGjMtmJmSxUdO', N'212270543', 0, 0, N'Nam', N'0974223478', NULL, N'user', NULL, NULL, CAST(N'2023-05-27T02:49:01.6280000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_foei036ov74bv692o5lh5oi66]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UK_foei036ov74bv692o5lh5oi66] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_cthaeyihb427j99g0plrgnjac]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[Commission] ADD  CONSTRAINT [UK_cthaeyihb427j99g0plrgnjac] UNIQUE NONCLUSTERED 
(
	[cost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_i89318ys48agaxg66rapbmwjd]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[Commission] ADD  CONSTRAINT [UK_i89318ys48agaxg66rapbmwjd] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_gtijw1lyfmya1htq1710oyije]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[Delivery] ADD  CONSTRAINT [UK_gtijw1lyfmya1htq1710oyije] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_3e3gajsmc1pah99g156l3jx38]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[StoreLevel] ADD  CONSTRAINT [UK_3e3gajsmc1pah99g156l3jx38] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_ihxdb02km9mk7hrijtkwohy0s]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[StoreLevel] ADD  CONSTRAINT [UK_ihxdb02km9mk7hrijtkwohy0s] UNIQUE NONCLUSTERED 
(
	[minPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_q9aiko1f4vw1cywu2qx1r0lxe]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[Stores] ADD  CONSTRAINT [UK_q9aiko1f4vw1cywu2qx1r0lxe] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_1l0fqi6vl42m31m1v1kbsnb51]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[Style] ADD  CONSTRAINT [UK_1l0fqi6vl42m31m1v1kbsnb51] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_jnfgq0hj9mbrdv9mvs1ury78o]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[UserLevel] ADD  CONSTRAINT [UK_jnfgq0hj9mbrdv9mvs1ury78o] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_py9kne8862oj4vhwecwuhwl30]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[UserLevel] ADD  CONSTRAINT [UK_py9kne8862oj4vhwecwuhwl30] UNIQUE NONCLUSTERED 
(
	[minPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_e8pwwyd4x0tdcvbeust6x0pyg]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_e8pwwyd4x0tdcvbeust6x0pyg] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_ncoa9bfasrql0x4nhmh1plxxy]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_ncoa9bfasrql0x4nhmh1plxxy] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_r8xtu21qxmruqe6xxmr0ynvuo]    Script Date: 5/27/2023 4:53:24 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_r8xtu21qxmruqe6xxmr0ynvuo] UNIQUE NONCLUSTERED 
(
	[idCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK56jhamibyhrwmqq83d8dvkk8i] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK56jhamibyhrwmqq83d8dvkk8i]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK8badkl4hyi91r30iy5pdllj2c] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK8badkl4hyi91r30iy5pdllj2c]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK1ddqmbytuin6giodgt7m8ele5] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([_id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK1ddqmbytuin6giodgt7m8ele5]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FKfm2xpv0aksxnpoucoywb41f86] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([_id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FKfm2xpv0aksxnpoucoywb41f86]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK12pimxsfi75oqfugkd53la3pb] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([_id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK12pimxsfi75oqfugkd53la3pb]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FKl8avcrunmvqdcldoec2duhdiq] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([_id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FKl8avcrunmvqdcldoec2duhdiq]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK3l71r543jmgg0gcf6c240i2ig] FOREIGN KEY([commissionId])
REFERENCES [dbo].[Commission] ([_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK3l71r543jmgg0gcf6c240i2ig]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK8irfi0mrlch2uaghfn35b3psj] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK8irfi0mrlch2uaghfn35b3psj]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FKhpcu7jevrf0dmnte1pyyy8xrk] FOREIGN KEY([deliveryId])
REFERENCES [dbo].[Delivery] ([_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FKhpcu7jevrf0dmnte1pyyy8xrk]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FKipog0as9ckoo6qf2t0lwk3mbe] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FKipog0as9ckoo6qf2t0lwk3mbe]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK42iy97xlo64j31dslbn36vmyh] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK42iy97xlo64j31dslbn36vmyh]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK6s1lvcwo8aidbq7e2bvkifcl8] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK6s1lvcwo8aidbq7e2bvkifcl8]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKd756nyvyqf682gjmye8x0dmgm] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKd756nyvyqf682gjmye8x0dmgm]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKj40p2rl0ign9b1sqw17hha5hr] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKj40p2rl0ign9b1sqw17hha5hr]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKodt7pvbpf8jfwykxvrviqwdxm] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKodt7pvbpf8jfwykxvrviqwdxm]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKsw4540dpplaoc7wlvnc5lgtih] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKsw4540dpplaoc7wlvnc5lgtih]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FKevj60nt2yks07jfyy1753suwc] FOREIGN KEY([ownerId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FKevj60nt2yks07jfyy1753suwc]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FKn5c3ae92y2nltohgdmkf5f2dl] FOREIGN KEY([commissionId])
REFERENCES [dbo].[Commission] ([_id])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FKn5c3ae92y2nltohgdmkf5f2dl]
GO
ALTER TABLE [dbo].[Style]  WITH CHECK ADD  CONSTRAINT [FKodtqqd8l7wxie8o2nrla3wq4x] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([_id])
GO
ALTER TABLE [dbo].[Style] CHECK CONSTRAINT [FKodtqqd8l7wxie8o2nrla3wq4x]
GO
ALTER TABLE [dbo].[StyleValue]  WITH CHECK ADD  CONSTRAINT [FKtoebbw96g906jruek55xcr7q5] FOREIGN KEY([styleId])
REFERENCES [dbo].[Style] ([_id])
GO
ALTER TABLE [dbo].[StyleValue] CHECK CONSTRAINT [FKtoebbw96g906jruek55xcr7q5]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FKf21aa058kessk3psypjm7fmuq] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FKf21aa058kessk3psypjm7fmuq]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FKi0rmqsu2c60q6i0ulfj31b2qd] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FKi0rmqsu2c60q6i0ulfj31b2qd]
GO
ALTER TABLE [dbo].[UserFollowProduct]  WITH CHECK ADD  CONSTRAINT [FKcs97uyao2yl9almoojiy7glan] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[UserFollowProduct] CHECK CONSTRAINT [FKcs97uyao2yl9almoojiy7glan]
GO
ALTER TABLE [dbo].[UserFollowProduct]  WITH CHECK ADD  CONSTRAINT [FKjjlvwg6euk1c7hk5i2upp81ey] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([_id])
GO
ALTER TABLE [dbo].[UserFollowProduct] CHECK CONSTRAINT [FKjjlvwg6euk1c7hk5i2upp81ey]
GO
ALTER TABLE [dbo].[UserFollowStore]  WITH CHECK ADD  CONSTRAINT [FK16s7oooj6fk69shedixjegf38] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[UserFollowStore] CHECK CONSTRAINT [FK16s7oooj6fk69shedixjegf38]
GO
ALTER TABLE [dbo].[UserFollowStore]  WITH CHECK ADD  CONSTRAINT [FKhpqnnquu8hrjah6mwlb1vvjxs] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[UserFollowStore] CHECK CONSTRAINT [FKhpqnnquu8hrjah6mwlb1vvjxs]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD CHECK  (([count]>=(1)))
GO
ALTER TABLE [dbo].[Commission]  WITH CHECK ADD CHECK  (([cost]>=(0)))
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD CHECK  (([count]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([amountFromStore]>=(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([amountFromUser]>=(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([amountToGD]>=(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([amountToStore]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([promotionalPrice]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([sold]>=(0)))
GO
