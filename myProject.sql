USE [master]
GO
/****** Object:  Database [p7g8]    Script Date: 6/8/2019 11:36:25 AM ******/
CREATE DATABASE [p7g8]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'p7g8', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p7g8.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'p7g8_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p7g8_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [p7g8] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [p7g8].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [p7g8] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [p7g8] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [p7g8] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [p7g8] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [p7g8] SET ARITHABORT OFF 
GO
ALTER DATABASE [p7g8] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [p7g8] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [p7g8] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [p7g8] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [p7g8] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [p7g8] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [p7g8] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [p7g8] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [p7g8] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [p7g8] SET  ENABLE_BROKER 
GO
ALTER DATABASE [p7g8] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [p7g8] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [p7g8] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [p7g8] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [p7g8] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [p7g8] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [p7g8] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [p7g8] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [p7g8] SET  MULTI_USER 
GO
ALTER DATABASE [p7g8] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [p7g8] SET DB_CHAINING OFF 
GO
ALTER DATABASE [p7g8] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [p7g8] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [p7g8] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [p7g8] SET QUERY_STORE = OFF
GO
USE [p7g8]
GO
/****** Object:  User [p7g8]    Script Date: 6/8/2019 11:36:26 AM ******/
CREATE USER [p7g8] FOR LOGIN [p7g8] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [p7g8]
GO
/****** Object:  Table [dbo].[Sementes]    Script Date: 6/8/2019 11:36:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sementes](
	[tempo_preservacao] [int] NOT NULL,
	[tempo_germinacao] [int] NOT NULL,
	[data_plantio] [varchar](15) NOT NULL,
	[Nu_loteSementes] [int] NOT NULL,
	[FuncionarioNif] [int] NOT NULL,
	[Nif_fornecedor] [int] NOT NULL,
	[Nu_sementes] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nu_loteSementes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[plantacoes]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[plantacoes] AS
Select *
FROM Sementes
GO
/****** Object:  View [dbo].[plantacoes Above Average NuSementes]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[plantacoes Above Average NuSementes] AS
Select *
FROM Sementes
WHERE Nu_sementes > (Select AVG(Nu_sementes) FROM Sementes)
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[nome] [varchar](55) NOT NULL,
	[nif] [int] NOT NULL,
	[tipo_contrato] [varchar](55) NOT NULL,
	[tipo_de_trabalho] [varchar](255) NOT NULL,
	[salario] [decimal](10, 2) NULL,
	[horas_semanais] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[QtdSeedsByLote]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[QtdSeedsByLote] AS
Select nome, Nu_sementes, Nu_loteSementes From Sementes s JOIN Funcionario f on F.nif=S.FuncionarioNif
GO
/****** Object:  Table [dbo].[Equipamento]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipamento](
	[tipo_equipamento] [varchar](255) NOT NULL,
	[combustivel] [varchar](10) NOT NULL,
	[Nu_serie] [int] NOT NULL,
	[marca] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nu_serie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecedor]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedor](
	[FORNnif] [int] NOT NULL,
	[tipo_fornecedor] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FORNnif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecer_equipamentos]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecer_equipamentos](
	[Equipamento_Nu_serie] [int] NOT NULL,
	[nif_fornecedor] [int] NOT NULL,
	[preco] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Equipamento_Nu_serie] ASC,
	[nif_fornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EquipFornDetailsView]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[EquipFornDetailsView]
AS
SELECT Fornecer_equipamentos.preco, Equipamento.Nu_serie,Equipamento.marca , Fornecedor.FORNnif
FROM ((Fornecer_equipamentos
INNER JOIN Equipamento ON Fornecer_equipamentos.Equipamento_Nu_serie = Equipamento.Nu_serie)
INNER JOIN Fornecedor ON Fornecer_equipamentos.nif_fornecedor = Fornecedor.FORNnif)
GO
/****** Object:  Table [dbo].[Cooperativa]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cooperativa](
	[C_nif] [int] NOT NULL,
	[cotas_mensais] [int] NOT NULL,
	[fundos] [decimal](10, 2) NOT NULL,
	[nome] [varchar](55) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[C_nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Cooperativas]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Cooperativas]
as
Select * from Cooperativa;



GO
/****** Object:  UserDefinedFunction [dbo].[getSeedsDetails]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getSeedsDetails] (@nifFuncionario int) returns Table
as
	return(
		SELECT nome, Nu_loteSementes,data_plantio,nif_fornecedor
			FROM Funcionario  JOIN Sementes ON nif = FuncionarioNif
			Where nif = @nifFuncionario
	)		
GO
/****** Object:  UserDefinedFunction [dbo].[getSeedsDetails2]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getSeedsDetails2] (@nifF int) returns Table
as
	return(

			

	SELECT *
			FROM Sementes s JOIN Fornecedor f ON  s.Nif_fornecedor=f.FORNnif
			Where  s.Nif_fornecedor = @nifF
		)
GO
/****** Object:  Table [dbo].[ProdutoFinal]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdutoFinal](
	[peso] [decimal](10, 2) NOT NULL,
	[data_colheita] [varchar](15) NOT NULL,
	[tempo_durabilidade] [int] NOT NULL,
	[especie] [varchar](10) NOT NULL,
	[preco] [decimal](10, 2) NOT NULL,
	[Func_nif] [int] NOT NULL,
	[CooperativaNIF] [int] NOT NULL,
	[nu_loteProdFinal] [int] NOT NULL,
	[loteSemNu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nu_loteProdFinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getProdFinal]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getProdFinal] (@nuLote int) returns Table
as
	return(
		SELECT peso, tempo_durabilidade,especie,preco,Func_nif,CooperativaNIF,nu_loteProdFinal
			FROM Sementes  JOIN ProdutoFinal  ON Nu_loteSementes = loteSemNu
			Where Nu_loteSementes = @nuLote
	)		
GO
/****** Object:  UserDefinedFunction [dbo].[getCooperativa]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getCooperativa] (@coopNIF int) returns Table
as
	return(
		SELECT  DISTINCT C_nif,nome, cotas_mensais, fundos
			FROM ProdutoFinal  JOIN Cooperativa  ON CooperativaNIF = C_nif
			Where CooperativaNIF = @coopNIF
	)		
GO
/****** Object:  Table [dbo].[Manutencao]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manutencao](
	[joindate] [varchar](55) NOT NULL,
	[estado] [varchar](15) NOT NULL,
	[tipo_manutencao] [varchar](15) NOT NULL,
	[id_Item] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipamento_Manutencao]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipamento_Manutencao](
	[EquipNu_serie] [int] NOT NULL,
	[Man_idItem] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipNu_serie] ASC,
	[Man_idItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getManutencaoStatus]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getManutencaoStatus] (@nuSerie int) returns Table
as
	return(
		SELECT estado, joindate
			FROM Equipamento_Manutencao  JOIN Manutencao  ON Man_idItem = id_Item
			Where EquipNu_serie = @nuSerie
	)		
GO
/****** Object:  Table [dbo].[credenciais_hash]    Script Date: 6/8/2019 11:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[credenciais_hash](
	[usr] [varchar](100) NOT NULL,
	[pwd] [varbinary](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecer_sementes]    Script Date: 6/8/2019 11:36:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecer_sementes](
	[nif_fornecedor] [int] NOT NULL,
	[NuLote_sementes] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nif_fornecedor] ASC,
	[NuLote_sementes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilizacao_equipamento]    Script Date: 6/8/2019 11:36:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilizacao_equipamento](
	[Funcionario_nif] [int] NOT NULL,
	[Equipamento_SerialNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Equipamento_SerialNumber] ASC,
	[Funcionario_nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cooperativa] ([C_nif], [cotas_mensais], [fundos], [nome]) VALUES (4567, 500, CAST(50000.00 AS Decimal(10, 2)), N'Coop5')
INSERT [dbo].[Cooperativa] ([C_nif], [cotas_mensais], [fundos], [nome]) VALUES (7532, 2000, CAST(5000000.00 AS Decimal(10, 2)), N'Cooperativa1')
INSERT [dbo].[Cooperativa] ([C_nif], [cotas_mensais], [fundos], [nome]) VALUES (7533, 2000, CAST(5000000.00 AS Decimal(10, 2)), N'Cooperativa2')
INSERT [dbo].[Cooperativa] ([C_nif], [cotas_mensais], [fundos], [nome]) VALUES (7534, 4000, CAST(1000000.00 AS Decimal(10, 2)), N'Cooperativa3')
INSERT [dbo].[Cooperativa] ([C_nif], [cotas_mensais], [fundos], [nome]) VALUES (7535, 5000, CAST(9000000.00 AS Decimal(10, 2)), N'Cooperativa4')
INSERT [dbo].[Cooperativa] ([C_nif], [cotas_mensais], [fundos], [nome]) VALUES (7536, 1000, CAST(500000.00 AS Decimal(10, 2)), N'Cooperativa5')
INSERT [dbo].[credenciais_hash] ([usr], [pwd]) VALUES (N'manager', 0xC7AD44CBAD762A5DA0A452F9E854FDC1E0E7A52A38015F23F3EAB1D80B931DD472634DFAC71CD34EBC35D16AB7FB8A90C81F975113D6C7538DC69DD8DE9077EC)
INSERT [dbo].[credenciais_hash] ([usr], [pwd]) VALUES (N'manager2', 0x661BB43140229AD4DC3E762E7BDD68CC14BB9093C158C386BD989FEA807ACD9BD7F805CA4736B870B6571594D0D8FCFC57B98431143DFB770E083FA9BE89BC72)
INSERT [dbo].[Equipamento] ([tipo_equipamento], [combustivel], [Nu_serie], [marca]) VALUES (N'EquipamentoPesticidas', N'gasolina', 1111, N'PestComp')
INSERT [dbo].[Equipamento] ([tipo_equipamento], [combustivel], [Nu_serie], [marca]) VALUES (N'AquecimentoGerador', N'gasoleo', 1234, N'HeatingComp')
INSERT [dbo].[Equipamento] ([tipo_equipamento], [combustivel], [Nu_serie], [marca]) VALUES (N'rega', N'gasolina', 7412, N'GreenTech')
INSERT [dbo].[Equipamento] ([tipo_equipamento], [combustivel], [Nu_serie], [marca]) VALUES (N'Motor', N'gasolina', 7418, N'honda')
INSERT [dbo].[Equipamento] ([tipo_equipamento], [combustivel], [Nu_serie], [marca]) VALUES (N'rega', N'gasolina', 7444, N'RegaComp')
INSERT [dbo].[Equipamento] ([tipo_equipamento], [combustivel], [Nu_serie], [marca]) VALUES (N'rega', N'gasolina', 7445, N'RegaComp')
INSERT [dbo].[Equipamento] ([tipo_equipamento], [combustivel], [Nu_serie], [marca]) VALUES (N'Trator', N'gasoleo', 8888, N'Yamaha')
INSERT [dbo].[Equipamento] ([tipo_equipamento], [combustivel], [Nu_serie], [marca]) VALUES (N'motor', N'gasolina', 9999, N'Husqvarna')
INSERT [dbo].[Equipamento_Manutencao] ([EquipNu_serie], [Man_idItem]) VALUES (1111, 1)
INSERT [dbo].[Equipamento_Manutencao] ([EquipNu_serie], [Man_idItem]) VALUES (1111, 4)
INSERT [dbo].[Equipamento_Manutencao] ([EquipNu_serie], [Man_idItem]) VALUES (1234, 3)
INSERT [dbo].[Equipamento_Manutencao] ([EquipNu_serie], [Man_idItem]) VALUES (7412, 2)
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (1234, N'Sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (4444, N'sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (4445, N'sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (4446, N'sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (4447, N'sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (4567, N'Sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (7418, N'Adubos')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (7532, N'Sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (7533, N'Sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (7534, N'Sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (7535, N'Sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (7536, N'Sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (7899, N'Equipamentos')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (8532, N'Sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (8999, N'Equipamentos')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (9654, N'Sementes')
INSERT [dbo].[Fornecedor] ([FORNnif], [tipo_fornecedor]) VALUES (9999, N'Equipamentos')
INSERT [dbo].[Fornecer_equipamentos] ([Equipamento_Nu_serie], [nif_fornecedor], [preco]) VALUES (1111, 8999, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Fornecer_equipamentos] ([Equipamento_Nu_serie], [nif_fornecedor], [preco]) VALUES (1234, 7899, CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[Fornecer_equipamentos] ([Equipamento_Nu_serie], [nif_fornecedor], [preco]) VALUES (7412, 8999, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Fornecer_equipamentos] ([Equipamento_Nu_serie], [nif_fornecedor], [preco]) VALUES (7444, 9999, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Fornecer_equipamentos] ([Equipamento_Nu_serie], [nif_fornecedor], [preco]) VALUES (7445, 8999, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Fornecer_equipamentos] ([Equipamento_Nu_serie], [nif_fornecedor], [preco]) VALUES (8888, 9999, CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[Fornecer_equipamentos] ([Equipamento_Nu_serie], [nif_fornecedor], [preco]) VALUES (9999, 7899, CAST(10500.00 AS Decimal(10, 2)))
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Andre', 975, N'Engenheiro Agronomo', N'Anual', CAST(2500.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Rodrigo', 1234, N'Auxiliar', N'Semestral', CAST(650.00 AS Decimal(10, 2)), 35)
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Rui ', 4166, N'agricultor', N'anual', CAST(700.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Mariana', 4321, N'Auxiliar', N'Semestral', CAST(650.00 AS Decimal(10, 2)), 35)
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Xavier ', 4562, N'limpezas', N'temporario', CAST(550.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Francisco', 5638, N'Agricultor', N'Anual', CAST(750.00 AS Decimal(10, 2)), 35)
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Diogo ', 5697, N'Agricultor', N'Anual', CAST(700.00 AS Decimal(10, 2)), 35)
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Antonio ', 7840, N'Agricultor', N'Anual', CAST(650.00 AS Decimal(10, 2)), 35)
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Jose ', 7856, N'Agricultor', N'Bianual', CAST(600.00 AS Decimal(10, 2)), 35)
INSERT [dbo].[Funcionario] ([nome], [nif], [tipo_contrato], [tipo_de_trabalho], [salario], [horas_semanais]) VALUES (N'Manuel', 45611, N'Auxiliar', N'Semestral', CAST(900.00 AS Decimal(10, 2)), 35)
INSERT [dbo].[Manutencao] ([joindate], [estado], [tipo_manutencao], [id_Item]) VALUES (N'20/5/2019', N'critico', N'Corretiva', 1)
INSERT [dbo].[Manutencao] ([joindate], [estado], [tipo_manutencao], [id_Item]) VALUES (N'28/2/2019', N'ligeiro', N'preventiva', 2)
INSERT [dbo].[Manutencao] ([joindate], [estado], [tipo_manutencao], [id_Item]) VALUES (N'28/3/2019', N'Severo', N'Corretiva', 3)
INSERT [dbo].[Manutencao] ([joindate], [estado], [tipo_manutencao], [id_Item]) VALUES (N'12/3/2019', N'Mooderado', N'Corretivo', 4)
INSERT [dbo].[ProdutoFinal] ([peso], [data_colheita], [tempo_durabilidade], [especie], [preco], [Func_nif], [CooperativaNIF], [nu_loteProdFinal], [loteSemNu]) VALUES (CAST(5.00 AS Decimal(10, 2)), N'21/3/2019', 200, N'especieX', CAST(50.00 AS Decimal(10, 2)), 7840, 7532, 1, 2)
INSERT [dbo].[ProdutoFinal] ([peso], [data_colheita], [tempo_durabilidade], [especie], [preco], [Func_nif], [CooperativaNIF], [nu_loteProdFinal], [loteSemNu]) VALUES (CAST(3.00 AS Decimal(10, 2)), N'11/3/2019', 100, N'especieX', CAST(50.00 AS Decimal(10, 2)), 7856, 7533, 2, 4)
INSERT [dbo].[ProdutoFinal] ([peso], [data_colheita], [tempo_durabilidade], [especie], [preco], [Func_nif], [CooperativaNIF], [nu_loteProdFinal], [loteSemNu]) VALUES (CAST(9.00 AS Decimal(10, 2)), N'11/6/2019', 150, N'especieY', CAST(80.00 AS Decimal(10, 2)), 7856, 7534, 3, 6)
INSERT [dbo].[ProdutoFinal] ([peso], [data_colheita], [tempo_durabilidade], [especie], [preco], [Func_nif], [CooperativaNIF], [nu_loteProdFinal], [loteSemNu]) VALUES (CAST(15.00 AS Decimal(10, 2)), N'1/6/2019', 170, N'especieY', CAST(70.00 AS Decimal(10, 2)), 5697, 7535, 4, 8)
INSERT [dbo].[ProdutoFinal] ([peso], [data_colheita], [tempo_durabilidade], [especie], [preco], [Func_nif], [CooperativaNIF], [nu_loteProdFinal], [loteSemNu]) VALUES (CAST(20.00 AS Decimal(10, 2)), N'1/6/2019', 150, N'especieY', CAST(100.00 AS Decimal(10, 2)), 4166, 7535, 5, 10)
INSERT [dbo].[ProdutoFinal] ([peso], [data_colheita], [tempo_durabilidade], [especie], [preco], [Func_nif], [CooperativaNIF], [nu_loteProdFinal], [loteSemNu]) VALUES (CAST(20.00 AS Decimal(10, 2)), N'1/6/2019', 150, N'especieZ', CAST(90.00 AS Decimal(10, 2)), 4166, 7535, 6, 9)
INSERT [dbo].[ProdutoFinal] ([peso], [data_colheita], [tempo_durabilidade], [especie], [preco], [Func_nif], [CooperativaNIF], [nu_loteProdFinal], [loteSemNu]) VALUES (CAST(20.00 AS Decimal(10, 2)), N'1/6/2019', 150, N'especieZ', CAST(90.00 AS Decimal(10, 2)), 7840, 7536, 7, 1)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (200, 10, N'13/5/2019', 1, 7856, 1234, 250)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (300, 3, N'30/3/2019', 2, 7840, 4567, 100)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (260, 10, N'14/6/2019', 3, 4166, 8532, 100)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (340, 12, N'10/2/2019', 4, 5697, 9654, 150)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (340, 5, N'3/6/2019', 5, 5638, 4444, 120)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (300, 4, N'5/7/2018', 6, 1234, 4445, 150)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (290, 5, N'3/3/2019', 7, 7856, 4446, 300)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (290, 2, N'1/1/2019', 8, 7856, 4447, 210)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (290, 5, N'2/2/2019', 9, 7840, 1234, 200)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (200, 2, N'2/2/2019', 10, 7856, 1234, 150)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (100, 2, N'2/2/2019', 11, 4321, 1234, 150)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (200, 20, N'11/4/2019', 12, 975, 1234, 40)
INSERT [dbo].[Sementes] ([tempo_preservacao], [tempo_germinacao], [data_plantio], [Nu_loteSementes], [FuncionarioNif], [Nif_fornecedor], [Nu_sementes]) VALUES (200, 10, N'14/5/2019', 13, 975, 1234, 100)
INSERT [dbo].[Utilizacao_equipamento] ([Funcionario_nif], [Equipamento_SerialNumber]) VALUES (45611, 7444)
INSERT [dbo].[Utilizacao_equipamento] ([Funcionario_nif], [Equipamento_SerialNumber]) VALUES (4166, 7445)
INSERT [dbo].[Utilizacao_equipamento] ([Funcionario_nif], [Equipamento_SerialNumber]) VALUES (1234, 8888)
INSERT [dbo].[Utilizacao_equipamento] ([Funcionario_nif], [Equipamento_SerialNumber]) VALUES (4321, 9999)
ALTER TABLE [dbo].[Cooperativa]  WITH CHECK ADD FOREIGN KEY([C_nif])
REFERENCES [dbo].[Fornecedor] ([FORNnif])
GO
ALTER TABLE [dbo].[Equipamento_Manutencao]  WITH CHECK ADD FOREIGN KEY([EquipNu_serie])
REFERENCES [dbo].[Equipamento] ([Nu_serie])
GO
ALTER TABLE [dbo].[Equipamento_Manutencao]  WITH CHECK ADD FOREIGN KEY([Man_idItem])
REFERENCES [dbo].[Manutencao] ([id_Item])
GO
ALTER TABLE [dbo].[Fornecer_equipamentos]  WITH CHECK ADD FOREIGN KEY([Equipamento_Nu_serie])
REFERENCES [dbo].[Equipamento] ([Nu_serie])
GO
ALTER TABLE [dbo].[Fornecer_equipamentos]  WITH CHECK ADD FOREIGN KEY([nif_fornecedor])
REFERENCES [dbo].[Fornecedor] ([FORNnif])
GO
ALTER TABLE [dbo].[Fornecer_sementes]  WITH CHECK ADD FOREIGN KEY([nif_fornecedor])
REFERENCES [dbo].[Fornecedor] ([FORNnif])
GO
ALTER TABLE [dbo].[Fornecer_sementes]  WITH CHECK ADD FOREIGN KEY([NuLote_sementes])
REFERENCES [dbo].[Sementes] ([Nu_loteSementes])
GO
ALTER TABLE [dbo].[ProdutoFinal]  WITH CHECK ADD FOREIGN KEY([CooperativaNIF])
REFERENCES [dbo].[Cooperativa] ([C_nif])
GO
ALTER TABLE [dbo].[ProdutoFinal]  WITH CHECK ADD FOREIGN KEY([Func_nif])
REFERENCES [dbo].[Funcionario] ([nif])
GO
ALTER TABLE [dbo].[ProdutoFinal]  WITH CHECK ADD FOREIGN KEY([nu_loteProdFinal])
REFERENCES [dbo].[Sementes] ([Nu_loteSementes])
GO
ALTER TABLE [dbo].[Sementes]  WITH CHECK ADD FOREIGN KEY([FuncionarioNif])
REFERENCES [dbo].[Funcionario] ([nif])
GO
ALTER TABLE [dbo].[Sementes]  WITH CHECK ADD FOREIGN KEY([Nif_fornecedor])
REFERENCES [dbo].[Fornecedor] ([FORNnif])
GO
ALTER TABLE [dbo].[Utilizacao_equipamento]  WITH CHECK ADD FOREIGN KEY([Equipamento_SerialNumber])
REFERENCES [dbo].[Equipamento] ([Nu_serie])
GO
ALTER TABLE [dbo].[Utilizacao_equipamento]  WITH CHECK ADD FOREIGN KEY([Funcionario_nif])
REFERENCES [dbo].[Funcionario] ([nif])
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD CHECK  (([salario]>(500)))
GO
/****** Object:  StoredProcedure [dbo].[addToManutencao]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addToManutencao] @ID int, @nu_serie int, @date VARCHAR(55), @state VARCHAR(15), @type VARCHAR(15)
AS
INSERT INTO Manutencao (joindate,estado,tipo_manutencao,id_item) VALUES ( @date, @state,@type,@ID)
INSERT INTO Equipamento_Manutencao(EquipNu_serie,Man_idItem) VALUES (@nu_serie,@ID)
GO
/****** Object:  StoredProcedure [dbo].[AVGseedsNumber]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AVGseedsNumber]
AS
Select avg(Nu_sementes) as avgNusementes From Sementes
GO
/****** Object:  StoredProcedure [dbo].[CooperativasView]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create Procedure [dbo].[CooperativasView]
AS
Select * from Cooperativas
GO
/****** Object:  StoredProcedure [dbo].[EquipamentosManutencao]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[EquipamentosManutencao]
AS
Select * from Equipamento_Manutencao
GO
/****** Object:  StoredProcedure [dbo].[EquipFornDetails]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[EquipFornDetails]
AS
SELECT * FROM EquipFornDetailsView
GO
/****** Object:  StoredProcedure [dbo].[EquipFornDetailsSearch]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EquipFornDetailsSearch] @NUserie int
AS
SELECT * FROM EquipFornDetailsView
WHERE Nu_serie = @NUserie
GO
/****** Object:  StoredProcedure [dbo].[EquipUtilizacaoDetails]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EquipUtilizacaoDetails]
AS
Select * from Utilizacao_equipamento
GO
/****** Object:  StoredProcedure [dbo].[FuncsName]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------


CREATE PROCEDURE [dbo].[FuncsName]
AS
Select nome from Funcionario order by nome asc
GO
/****** Object:  StoredProcedure [dbo].[getColheitasPorFunc]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[getColheitasPorFunc] @NIFfuncionario int
AS
SELECT Funcionario.nome,ProdutoFinal.data_colheita,ProdutoFinal.loteSemNu,ProdutoFinal.preco,ProdutoFinal.especie,ProdutoFinal.peso
FROM ProdutoFinal
INNER JOIN Funcionario
ON ProdutoFinal.Func_nif = Funcionario.nif
WHERE Funcionario.nif = @NIFfuncionario
GO
/****** Object:  StoredProcedure [dbo].[getCoopByNIF]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[getCoopByNIF] @item int
AS
Select * from Cooperativa where C_nif like @item
GO
/****** Object:  StoredProcedure [dbo].[getFornBynif]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[getFornBynif] @item int
AS
Select * from Fornecedor where FORNnif like @item
GO
/****** Object:  StoredProcedure [dbo].[getFuncColheitaNif]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[getFuncColheitaNif]
AS
Select Func_nif from ProdutoFinal
GO
/****** Object:  StoredProcedure [dbo].[getListFornecedores]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[getListFornecedores]
AS
SELECT * FROM Fornecedor
GO
/****** Object:  StoredProcedure [dbo].[getLotePF]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLotePF]
AS
Select nu_LoteProdFinal FROM ProdutoFinal
GO
/****** Object:  StoredProcedure [dbo].[getNIFfornecedor]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getNIFfornecedor]
AS
SELECT FORNnif from Fornecedor
GO
/****** Object:  StoredProcedure [dbo].[getNIFfuncionario]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC getLotePF

CREATE PROCEDURE [dbo].[getNIFfuncionario]
AS
SELECT nif FROM Funcionario
GO
/****** Object:  StoredProcedure [dbo].[getSerialNUmber]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[getSerialNUmber]
AS
Select Nu_serie FROM Equipamento
GO
/****** Object:  StoredProcedure [dbo].[getTableEquipManutencao]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[getTableEquipManutencao]
AS
Select * From Equipamento_Manutencao
GO
/****** Object:  StoredProcedure [dbo].[getTheHighestDurability]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[getTheHighestDurability]
AS
Select  nu_loteProdFinal from ProdutoFinal
where tempo_durabilidade = (select Max(tempo_durabilidade) from ProdutoFinal)
GO
/****** Object:  StoredProcedure [dbo].[getTheHighestPrice]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getTheHighestPrice]
AS
Select nu_loteProdFinal from ProdutoFinal
where preco = (select Max(preco) from ProdutoFinal)
GO
/****** Object:  StoredProcedure [dbo].[getTotalSeedsByFunc]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[getTotalSeedsByFunc]
AS
SELECT nome,SUM(Nu_sementes) FROM Funcionario F  JOIN Sementes S
		ON F.nif=S.FuncionarioNif
		GROUP BY nome
GO
/****** Object:  StoredProcedure [dbo].[InsertPlantacao]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC SeedsDetails @nif = 1234;


--drop function getSeedsDetails2




CREATE PROCEDURE [dbo].[InsertPlantacao] @preservacao int, @germinacao int, @nuLoteSementes int, @nifFunc int, @nifForn int, @dataPlantio varchar(15), @SeedNumb int
AS
INSERT INTO Sementes (tempo_preservacao, tempo_germinacao, Nu_loteSementes,FuncionarioNif,Nif_fornecedor,data_plantio,Nu_sementes) VALUES (@preservacao,@germinacao,@nuLoteSementes,@nifFunc,@nifForn,@dataPlantio,@SeedNumb)
GO
/****** Object:  StoredProcedure [dbo].[listEquipUtil]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[listEquipUtil]
AS
Select * from Utilizacao_equipamento
GO
/****** Object:  StoredProcedure [dbo].[listEquipUtilSearch]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[listEquipUtilSearch] @NUserie int
AS
Select * from Utilizacao_equipamento
WHERE Equipamento_SerialNumber = @NUserie
GO
/****** Object:  StoredProcedure [dbo].[listFuncionarios]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[listFuncionarios]
AS
SELECT * FROM Funcionario
GO
/****** Object:  StoredProcedure [dbo].[listProdFinal]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[listProdFinal]
AS
Select * From ProdutoFinal
GO
/****** Object:  StoredProcedure [dbo].[LotesDeSementes]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LotesDeSementes]
AS
Select * FROM [plantacoes]
GO
/****** Object:  StoredProcedure [dbo].[LotesDeSementesAboveAVGnuSementes]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LotesDeSementesAboveAVGnuSementes]
AS
Select * FROM [plantacoes Above Average NuSementes]
GO
/****** Object:  StoredProcedure [dbo].[ManutencaoStatus]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ManutencaoStatus] @SerialNu int
AS
Select * From dbo.getManutencaoStatus(@SerialNu)
GO
/****** Object:  StoredProcedure [dbo].[MAXQtdSeedsByLote]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MAXQtdSeedsByLote]
AS
SELECT *
	From QtdSeedsByLote  
	where Nu_sementes In (select MAX(Nu_sementes) from Sementes)
GO
/****** Object:  StoredProcedure [dbo].[NewCooperativa]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[NewCooperativa] @cooperativaNIF INT, @CotasMensais DECIMAL(10,2), @funds DECIMAL(10,2), @nome VARCHAR(55)
AS
INSERT INTO Cooperativa(C_nif,cotas_mensais,fundos,nome) VALUES (@cooperativaNIF,@CotasMensais,@funds,@nome)
GO
/****** Object:  StoredProcedure [dbo].[NewEquip]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[NewEquip] @EquipType VARCHAR(255), @COMBUSTIVEL VARCHAR(10), @NumeroSerie INT, @brand VARCHAR(15)
AS
INSERT INTO Equipamento (tipo_equipamento,combustivel,Nu_serie,marca) VALUES (@EquipType, @COMBUSTIVEL,@NumeroSerie,@brand )
GO
/****** Object:  StoredProcedure [dbo].[NewFornecedor]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[NewFornecedor] @nif int, @tipo varchar(255)
AS
INSERT INTO Fornecedor (FORNnif,tipo_fornecedor)VALUES (@nif,@tipo)
GO
/****** Object:  StoredProcedure [dbo].[NewFunc]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[NewFunc] @nome Varchar(15),@nif int, @tipoTrabalho Varchar(255), @tipoContrato Varchar(10), @salario DECIMAL(10,2), @horas int
AS
INSERT INTO Funcionario (nome,nif,tipo_contrato,tipo_de_trabalho,salario,horas_semanais) VALUES (@nome,@nif,@tipoTrabalho,@tipoContrato,@salario,@horas)
GO
/****** Object:  StoredProcedure [dbo].[RangePF]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[RangePF] @nuLoteInicial int, @nuLoteFinal int
AS
Select * from ProdutoFinal
where nu_loteProdFinal between @nuLoteInicial and @nuLoteFinal
GO
/****** Object:  StoredProcedure [dbo].[SearchFuncByNIF]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SearchFuncByNIF] @item VARCHAR(15)
AS
Select * from Funcionario where nif like @item
GO
/****** Object:  StoredProcedure [dbo].[SecureLogin]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SecureLogin] @userNAME Varchar(55), @PASS Varchar(55)
AS
Select * from credenciais_hash where usr =  @userNAME and pwd = hashbytes('sha2_512', @PASS)
GO
/****** Object:  StoredProcedure [dbo].[SeedsDetails]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeedsDetails] @nif int
AS
Select * From dbo.getSeedsDetails(@nif)
GO
/****** Object:  StoredProcedure [dbo].[SeedsDetails2]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SeedsDetails2] @NIF int
AS
Select * From dbo.getSeedsDetails2(@NIF)
GO
/****** Object:  StoredProcedure [dbo].[total_lotesSementes]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[total_lotesSementes]
AS
Select count(Nu_loteSementes)as total_LoteSeeds From Sementes
GO
/****** Object:  StoredProcedure [dbo].[totalSeeds]    Script Date: 6/8/2019 11:36:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[totalSeeds]
AS
Select sum (Nu_sementes) as total_sementes From Sementes
GO
USE [master]
GO
ALTER DATABASE [p7g8] SET  READ_WRITE 
GO
