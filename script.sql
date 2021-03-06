USE [ManagerRoom2]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 7/22/2021 2:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[address] [nchar](50) NULL,
	[CCCD] [nchar](50) NULL,
	[gender] [bit] NULL,
	[Money] [float] NULL,
	[UserId] [int] NULL,
	[RoomId] [int] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/22/2021 2:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[month] [int] NULL,
	[eletricNumber] [float] NULL,
	[waterNumber] [float] NULL,
	[total] [float] NULL,
	[RoomId] [int] NULL,
	[isPay] [bit] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requestment]    Script Date: 7/22/2021 2:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requestment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[RoomId] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_Requestment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/22/2021 2:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NULL,
	[RoomType] [nchar](50) NULL,
	[available] [bit] NULL,
	[electricPrice] [float] NULL,
	[waterPricce] [float] NULL,
	[wifi] [float] NULL,
	[clean] [float] NULL,
	[mothPrice] [float] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 7/22/2021 2:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](50) NULL,
	[password] [nchar](50) NULL,
	[userType] [nchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (1, N'a', CAST(N'2021-07-01' AS Date), N'HN                                                ', N'123456                                            ', 1, 195, 5, 7)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (2, N'x1', CAST(N'2021-07-08' AS Date), N'x1                                                ', N'x1                                                ', 0, 41183000, 8, NULL)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (3, N'x2', CAST(N'2021-07-21' AS Date), N'x2                                                ', N'x2                                                ', 0, 0, 9, 1)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (4, N't1', CAST(N'2021-07-15' AS Date), N't1                                                ', N't1                                                ', 0, 0, 10, NULL)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (5, N't2', CAST(N'2021-07-06' AS Date), N't2                                                ', N't2                                                ', 0, 50000, 11, 7)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (6, N'duong', CAST(N'2021-07-22' AS Date), N'hb                                                ', N'123                                               ', 0, 48243000, 12, 13)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (7, N'Nguyen Phu Hung', CAST(N'2222-02-02' AS Date), N'dai hoc fpt ha noi                                ', N'1900                                              ', 0, 3304445, 13, 14)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (8, N'quoc', CAST(N'2004-09-03' AS Date), N'aaaa                                              ', N'222222                                            ', 0, 0, 14, NULL)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (9, N'kl', CAST(N'2222-02-22' AS Date), N'sss                                               ', N'22                                                ', 0, 0, 16, NULL)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (10, N'nguyen khanh linh', CAST(N'2222-12-22' AS Date), N'sadasdas                                          ', N'23123123                                          ', 0, 0, 17, 8)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (11, N'nguyen thu trang', CAST(N'2000-12-11' AS Date), N'zxbvm                                             ', N'45439857                                          ', 0, 4756996, 18, 8)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (12, N'phu quoc', CAST(N'2004-09-03' AS Date), N'sdfsddd                                           ', N'2312312                                           ', 1, 4422000, 19, 18)
INSERT [dbo].[Member] ([id], [Name], [dob], [address], [CCCD], [gender], [Money], [UserId], [RoomId]) VALUES (13, N'hung phu nguyen', CAST(N'2222-02-22' AS Date), N'dssssss                                           ', N'321312321                                         ', 1, 4848780, 20, 7)
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (2, 2, 20, 20, 5260000, 1, 1)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (3, 3, 9, 4, 5147000, 1, 1)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (5, 5, 1, 3, 109066, 7, 1)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (6, 1, 20, 20, 240000, 13, 1)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (7, 2, 23, 23, 267000, 13, 1)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (8, 3, 3, 3, 87000, 13, 1)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (9, 6, 22, 22, 172484, 7, 0)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (10, 7, 44, 33, 238726, 7, 0)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (13, 4, 10, 10, 150000, 13, 0)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (14, 7, 20, 10, 1695555, 14, 1)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (15, 7, 20, 20, 243004, 8, 1)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (16, 2, 2, 2, 5116000, 1, 0)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (17, 7, 2, 2, 578000, 18, 1)
INSERT [dbo].[Payment] ([id], [month], [eletricNumber], [waterNumber], [total], [RoomId], [isPay]) VALUES (18, 8, 15, 10, 151220, 7, 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[Requestment] ON 

INSERT [dbo].[Requestment] ([id], [MemberId], [RoomId], [date]) VALUES (7, 9, 7, CAST(N'2021-07-14 15:54:46.170' AS DateTime))
SET IDENTITY_INSERT [dbo].[Requestment] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (1, N'120                                               ', N'Vip                                               ', 1, 3000, 5000, 50000, 50000, 5000000)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (3, N'314                                               ', N'Vip                                               ', 0, 5000, 5000, 50000, 40000, 5000000)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (5, N'412                                               ', N'Normal                                            ', 1, 5000, 5000, 50000, 40000, 5000000)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (6, N'512                                               ', N'Poor                                              ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (7, N'113                                               ', N'Vip                                               ', 0, 3000, 22, 50000, 50000, 6000)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (8, N'114                                               ', N'Vip                                               ', 0, 2000, 5000, 50000, 50000, 3004)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (11, N'105                                               ', N'Vip                                               ', 0, 3000, 5000, 5000, 5000, 444444)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (12, N'213                                               ', N'Vip                                               ', 1, 3000, 5000, 5000, 5000, 3)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (13, N'201                                               ', N'Vip                                               ', 0, 3000, 6000, 5000, 5000, 50000)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (14, N'501                                               ', N'Vip                                               ', 0, 5000, 4000, 50000, 5555, 1500000)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (15, N'117                                               ', N'Normal                                            ', 0, 3000, 3000, 50000, 20000, 1500000)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (18, N'302                                               ', N'Poor                                              ', 0, 2000, 2000, 50000, 20000, 500000)
INSERT [dbo].[Room] ([Id], [Name], [RoomType], [available], [electricPrice], [waterPricce], [wifi], [clean], [mothPrice]) VALUES (20, N'308                                               ', N'Vip                                               ', 0, 5000, 5000, 50000, 20000, 1500000)
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (1, N'admin                                             ', N'admin                                             ', N'admin                                             ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (2, N'mr d                                              ', N'123                                               ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (5, N'c                                                 ', N'c                                                 ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (8, N'x1                                                ', N'x1                                                ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (9, N'x2                                                ', N'x2                                                ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (10, N't1                                                ', N't1                                                ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (11, N't2                                                ', N't2                                                ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (12, N'demo1                                             ', N'demo1                                             ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (13, N'hung                                              ', N'hung                                              ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (14, N'quoc                                              ', N'quoc                                              ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (15, N'tung174                                           ', N'1                                                 ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (16, N'kl                                                ', N'kl                                                ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (17, N'linh                                              ', N'linh                                              ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (18, N'trang                                             ', N'trang                                             ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (19, N'quoclui                                           ', N'quoclui                                           ', N'user                                              ')
INSERT [dbo].[User] ([id], [username], [password], [userType]) VALUES (20, N'h1                                                ', N'h1                                                ', N'user                                              ')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Room]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_User]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Room]
GO
ALTER TABLE [dbo].[Requestment]  WITH CHECK ADD  CONSTRAINT [FK_Requestment_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([id])
GO
ALTER TABLE [dbo].[Requestment] CHECK CONSTRAINT [FK_Requestment_Member]
GO
ALTER TABLE [dbo].[Requestment]  WITH CHECK ADD  CONSTRAINT [FK_Requestment_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Requestment] CHECK CONSTRAINT [FK_Requestment_Room]
GO
