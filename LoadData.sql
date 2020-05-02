

INSERT INTO Funcionario (nome,nif,tipo_contrato,tipo_de_trabalho,salario,horas_semanais)
VALUES ('Manuel',45611,'Auxiliar','Semestral',950,35),
('Antonio ',7840,'Agricultor','Anual',600,35),
('Jose ', 7856,'Agricultor','Bianual',600,35),
('Andre',0975,'Engenheiro Agronomo','Anual',2000,40),
('Xavier ',4562,'limpezas','temporario',550,20),
('Rui ',4166,'agricultor','anual',700,40),
('Diogo ',5697,'Agricultor','Anual',700,35),
('Francisco',5638,'Agricultor','Anual',700,35),
('Rodrigo',1234,'Auxiliar','Semestral',650,35),
('Mariana',4321,'Auxiliar','Semestral',650,35)

--Delete from Funcionario 


--Select * from Funcionario


--Select * from Cooperativa

insert into credenciais_hash values ('manager', hashbytes('sha2_512', 'admin'))
insert into credenciais_hash values ('manager2', hashbytes('sha2_512', 'admin2'))

--Delete from credenciais_hash

INSERT INTO Fornecedor (FORNnif,tipo_fornecedor)
VALUES (1234,'Sementes'),
(4567,'Sementes'),
(8532,'Sementes'),
(9654,'Sementes'),
(4444,'sementes'),
(4445,'sementes'),
(4446,'sementes'),
(4447,'sementes'),
(7532,'Sementes'),
(7533,'Sementes'),
(7534,'Sementes'),
(7535,'Sementes'),
(7536,'Sementes'),
(7418,'Adubos'),
(7899,'Equipamentos'),
(9999,'Equipamentos'),
(8999,'Equipamentos')

--Delete from Fornecedor
--Select * from Fornecedor
-------


INSERT INTO Cooperativa(C_nif,cotas_mensais,fundos,nome)
VALUES (7532,2000,5000000,'Cooperativa1'),
(7533,2000,5000000,'Cooperativa2'),
(7534,4000,1000000,'Cooperativa3'),
(7535,5000,9000000,'Cooperativa4'),
(7536,1000,500000,'Cooperativa5')

--Delete from Cooperativa
--Select * from Cooperativa

------

INSERT INTO Equipamento (tipo_equipamento,combustivel,Nu_serie,marca)
VALUES ('rega','gasolina',7412,'GreenTech'),
('AquecimentoGerador','gasoleo',1234,'HeatingComp'),
('rega','gasolina',7444,'RegaComp'),
('rega','gasolina',7445,'RegaComp'),
('Trator','gasoleo',8888,'Yamaha'),
('motor','gasolina',9999,'Husqvarna'),
('EquipamentoPesticidas','gasoleo',1111,'PestComp')

--Delete from Equipamento


INSERT INTO Utilizacao_equipamento (Funcionario_nif,Equipamento_SerialNumber)
VALUES (1234,8888),
(4321,9999),
(45611,7444),
(4166,7445)

--Delete from Utilizacao_equipamento
--Select * from Utilizacao_equipamento


INSERT INTO Manutencao(joindate,estado,tipo_manutencao,id_Item)
VALUES ('20/5/2019','critico','Corretiva',1),
('28/2/2019','ligeiro','preventiva',2),
('28/3/2019','Severo','Corretiva',3)


--Delete from Manutencao
--SELECT * FROM Manutencao



INSERT INTO Equipamento_Manutencao (EquipNu_serie,Man_idItem)
VALUES (1111,1),
(7412,2),
(1234,3)

--Delete from Equipamento_Manutencao
--Select * from Equipamento_Manutencao



INSERT INTO Fornecer_equipamentos (Equipamento_Nu_serie,nif_fornecedor,preco)
VALUES(7412,8999,2000),
(1234,7899,3000),
(7444,9999,2500),
(7445,8999,5000),
(8888,9999,3000),
(9999,7899,10500),
(1111,8999,4000)

--Delete from Fornecer_equipamentos


INSERT INTO Sementes (tempo_preservacao,tempo_germinacao,data_plantio,Nu_loteSementes,FuncionarioNif,Nif_fornecedor,Nu_sementes)
VALUES (200,10,'13/5/2019',1,7856,1234,250),
(300,3,'30/3/2019',2,7840,4567,100),
(260,10,'14/6/2019',3,4166,8532,100),
(340,12,'10/2/2019',4,5697,9654,150),
(340,5,'3/6/2019',5,5638,4444,120),
(300,4,'5/7/2018',6,1234,4445,150),
(290,5,'3/3/2019',7,7856,4446,300),
(290,2,'1/1/2019',8,7856,4447,210),
(290,5,'2/2/2019',9,7840,1234,200),
(200,2,'2/2/2019',10,7856,1234,150),
(100,2,'2/2/2019',11,4321,1234,150)

--Select * from Sementes
--Delete from Sementes

INSERT INTO ProdutoFinal (peso,data_colheita,tempo_durabilidade,especie,preco,Func_nif,CooperativaNIF,nu_loteProdFinal,loteSemNu)
VALUES (5,'21/3/2019',200,'especieX',50,7840,7532,1,2),
(3,'11/3/2019',100,'especieX',50,7856,7533,2,4),
(9,'11/6/2019',150,'especieY',80,7856,7534,3,6),
(15,'1/6/2019',170,'especieY',70,5697,7535,4,8),
(20,'1/6/2019',150,'especieY',100,4166,7535,5,10),
(20,'1/6/2019',150,'especieZ',90,4166,7535,6,9),
(20,'1/6/2019',150,'especieZ',90,7840,7536,7,1)



--Select * from ProdutoFinal
--Delete from ProdutoFinal

