--CREATE DATABASE VIDEOLOCADORA
--GO 
--USE VIDEOLOCADORA

--CRIAÇÃO DAS TABELAS

--APAGA AS TABELAS E RECRIA
if OBJECT_ID('LOCACOES','U') IS NOT NULL 
DROP TABLE LOCACOES;

if OBJECT_ID('FILME','U') IS NOT NULL 
DROP TABLE FILME;

if OBJECT_ID('CATEGORIA','U') IS NOT NULL 
DROP TABLE CATEGORIA;

if OBJECT_ID('CLIENTES','U') IS NOT NULL 
DROP TABLE CLIENTES;


CREATE TABLE dbo.CLIENTES
(
	COD_CLIENTE NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	RG VARCHAR(9) NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	ENDERECO VARCHAR(50) NULL,
	BAIRRO VARCHAR(30) NULL,
	CIDADE VARCHAR(30) NULL, 
	ESTADO CHAR(2) NOT NULL,
	TELEFONE VARCHAR(15) NULL,
	EMAIL VARCHAR(30) NULL,
	DATANASCIMENTO DATETIME NULL,
	sexo char(1)
);

CREATE TABLE dbo.CATEGORIA
(
	COD_CATEGORIA NUMERIC(10,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	NOME_CATEGORIA VARCHAR(20) NOT NULL,
);

CREATE TABLE dbo.FILME
(
	COD_FILME NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FILME VARCHAR(30) NOT NULL,
	COD_CATEGORIA NUMERIC(10,0) NOT NULL,
	DIRETOR VARCHAR(50) NOT NULL,
	VALOR_LOCACAO FLOAT NOT NULL,
	RESERVADA CHAR(1) NOT NULL
);

CREATE TABLE dbo.LOCACOES
(
	COD_LOCACAO NUMERIC(18,0) IDENTITY(1,1) NOT NULL,
	COD_CLIENTE NUMERIC(18,0) NOT NULL,
	COD_FILME NUMERIC(18,0) NOT NULL,
	DATA_RETIRADA DATETIME NOT NULL,
	DATA_DEVOLUCAO DATETIME NULL,
	CONSTRAINT PK_LOCACAO_CLIENTE PRIMARY KEY(COD_LOCACAO, COD_CLIENTE, COD_FILME)
)


--CRIAÇÃO DOS RELACIONAMENTOS 
--LOCACAO - CLIENTES
ALTER TABLE dbo.LOCACOES WITH CHECK ADD CONSTRAINT FK_LOCACOES_CLIENTE FOREIGN KEY (COD_CLIENTE)
REFERENCES dbo.CLIENTES(COD_CLIENTE)
GO

ALTER TABLE dbo.LOCACOES CHECK CONSTRAINT FK_LOCACOES_CLIENTE 
GO


-- LOCACOES - FILME
ALTER TABLE dbo.LOCACOES WITH CHECK ADD CONSTRAINT FK_LOCACOES_FILME FOREIGN KEY (COD_FILME)
REFERENCES dbo.FILME(COD_FILME)
GO

ALTER TABLE dbo.LOCACOES CHECK CONSTRAINT FK_LOCACOES_FILME 
GO

--FILME - CATEGORIA
ALTER TABLE dbo.FILME WITH CHECK ADD CONSTRAINT FK_CATEGORIA_FILME FOREIGN KEY (COD_CATEGORIA)
REFERENCES dbo.CATEGORIA(COD_CATEGORIA)
GO

ALTER TABLE dbo.FILME CHECK CONSTRAINT FK_CATEGORIA_FILME
GO

-- INSERÇÕES NAS TABELAS
--categoria
INSERT INTO dbo.CATEGORIA VALUES ('Ação');
INSERT INTO dbo.CATEGORIA VALUES ('Romance');
INSERT INTO dbo.CATEGORIA VALUES ('Aventura');
INSERT INTO dbo.CATEGORIA VALUES ('Ficção');
INSERT INTO dbo.CATEGORIA VALUES ('Drama');
INSERT INTO dbo.CATEGORIA VALUES ('Terror');
INSERT INTO dbo.CATEGORIA VALUES ('Desenho');
INSERT INTO dbo.CATEGORIA VALUES ('Policial');
INSERT INTO dbo.CATEGORIA VALUES ('Comédia');

--clientes

INSERT INTO dbo.CLIENTES VALUES ('321346530', 'Edson Martin Feitosa', 'Rua xxx Alvarenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32125809', 'edson.feitosa@ig.com.br', convert(datetime,'1982-11-30 00:00:00.000',102), 'M')					   ;
INSERT INTO dbo.CLIENTES VALUES ('421346111', 'Rafael Fernando de Moraes Moreno', 'Rua xxxx de xxxx, 123', 'Jd. Nova Esperança', 'São Roque', 'SP', '32274567', 'rafael@terra.com.br', convert(datetime,'1985-04-01 00:00:00.000',102), 'M')	   ;
INSERT INTO dbo.CLIENTES VALUES ('324857670', 'João da Silva', 'Rua xxxx xxxx, 13', 'Av. Bartolomeu', 'Sorocaba', 'SP', '32134098', 'joao@uol.com.br',convert(datetime, '1992-12-05 00:00:00.000',102), 'M')									   ;
INSERT INTO dbo.CLIENTES VALUES ('112345553', 'Maria Chiquinha', 'Rua xxxx, 55', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '23336684', 'maria@ig.com.br', convert(datetime,'1982-11-30 00:00:00.000',102), 'F')										   ;
INSERT INTO dbo.CLIENTES VALUES ('945848768', 'Rafael Nunes Sales', 'Rua xxx Alvarenga, 4', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32124609', 'rafael.sales@terra.com.br', convert(datetime,'1985-04-01 00:00:00.000',102), 'M')					   ;
INSERT INTO dbo.CLIENTES VALUES ('676548499', 'Daniela Martin Feitosa', 'Rua xxxxx, 1', 'Jd. Vera das Acássicas', 'Votorantim', 'SP', '32132109', 'daniela.martin@gmail.com',convert(datetime, '1986-12-26 00:00:00.000',102), 'F')			   ;
INSERT INTO dbo.CLIENTES VALUES ('321349999', 'Renata Cristina', 'Rua xxx Alvarenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32125809', 'renata@gmail', convert(datetime,'1970-09-01 00:00:00.000',102), 'F')									   ;
INSERT INTO dbo.CLIENTES VALUES ('335466531', 'Joaquim Ferreira de Souza Junior', 'Rua xxx xxxx, 65', 'Jd. Santa Rosália', 'Votorantim', 'SP', '11125809', 'joaquim_junior@ig.com.br',convert(datetime, '1980-04-08 00:00:00.000',102), 'M')	   ;
INSERT INTO dbo.CLIENTES VALUES ('112233445', 'Ladislau Ferreira', 'Rua xxxx Alvarenga, 12345', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32144409', 'ladislau@terra.com.br',convert(datetime, '1988-01-03 00:00:00.000',102), 'M')					   ;
INSERT INTO dbo.CLIENTES VALUES ('222222222', 'Vanessa Oliveira', 'Rua xxxxxx, 1', 'Jd. do Sol', 'Votorantim', 'SP', '32122222', 'vanessa@ig.com.br',convert(datetime, '1998-08-08 00:00:00.000',102), 'F')									   ;

--filmes																						;
INSERT INTO dbo.FILME VALUES ('300', 1, 'Richard Donner', 3.5, 'n');
INSERT INTO dbo.FILME VALUES ('Máquina Mortífera', 1, 'Richard Donner', 3.6, 'n');
INSERT INTO dbo.FILME VALUES ('A Mexicana', 2, 'Burr Steers', 2, 's');
INSERT INTO dbo.FILME VALUES ('A Verdade Nua e Crua', 2, 'Robert Luketic', 4, 'n');
INSERT INTO dbo.FILME VALUES ('A vida é bela', 2, 'Roberto Benigni', 3.5, 's');
INSERT INTO dbo.FILME VALUES ('Austrália', 3, 'Baz Luhrmann', 4, 's');
INSERT INTO dbo.FILME VALUES ('Ultimato Bourn', 3, 'Paul Greengrass', 3.5, 'n');
INSERT INTO dbo.FILME VALUES ('Constantine', 4, 'Francis Lawrence', 2.5, 's');
INSERT INTO dbo.FILME VALUES ('Os Irmãos Grimm', 4, 'Terry Gilliam', 3.5, 'n');
INSERT INTO dbo.FILME VALUES ('Os Doze Macacos', 4, 'Terry Gilliam', 2.5, 'n');
INSERT INTO dbo.FILME VALUES ('Amadeus', 5, 'Milos Forman', 10, 'n');
INSERT INTO dbo.FILME VALUES ('As Torres Gêmeas', 5, 'Oliver Stone', 2.5, 's');
INSERT INTO dbo.FILME VALUES ('Platoon', 1, 'Oliver Stone', 5.5, 's');
INSERT INTO dbo.FILME VALUES ('O Advogado do Diabo', 6, 'Taylor Hackford', 1.5, 's');
INSERT INTO dbo.FILME VALUES ('Beowulf', 7, 'Robert Zemeckis', 1, 'n');
INSERT INTO dbo.FILME VALUES ('Bolt o super cão', 7, 'Byron Howard', 1.5, 's');
INSERT INTO dbo.FILME VALUES ('Apertem o cinto o piloto sumiu', 9, 'Jim Abrahams', 3.6, 's');
INSERT INTO dbo.FILME VALUES ('Doze é demais', 9, 'Shawn Levy', 9.2, 's');
INSERT INTO dbo.FILME VALUES ('Uma noite no museu', 9, 'Shawn Levy', 2.5, 'n');

--Locações


INSERT INTO LOCACOES VALUES (1,1,convert(datetime,'2010-03-20 19:05:43.887',102),convert(datetime,'2010-03-23 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (1,6,convert(datetime,'2010-03-20 19:05:43.887',102),convert(datetime,'2010-03-23 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (1,8,convert(datetime,'2010-03-20 19:05:43.887',102),convert(datetime,'2010-03-23 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (1,2,convert(datetime,'2010-03-15 00:00:00.000',102),convert(datetime,'2010-03-17 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (1,13,convert(datetime,'2010-03-15 00:00:00.000',102),convert(datetime,'2010-03-17 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (2,5,convert(datetime,'2010-03-20 19:05:43.887',102),convert(datetime,'2010-03-21 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (3,3,convert(datetime,'2010-03-18 19:05:43.887',102),convert(datetime,'2010-03-20 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (3,19,convert(datetime,'2010-03-18 19:05:43.887',102),convert(datetime,'2010-03-20 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (4,17,convert(datetime,'2010-03-01 19:05:43.887',102),convert(datetime,'2010-03-03 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (5,5,convert(datetime,'2010-03-03 19:05:43.887',102),convert(datetime,'2010-03-05 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (6,7,convert(datetime,'2010-03-03 19:05:43.887',102),convert(datetime,'2010-03-04 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (6,9,convert(datetime,'2010-03-03 19:05:43.887',102),convert(datetime,'2010-03-04 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (7,16,convert(datetime,'2010-03-13 19:05:43.887',102),convert(datetime,'2010-03-15 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (7,1,convert(datetime,'2010-03-13 19:05:43.887',102),convert(datetime,'2010-03-15 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (7,5,convert(datetime,'2010-03-14 19:05:43.887',102),convert(datetime,'2010-03-16 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (7,8,convert(datetime,'2010-03-14 19:05:43.887',102),convert(datetime,'2010-03-16 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (7,11,convert(datetime,'2010-03-14 19:05:43.887',102),convert(datetime,'2010-03-16 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (7,12,convert(datetime,'2010-03-15 19:05:43.887',102),convert(datetime,'2010-03-17 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (8,9,convert(datetime,'2010-03-20 19:05:43.887',102),convert(datetime,'2010-03-21 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (9,3,convert(datetime,'2010-03-21 19:05:43.887',102),convert(datetime,'2010-03-22 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (9,6, convert(datetime,'2010-03-21 19:05:43.887',102), convert(datetime,'2010-03-22 00:00:00.000',102));
INSERT INTO LOCACOES VALUES (10,10,convert(datetime,'2010-02-20 19:05:43.887',102),convert(datetime,'2010-02-21 00:00:00.000',102));
																											;
