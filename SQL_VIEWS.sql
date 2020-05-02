CREATE VIEW [plantacoes] AS
Select *
FROM Sementes
GO

CREATE VIEW [plantacoes Above Average NuSementes] AS
Select *
FROM Sementes
WHERE Nu_sementes > (Select AVG(Nu_sementes) FROM Sementes)
GO



CREATE VIEW QtdSeedsByLote AS
Select nome, Nu_sementes, Nu_loteSementes From Sementes s JOIN Funcionario f on F.nif=S.FuncionarioNif
GO


CREATE VIEW EquipFornDetailsView
AS
SELECT Fornecer_equipamentos.preco, Equipamento.Nu_serie,Equipamento.marca , Fornecedor.FORNnif
FROM ((Fornecer_equipamentos
INNER JOIN Equipamento ON Fornecer_equipamentos.Equipamento_Nu_serie = Equipamento.Nu_serie)
INNER JOIN Fornecedor ON Fornecer_equipamentos.nif_fornecedor = Fornecedor.FORNnif)
GO

CREATE VIEW Cooperativas
as
Select * from Cooperativa;



