
go
create function dbo.getSeedsDetails (@nifFuncionario int) returns Table
as
	return(
		SELECT nome, Nu_loteSementes,data_plantio,nif_fornecedor
			FROM Funcionario  JOIN Sementes ON nif = FuncionarioNif
			Where nif = @nifFuncionario
	)		
go



go
create function dbo.getSeedsDetails2 (@nifF int) returns Table
as
	return(

			

	SELECT *
			FROM Sementes s JOIN Fornecedor f ON  s.Nif_fornecedor=f.FORNnif
			Where  s.Nif_fornecedor = @nifF
		)
go





go
create function dbo.getProdFinal (@nuLote int) returns Table
as
	return(
		SELECT peso, tempo_durabilidade,especie,preco,Func_nif,CooperativaNIF,nu_loteProdFinal
			FROM Sementes  JOIN ProdutoFinal  ON Nu_loteSementes = loteSemNu
			Where Nu_loteSementes = @nuLote
	)		
go



go
create function dbo.getCooperativa (@coopNIF int) returns Table
as
	return(
		SELECT  DISTINCT C_nif,nome, cotas_mensais, fundos
			FROM ProdutoFinal  JOIN Cooperativa  ON CooperativaNIF = C_nif
			Where CooperativaNIF = @coopNIF
	)		
go




go
create function dbo.getManutencaoStatus (@nuSerie int) returns Table
as
	return(
		SELECT estado, joindate
			FROM Equipamento_Manutencao  JOIN Manutencao  ON Man_idItem = id_Item
			Where EquipNu_serie = @nuSerie
	)		
go





