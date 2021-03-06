USE [DbMvcOkul]
GO
/****** Object:  Table [dbo].[TblDersler]    Script Date: 13.03.2022 05:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDersler](
	[DersId] [tinyint] IDENTITY(1,1) NOT NULL,
	[DersAd] [varchar](50) NULL,
 CONSTRAINT [PK_TblDersler] PRIMARY KEY CLUSTERED 
(
	[DersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblKulupler]    Script Date: 13.03.2022 05:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblKulupler](
	[KulupId] [tinyint] IDENTITY(1,1) NOT NULL,
	[KulupAd] [varchar](50) NULL,
	[KulupKontenjan] [smallint] NULL,
 CONSTRAINT [PK_TblKulupler] PRIMARY KEY CLUSTERED 
(
	[KulupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblNotlar]    Script Date: 13.03.2022 05:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblNotlar](
	[NotId] [int] IDENTITY(1,1) NOT NULL,
	[DersId] [tinyint] NULL,
	[OgrId] [int] NULL,
	[Sınav1] [tinyint] NULL,
	[Sınav2] [tinyint] NULL,
	[Sınav3] [tinyint] NULL,
	[Proje] [tinyint] NULL,
	[Ortalama] [decimal](18, 2) NULL,
	[durum] [bit] NULL,
 CONSTRAINT [PK_TblNotlar] PRIMARY KEY CLUSTERED 
(
	[NotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOgrenciler]    Script Date: 13.03.2022 05:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOgrenciler](
	[OgrId] [int] IDENTITY(1,1) NOT NULL,
	[OgrAd] [varchar](50) NULL,
	[OgrSoyad] [varchar](50) NULL,
	[OgrCinsiyet] [varchar](7) NULL,
	[OgrKulup] [tinyint] NULL,
	[OgrFoto] [varchar](250) NULL,
 CONSTRAINT [PK_TblOgrenci] PRIMARY KEY CLUSTERED 
(
	[OgrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Sınav1]  DEFAULT ((0)) FOR [Sınav1]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Sınav2]  DEFAULT ((0)) FOR [Sınav2]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Sınav3]  DEFAULT ((0)) FOR [Sınav3]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Proje]  DEFAULT ((0)) FOR [Proje]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Ortalama]  DEFAULT ((0)) FOR [Ortalama]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_durum]  DEFAULT ((0)) FOR [durum]
GO
ALTER TABLE [dbo].[TblNotlar]  WITH CHECK ADD  CONSTRAINT [FK_TblNotlar_TblDersler] FOREIGN KEY([DersId])
REFERENCES [dbo].[TblDersler] ([DersId])
GO
ALTER TABLE [dbo].[TblNotlar] CHECK CONSTRAINT [FK_TblNotlar_TblDersler]
GO
ALTER TABLE [dbo].[TblNotlar]  WITH CHECK ADD  CONSTRAINT [FK_TblNotlar_TblOgrenciler] FOREIGN KEY([OgrId])
REFERENCES [dbo].[TblOgrenciler] ([OgrId])
GO
ALTER TABLE [dbo].[TblNotlar] CHECK CONSTRAINT [FK_TblNotlar_TblOgrenciler]
GO
ALTER TABLE [dbo].[TblOgrenciler]  WITH CHECK ADD  CONSTRAINT [FK_TblOgrenciler_TblKulupler] FOREIGN KEY([OgrKulup])
REFERENCES [dbo].[TblKulupler] ([KulupId])
GO
ALTER TABLE [dbo].[TblOgrenciler] CHECK CONSTRAINT [FK_TblOgrenciler_TblKulupler]
GO
