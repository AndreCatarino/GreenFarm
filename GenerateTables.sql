
CREATE TABLE Funcionario (
	nome VARCHAR(55) NOT NULL,
	nif INT NOT NULL,
	tipo_contrato VARCHAR(55) NOT NULL,
	tipo_de_trabalho VARCHAR(255) NOT NULL,
	salario DECIMAL(10,2) CHECK (salario > 500),
	horas_semanais INT NOT NULL,
	PRIMARY KEY(nif));
	

CREATE TABLE  Equipamento (
	tipo_equipamento VARCHAR(255) NOT NULL,
	combustivel VARCHAR(10)  NOT NULL,
	Nu_serie INT NOT NULL,
	marca VARCHAR(15) NOT NULL,
	PRIMARY KEY (Nu_serie));


CREATE TABLE  Fornecedor (
	FORNnif INT NOT NULL,
	tipo_fornecedor VARCHAR(255) NOT NULL,
	PRIMARY KEY (FORNnif));


CREATE TABLE Fornecer_equipamentos (
	Equipamento_Nu_serie Int NOT NULL,
	nif_fornecedor INT NOT NULL,
	preco DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (Equipamento_Nu_serie,nif_fornecedor),
	FOREIGN KEY (Equipamento_Nu_serie) REFERENCES Equipamento (Nu_serie),
	FOREIGN KEY (nif_fornecedor) REFERENCES Fornecedor (FORNnif));


CREATE TABLE Sementes (
	tempo_preservacao INT NOT NULL,
	tempo_germinacao INT NOT NULL,
	data_plantio VARCHAR(15) NOT NULL,
	Nu_loteSementes INT NOT NULL,
	FuncionarioNif INT NOT NULL,
	Nif_fornecedor INT NOT NULL,
	Nu_sementes INT NOT NULL,
	PRIMARY KEY (Nu_loteSementes),
	FOREIGN KEY (FuncionarioNif) REFERENCES Funcionario (nif),
	FOREIGN KEY (Nif_fornecedor) REFERENCES Fornecedor (FORNnif));


CREATE TABLE Cooperativa (
	C_nif INT NOT NULL,
	cotas_mensais int NOT NULL,
	fundos DECIMAL(10,2)  not null,
	nome VARCHAR(55) not null
	PRIMARY KEY (C_nif),
	FOREIGN KEY (C_nif) REFERENCES Fornecedor (FORNnif));
	


CREATE TABLE ProdutoFinal (
	peso DECIMAL(10,2) NOT NULL,
	data_colheita VARCHAR(15)  NOT NULL,
	tempo_durabilidade INT  NOT NULL,
	especie VARCHAR(10)  NOT NULL,
	preco DECIMAL(10,2)  NOT NULL,
	Func_nif INT NOT NULL,
	CooperativaNIF INT  NOT NULL,
	nu_loteProdFinal INT NOT NULL,
	loteSemNu INT NOT NULL,
	PRIMARY KEY (nu_loteProdFinal),
	FOREIGN KEY (Func_nif) REFERENCES Funcionario (nif),
	FOREIGN KEY (CooperativaNIF) REFERENCES Cooperativa (C_nif),
	FOREIGN KEY (nu_loteProdFinal) REFERENCES Sementes (Nu_loteSementes));


CREATE TABLE Manutencao (
	joindate VARCHAR(55) NOT NULL,
	estado VARCHAR(15) NOT NULL,
	tipo_manutencao VARCHAR(15) NOT NULL,
	id_Item INT NOT NULL,
	PRIMARY KEY (id_Item));


CREATE TABLE Equipamento_Manutencao (
	EquipNu_serie INT NOT NULL,
	Man_idItem INT NOT NULL,
	Primary Key (EquipNu_serie,Man_idItem),
	Foreign Key (EquipNu_serie) References Equipamento (Nu_serie),
	Foreign Key (Man_idItem) References Manutencao (id_item));


Create table Utilizacao_equipamento (
	Funcionario_nif INT NOT NULL,
	Equipamento_SerialNumber INT NOT NULL,
	Primary Key (Equipamento_SerialNumber,Funcionario_nif),
	Foreign Key (Equipamento_SerialNumber) References Equipamento (Nu_serie),
	Foreign Key (Funcionario_nif) References Funcionario (nif));


Create Table Fornecer_sementes (

	nif_fornecedor INT NOT NULL,
	NuLote_sementes INT NOT NULL,
	PRIMARY KEY (nif_fornecedor, NuLote_sementes ),
	Foreign Key (NuLote_Sementes) References Sementes (Nu_loteSementes),
	Foreign Key (nif_fornecedor) References Fornecedor (FORNnif),
	);


	create table credenciais_hash (
    usr varchar(100) not null primary key,
    pwd varbinary(1000) not null
	)



