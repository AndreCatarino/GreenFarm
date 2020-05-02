
CREATE PROCEDURE getLotePF
AS
Select nu_LoteProdFinal FROM ProdutoFinal
GO

--EXEC getLotePF

CREATE PROCEDURE getNIFfuncionario
AS
SELECT nif FROM Funcionario
GO

CREATE PROCEDURE getNIFfornecedor
AS
SELECT FORNnif from Fornecedor
GO


--drop PROCEDURE dbo.getNIFfornecedor


--EXEC getNIFfornecedor

CREATE PROCEDURE SeedsDetails @nif int
AS
Select * From dbo.getSeedsDetails(@nif)
GO


CREATE PROCEDURE SeedsDetails2 @NIF int
AS
Select * From dbo.getSeedsDetails2(@NIF)
GO


--EXEC SeedsDetails @nif = 1234;


--drop function getSeedsDetails2




CREATE PROCEDURE InsertPlantacao @preservacao int, @germinacao int, @nuLoteSementes int, @nifFunc int, @nifForn int, @dataPlantio varchar(15), @SeedNumb int
AS
INSERT INTO Sementes (tempo_preservacao, tempo_germinacao, Nu_loteSementes,FuncionarioNif,Nif_fornecedor,data_plantio,Nu_sementes) VALUES (@preservacao,@germinacao,@nuLoteSementes,@nifFunc,@nifForn,@dataPlantio,@SeedNumb)
GO





CREATE PROCEDURE EquipFornDetails
AS
SELECT * FROM EquipFornDetailsView
GO


CREATE PROCEDURE EquipUtilizacaoDetails
AS
Select * from Utilizacao_equipamento
GO



CREATE PROCEDURE getColheitasPorFunc @NIFfuncionario int
AS
SELECT Funcionario.nome,ProdutoFinal.data_colheita,ProdutoFinal.loteSemNu,ProdutoFinal.preco,ProdutoFinal.especie,ProdutoFinal.peso
FROM ProdutoFinal
INNER JOIN Funcionario
ON ProdutoFinal.Func_nif = Funcionario.nif
WHERE Funcionario.nif = @NIFfuncionario
GO


CREATE PROCEDURE getSerialNUmber
AS
Select Nu_serie FROM Equipamento
GO


CREATE PROCEDURE EquipFornDetailsSearch @NUserie int
AS
SELECT * FROM EquipFornDetailsView
WHERE Nu_serie = @NUserie
GO



CREATE PROCEDURE EquipamentosManutencao
AS
Select * from Equipamento_Manutencao
GO


CREATE PROCEDURE addToManutencao @ID int, @nu_serie int, @date VARCHAR(55), @state VARCHAR(15), @type VARCHAR(15)
AS
INSERT INTO Manutencao (joindate,estado,tipo_manutencao,id_item) VALUES ( @date, @state,@type,@ID)
INSERT INTO Equipamento_Manutencao(EquipNu_serie,Man_idItem) VALUES (@nu_serie,@ID)
GO


CREATE PROCEDURE listEquipUtil
AS
Select * from Utilizacao_equipamento
GO


CREATE PROCEDURE listEquipUtilSearch @NUserie int
AS
Select * from Utilizacao_equipamento
WHERE Equipamento_SerialNumber = @NUserie
GO

CREATE PROCEDURE LotesDeSementes
AS
Select * FROM [plantacoes]
GO

CREATE PROCEDURE LotesDeSementesAboveAVGnuSementes
AS
Select * FROM [plantacoes Above Average NuSementes]
GO


CREATE PROCEDURE getTotalSeedsByFunc
AS
SELECT nome,SUM(Nu_sementes) FROM Funcionario F  JOIN Sementes S
		ON F.nif=S.FuncionarioNif
		GROUP BY nome
GO


CREATE PROCEDURE total_lotesSementes
AS
Select count(Nu_loteSementes)as total_LoteSeeds From Sementes
GO

CREATE PROCEDURE totalSeeds
AS
Select sum (Nu_sementes) as total_sementes From Sementes
GO


CREATE PROCEDURE AVGseedsNumber
AS
Select avg(Nu_sementes) as avgNusementes From Sementes
GO


CREATE PROCEDURE MAXQtdSeedsByLote
AS
SELECT *
	From QtdSeedsByLote  
	where Nu_sementes In (select MAX(Nu_sementes) from Sementes)
GO


Create Procedure RangePF @nuLoteInicial int, @nuLoteFinal int
AS
Select * from ProdutoFinal
where nu_loteProdFinal between @nuLoteInicial and @nuLoteFinal
GO


CREATE PROCEDURE listProdFinal
AS
Select * From ProdutoFinal
GO



CREATE PROCEDURE getTheHighestDurability
AS
Select  nu_loteProdFinal from ProdutoFinal
where tempo_durabilidade = (select Max(tempo_durabilidade) from ProdutoFinal)
GO

CREATE PROCEDURE getTheHighestPrice
AS
Select nu_loteProdFinal from ProdutoFinal
where preco = (select Max(preco) from ProdutoFinal)
GO



CREATE PROCEDURE SecureLogin @userNAME Varchar(55), @PASS Varchar(55)
AS
Select * from credenciais_hash where usr =  @userNAME and pwd = hashbytes('sha2_512', @PASS)
GO


--------


CREATE PROCEDURE FuncsName
AS
Select nome from Funcionario order by nome asc
GO



CREATE PROCEDURE SearchFuncByNIF @item VARCHAR(15)
AS
Select * from Funcionario where nif like @item
GO



CREATE PROCEDURE listFuncionarios
AS
SELECT * FROM Funcionario
GO




CREATE PROCEDURE NewFunc @nome Varchar(15),@nif int, @tipoTrabalho Varchar(255), @tipoContrato Varchar(10), @salario DECIMAL(10,2), @horas int
AS
INSERT INTO Funcionario (nome,nif,tipo_contrato,tipo_de_trabalho,salario,horas_semanais) VALUES (@nome,@nif,@tipoTrabalho,@tipoContrato,@salario,@horas)
GO




CREATE PROCEDURE NewEquip @EquipType VARCHAR(255), @COMBUSTIVEL VARCHAR(10), @NumeroSerie INT, @brand VARCHAR(15)
AS
INSERT INTO Equipamento (tipo_equipamento,combustivel,Nu_serie,marca) VALUES (@EquipType, @COMBUSTIVEL,@NumeroSerie,@brand )
GO




CREATE PROCEDURE NewCooperativa @cooperativaNIF INT, @CotasMensais DECIMAL(10,2), @funds DECIMAL(10,2), @nome VARCHAR(55)
AS
INSERT INTO Cooperativa(C_nif,cotas_mensais,fundos,nome) VALUES (@cooperativaNIF,@CotasMensais,@funds,@nome)
GO




CREATE PROCEDURE NewFornecedor @nif int, @tipo varchar(255)
AS
INSERT INTO Fornecedor (FORNnif,tipo_fornecedor)VALUES (@nif,@tipo)
GO



Create Procedure CooperativasView
AS
Select * from Cooperativas
GO




CREATE PROCEDURE getCoopByNIF @item int
AS
Select * from Cooperativa where C_nif like @item
GO



CREATE PROCEDURE getListFornecedores
AS
SELECT * FROM Fornecedor
GO



CREATE PROCEDURE getFornBynif @item int
AS
Select * from Fornecedor where FORNnif like @item
GO


Create Procedure getFuncColheitaNif
AS
Select Func_nif from ProdutoFinal
GO


CREATE PROCEDURE ManutencaoStatus @SerialNu int
AS
Select * From dbo.getManutencaoStatus(@SerialNu)
GO



CREATE PROCEDURE getTableEquipManutencao
AS
Select * From Equipamento_Manutencao
GO

