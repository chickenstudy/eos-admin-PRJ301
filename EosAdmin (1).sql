USE [master]
GO
/****** Object:  Database [eosAdmin]    Script Date: 04/03/2023 3:06:34 CH ******/
CREATE DATABASE [eosAdmin]
GO
USE [eosAdmin]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 04/03/2023 3:06:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [nvarchar](50) NULL,
	[c_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 04/03/2023 3:06:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quest] [nvarchar](50) NULL,
	[option_a] [nvarchar](50) NULL,
	[option_b] [nvarchar](50) NULL,
	[option_c] [nvarchar](50) NULL,
	[option_d] [nvarchar](50) NULL,
	[right_option] [nvarchar](50) NULL,
	[id_test] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 04/03/2023 3:06:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[t_name] [nvarchar](50) NULL,
	[t_type] [nvarchar](50) NULL,
	[t_code] [nvarchar](50) NULL,
	[id_course] [int] NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/03/2023 3:06:34 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[user_name] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[dob] [date] NULL,
    [sex] [nvarchar](10) NULL,
    [address] [nvarchar](100) NULL,
	[email] [nvarchar](50) NULL,
    [PhoneNumber] [nvarchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [c_name], [c_code]) VALUES (1, N'Java web application', N'PRJ301')
INSERT [dbo].[Course] ([id], [c_name], [c_code]) VALUES (2, N'Front end wed', N'WED201c')
INSERT [dbo].[Course] ([id], [c_name], [c_code]) VALUES (3, N'Data and structure', N'CSD201')
INSERT [dbo].[Course] ([id], [c_name], [c_code]) VALUES (4, N'Fundemental programing', N'PRF101')
INSERT [dbo].[Course] ([id], [c_name], [c_code]) VALUES (5, N'Daisy111 Kennedy', N'EXD4891')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [quest], [option_a], [option_b], [option_c], [option_d], [right_option], [id_test]) VALUES (1, N'C la ngon ngu lap trinh kieu gi', N'pop', N'oop', N'fop', N'aod', N'pop', 1)
INSERT [dbo].[Question] ([id], [quest], [option_a], [option_b], [option_c], [option_d], [right_option], [id_test]) VALUES (2, N'Ham o trong c', N'main', N'void', N'pubic', N'abc', N'void', 1)
INSERT [dbo].[Question] ([id], [quest], [option_a], [option_b], [option_c], [option_d], [right_option], [id_test]) VALUES (3, N'jsp la gi', N'trang viet html', N'trang giay trang', N'chiu cung', N'trang nay viet fe cho servlet nha', N'chiu cung', 3)
INSERT [dbo].[Question] ([id], [quest], [option_a], [option_b], [option_c], [option_d], [right_option], [id_test]) VALUES (4, N'web.xml la gi', N'database', N'file cau hinh', N'file lam giao dien', N'khong biet', N'file lam giao dien', 3)
INSERT [dbo].[Question] ([id], [quest], [option_a], [option_b], [option_c], [option_d], [right_option], [id_test]) VALUES (5, N'overiding vs overload', N'giong nhau', N'override la ghi de', N'overload là tai de', N'khac nhau', N'khac nhau', 3)
INSERT [dbo].[Question] ([id], [quest], [option_a], [option_b], [option_c], [option_d], [right_option], [id_test]) VALUES (6, N'adu', N'sdaasd', N'ádasdasd', N'fxcvxcv', N'sfsd', N'sdaasd', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([id], [t_name], [t_type], [t_code], [id_course]) VALUES (1, N'Test 1 nhập môn lập trình', N'PT1', N'SUMMER2022_PT1', 4)
INSERT [dbo].[Test] ([id], [t_name], [t_type], [t_code], [id_course]) VALUES (2, N'Pratical Exam PRJ', N'PE', N'SPRING23_PR-PRJ344', 1)
INSERT [dbo].[Test] ([id], [t_name], [t_type], [t_code], [id_course]) VALUES (3, N'Test 2 PRJ', N'PT2', N'SPRING23_PT2_PRJ_1324', 1)
INSERT [dbo].[Test] ([id], [t_name], [t_type], [t_code], [id_course]) VALUES (4, N'Daisy111 Kennedy', N'EDD', N'EXD4', 1)
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT INTO [dbo].[Users] ([FullName], [user_name], [password], [dob], [sex], [address], [email], [PhoneNumber])
VALUES ('nguyen van a', 'admin', 'admin', '1990-01-01', 'male', 'Ha Noi', 'admin@gmail.com', '123456'),
       ('nguyen van b', 'abc', 'abc', '1990-02-02', 'male', 'bacgiang', 'abc@gmail.com', '456789')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Test] FOREIGN KEY([id_test])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Test]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Course] FOREIGN KEY([id_course])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Course]
GO
USE [master]
GO
ALTER DATABASE [eosAdmin] SET  READ_WRITE 
GO
