USE [master]
GO
/****** Object:  Database [AdmisionUPSJB]    Script Date: 22/09/2020 06:31:22 ******/
CREATE DATABASE [AdmisionUPSJB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdmisionUPSJB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AdmisionUPSJB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdmisionUPSJB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AdmisionUPSJB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AdmisionUPSJB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdmisionUPSJB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdmisionUPSJB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdmisionUPSJB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdmisionUPSJB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdmisionUPSJB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdmisionUPSJB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AdmisionUPSJB] SET  MULTI_USER 
GO
ALTER DATABASE [AdmisionUPSJB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdmisionUPSJB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdmisionUPSJB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdmisionUPSJB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdmisionUPSJB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdmisionUPSJB] SET QUERY_STORE = OFF
GO
USE [AdmisionUPSJB]
GO
/****** Object:  Table [dbo].[Asistencia]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencia](
	[Id_postulante] [smallint] NULL,
	[FECREG] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[CODESP] [varchar](2) NOT NULL,
	[DESCRIPCION] [varchar](50) NULL,
 CONSTRAINT [PK_Especialidades_1] PRIMARY KEY CLUSTERED 
(
	[CODESP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postulantes]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postulantes](
	[Id_postulante] [smallint] IDENTITY(1,1) NOT NULL,
	[FECREG] [datetime] NULL,
	[TIPDOC] [varchar](1) NULL,
	[NUMDOC] [varchar](11) NULL,
	[CODALU] [varchar](10) NULL,
	[APEPAT] [varchar](40) NULL,
	[APEMAT] [varchar](40) NULL,
	[NOMALU] [varchar](40) NULL,
	[CODESP] [varchar](2) NULL,
	[CODSED] [varchar](2) NULL,
	[AULA] [varchar](3) NULL,
 CONSTRAINT [PK_postulantes] PRIMARY KEY CLUSTERED 
(
	[Id_postulante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sedes]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sedes](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[CODSED] [varchar](2) NOT NULL,
	[DESCRIPCION] [varchar](50) NULL,
 CONSTRAINT [PK_Sedes] PRIMARY KEY CLUSTERED 
(
	[CODSED] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Documento]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Documento](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[TIPDOC] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Tipo_Documento] PRIMARY KEY CLUSTERED 
(
	[TIPDOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asistencia] ([Id_postulante], [FECREG]) VALUES (1, CAST(N'2020-09-22T01:57:37.043' AS DateTime))
GO
INSERT [dbo].[Asistencia] ([Id_postulante], [FECREG]) VALUES (1, CAST(N'2020-09-22T02:34:11.810' AS DateTime))
GO
INSERT [dbo].[Asistencia] ([Id_postulante], [FECREG]) VALUES (1, CAST(N'2020-09-22T05:23:25.433' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Especialidades] ON 
GO
INSERT [dbo].[Especialidades] ([Id], [CODESP], [DESCRIPCION]) VALUES (1, N'01', N'Ingineria de Sistemas')
GO
INSERT [dbo].[Especialidades] ([Id], [CODESP], [DESCRIPCION]) VALUES (2, N'02', N'Ingineria Civil')
GO
INSERT [dbo].[Especialidades] ([Id], [CODESP], [DESCRIPCION]) VALUES (3, N'04', N'Derecho')
GO
INSERT [dbo].[Especialidades] ([Id], [CODESP], [DESCRIPCION]) VALUES (4, N'05', N'Enfermeria')
GO
SET IDENTITY_INSERT [dbo].[Especialidades] OFF
GO
SET IDENTITY_INSERT [dbo].[postulantes] ON 
GO
INSERT [dbo].[postulantes] ([Id_postulante], [FECREG], [TIPDOC], [NUMDOC], [CODALU], [APEPAT], [APEMAT], [NOMALU], [CODESP], [CODSED], [AULA]) VALUES (1, CAST(N'2020-09-21T00:00:00.000' AS DateTime), N'1', N'45022559', N'0001', N'Lazaro', N'Morales', N'Jorge Luis', N'01', N'01', N'101')
GO
INSERT [dbo].[postulantes] ([Id_postulante], [FECREG], [TIPDOC], [NUMDOC], [CODALU], [APEPAT], [APEMAT], [NOMALU], [CODESP], [CODSED], [AULA]) VALUES (2, CAST(N'2020-09-21T00:00:00.000' AS DateTime), N'1', N'45022558', N'0002', N'Marco', N'Parra', N'Miguel', N'01', N'01', N'102')
GO
SET IDENTITY_INSERT [dbo].[postulantes] OFF
GO
SET IDENTITY_INSERT [dbo].[Sedes] ON 
GO
INSERT [dbo].[Sedes] ([Id], [CODSED], [DESCRIPCION]) VALUES (1, N'01', N'Sentral')
GO
INSERT [dbo].[Sedes] ([Id], [CODSED], [DESCRIPCION]) VALUES (2, N'02', N'Sur')
GO
INSERT [dbo].[Sedes] ([Id], [CODSED], [DESCRIPCION]) VALUES (3, N'03', N'Norte')
GO
INSERT [dbo].[Sedes] ([Id], [CODSED], [DESCRIPCION]) VALUES (4, N'04', N'Este')
GO
SET IDENTITY_INSERT [dbo].[Sedes] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Documento] ON 
GO
INSERT [dbo].[Tipo_Documento] ([Id], [TIPDOC]) VALUES (1, N'1')
GO
INSERT [dbo].[Tipo_Documento] ([Id], [TIPDOC]) VALUES (2, N'2')
GO
INSERT [dbo].[Tipo_Documento] ([Id], [TIPDOC]) VALUES (3, N'3')
GO
SET IDENTITY_INSERT [dbo].[Tipo_Documento] OFF
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_Asistencia_postulantes] FOREIGN KEY([Id_postulante])
REFERENCES [dbo].[postulantes] ([Id_postulante])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK_Asistencia_postulantes]
GO
ALTER TABLE [dbo].[postulantes]  WITH CHECK ADD  CONSTRAINT [FK_postulantes_Especialidades] FOREIGN KEY([CODESP])
REFERENCES [dbo].[Especialidades] ([CODESP])
GO
ALTER TABLE [dbo].[postulantes] CHECK CONSTRAINT [FK_postulantes_Especialidades]
GO
ALTER TABLE [dbo].[postulantes]  WITH CHECK ADD  CONSTRAINT [FK_postulantes_Sedes] FOREIGN KEY([CODSED])
REFERENCES [dbo].[Sedes] ([CODSED])
GO
ALTER TABLE [dbo].[postulantes] CHECK CONSTRAINT [FK_postulantes_Sedes]
GO
ALTER TABLE [dbo].[postulantes]  WITH CHECK ADD  CONSTRAINT [FK_postulantes_Tipo_Documento] FOREIGN KEY([TIPDOC])
REFERENCES [dbo].[Tipo_Documento] ([TIPDOC])
GO
ALTER TABLE [dbo].[postulantes] CHECK CONSTRAINT [FK_postulantes_Tipo_Documento]
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarPostulante]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ConsultarPostulante]
  @NUMDOC varchar(11)
as
begin

select  
    Id_postulante,
    FECREG,
    NUMDOC	,
	CODALU,	
	APEPAT,	
	APEMAT,	
	NOMALU
from [dbo].[postulantes] where  NUMDOC = @NUMDOC;

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarEspecialidades]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_ListarEspecialidades]
as
begin
select CODESP,	DESCRIPCION from [dbo].[Especialidades]
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarPostulantes]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ListarPostulantes] 
@CODSED varchar(2),
@CODESP varchar(2)
as
begin
select P.Id_postulante,
       A.FECREG,
       P.NUMDOC	,
	   P.CODALU,	
	   P.APEPAT,	
	   P.APEMAT,	
	   P.NOMALU
from  [dbo].[Asistencia] A
inner join [dbo].[postulantes] P on  P.Id_postulante = A.Id_postulante
where P.CODESP = @CODESP
  and P.CODSED = @CODSED
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarSedes]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_ListarSedes]
as
begin
select CODSED, DESCRIPCION  from [dbo].[Sedes]
end
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarAsistencia]    Script Date: 22/09/2020 06:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_RegistrarAsistencia]
 @Id_postulante smallint

as 
begin


INSERT INTO [dbo].[Asistencia]
           ([Id_postulante]
           ,[FECREG])
     VALUES
           (@Id_postulante,
            getdate());

end
GO
USE [master]
GO
ALTER DATABASE [AdmisionUPSJB] SET  READ_WRITE 
GO
