create database Biblioteca 
go

use Biblioteca
go

create table Livro (
  LivroID int identity primary key,
  Titulo varchar(255) not null,
  Genero varchar(255) not null, 
  AnoPublicacao date not null,
  Editora varchar(255) not null,

);
go

create table Autor (
  AutorID int identity primary key,
  Nome varchar(255) not null,
  PaisOrigem varchar(255) not null,

);
go

create table LivroAutor (
  LivroAutorID int identity primary key,
  LivroID int,
  AutorID int,
  DataAssociacao date not null,

);
go

create table Emprestimo (
  EmprestimoID int primary key,
  LivroID int,
  DataEmprestimo date not null,
  DataDevolucao date not null,
  NomeUsuario varchar(255) not null,

);
go

alter table LivroAutor
add foreign key (LivroID) references Livro(LivroID)
go

alter table LivroAutor
add foreign key (AutorID) references Autor(AutorID)
go

alter table Emprestimo
add foreign key (LivroID) references Livro(LivroID)
go

insert into Autor (Nome,PaisOrigem)
values ('Nicholas Sparks', 'EUA');
go

insert into Emprestimo (LivroID,DataEmprestimo,DataDevolucao,NomeUsuario)
values (1, '2024/12/15', '2025/01/21', 'Nichollas')
go

select * from Emprestimo