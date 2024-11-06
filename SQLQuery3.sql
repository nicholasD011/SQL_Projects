create database LojaBD
go

use LojaBD 
go

create table Categoria (
  CategoriaID int identity primary key,
  Nome varchar(255) not null,

);
go

create table Produto (
   ProdutoID int identity primary key,
   Nome varchar(255) not null,
   PrecoUnit decimal (10,2),
   QuantEstoque int not null,
   CategoriaID int,

);
go

create table Cliente (
  ClienteID int identity primary key,
  Nome varchar(255) not null,
  Email varchar(255) not null,
  Telefone varchar(255) not null, 

);
go

create table Pedido (
  PedidoID int identity primary key,
  DataPedido date not null,
  StatusPedido varchar(255) not null,
  ClienteID int ,

);
go

create table ItemPedido (
  ItemPedidoID int identity primary key,
  Quantidade int not null,
  PedidoID int,
  ProdutoID int,

);
go

alter table Produto
add CategoriaID int;

alter table Produto
add foreign key (CategoriaID) references Categoria(CategoriaID); 
go

alter table Pedido
add foreign key (ClienteID) references Cliente(ClienteID);
go

alter table ItemPedido
add foreign key (PedidoID) references Pedido(PedidoID),
    foreign key (ProdutoID) references Produto(ProdutoID);
go

insert into Categoria
values ('SmartPhone');
go

insert into Produto (CategoriaID,Nome,PrecoUnit,QuantEstoque)
values (1,'Iphone 15', 3500, 10)
go

insert into Cliente (Nome,Email,Telefone)
values ('Nicholas Davi', 'nicholas@gmail.com', 11998357842)
go

insert into Pedido (DataPedido,StatusPedido,ClienteID)
values ('2021/11/21', 'Pendente',1)
go

insert into ItemPedido (Quantidade,PedidoID,ProdutoID)
values (1, 1, 1)
go

select * from Categoria;
select * from Cliente;
select * from ItemPedido;
select * from Pedido;
select * from Produto;


delete from Pedido 


UPDATE Produto
SET CategoriaID = 1
WHERE ProdutoID = 3;