CREATE DATABASE bdEstoque
GO
USE bdEstoque

CREATE TABLE tbCliente(
idCliente INT PRIMARY KEY IDENTITY (1,1)
,nomeCliente  VARCHAR(40) NOT NULL
,cpfCliente  VARCHAR(11) NOT NULL
,emailCliente  VARCHAR(40) NOT NULL
,sexoCliente  VARCHAR(25) NOT NULL
,dtNascCliente SMALLDATETIME NOT NULL
)
CREATE TABLE tbFabricante(
idFabricante INT PRIMARY KEY IDENTITY (1,1)
,nomeFabricante VARCHAR(50)
)
CREATE TABLE tbFornecedor(
idFornecedor  INT PRIMARY KEY IDENTITY (1,1)
,nomeFornecedor VARCHAR(50) NOT NULL
,contatoFornecedor  VARCHAR (9) 
)
CREATE TABLE tbVenda(
idVenda  INT PRIMARY KEY IDENTITY (1,1)
,dataVenda SMALLDATETIME NOT NULL
,valorTotalVenda SMALLMONEY NOT NULL
,idCliente  INT FOREIGN KEY REFERENCES tbCliente(idCliente)
)
CREATE TABLE tbProduto(
idProduto INT PRIMARY KEY IDENTITY (1,1)
,descricaoProduto VARCHAR(80) NOT NULL
,valorProduto SMALLMONEY NOT NULL
,quantidadeProduto INT NOT NULL
,idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
)
CREATE TABLE tbItensVenda(
idItensVenda INT PRIMARY KEY IDENTITY (1,1)
,qtdItensVenda INT NOT NULL
,subTotalItensVenda SMALLMONEY NOT NULL
,idVenda  INT FOREIGN KEY REFERENCES tbVenda(idVenda)
,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)