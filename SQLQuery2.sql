use master 
go
 
create database ConsultorioMedico;
go
 
use ConsultorioMedico;
go

create table Paciente(
	IdPaciente int identity primary key, 
	NomePaciente varchar(255) not null, 
	DataNascimento date not null, 
	Endereco varchar(255) not null, 
	Telefone varchar(15) not null
);
go
 
create table Medico(
	IdMedico int identity primary key, 
	NomeMedico varchar(255) not null, 
	CRM int not null, 
	IdEspecialidade int
);
go
 
create table Especialidade(
	IdEspecialidade int identity primary key, 
	Descricao varchar(255) not null
);
go
 
create table Consulta(
	IdConsulta int identity primary key, 
	IdPaciente int, 
	IdMedico int , 
	DataConsulta date not null,  
	Observacoes text not null
);
go

ALTER TABLE Medico  
ADD FOREIGN KEY (IdEspecialidade) REFERENCES Especialidade(IdEspecialidade)
GO
 
ALTER TABLE Consulta
ADD FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPaciente)
GO
 
ALTER TABLE Consulta
ADD FOREIGN KEY (IdMedico) REFERENCES Medico(IdMedico)
GO

INSERT INTO Paciente VALUES ('João','11/07/1900','Rua xxx','1132654578')
INSERT INTO Paciente VALUES ('Maria','11/07/2000','Rua yyy','1132654141')
INSERT INTO Paciente VALUES ('Rebeca','11/07/1950','Rua zzz','113265858')
INSERT INTO Paciente VALUES ('Flávio','11/07/1800','Rua xxxzz','113265488')
INSERT INTO Paciente VALUES ('Oswaldo','11/07/1922','Rua xxxyy','1132678578')
 
 
INSERT INTO Medico (NomeMedico,CRM) VALUES
('Dr Qdedo', 123456),
('Dra Olinda',456789)
 
INSERT INTO Especialidade VALUES ('Proctologista')
INSERT INTO Especialidade VALUES ('Geriatra')
 
INSERT INTO Consulta VALUES (1,1,'11/08/2024', 'Levar Flores')

UPDATE Medico SET IdEspecialidade = 3
WHERE IdMedico = 1
 
UPDATE Medico SET IdEspecialidade = 2 
WHERE IdMedico = 2

select * from Paciente
select * from Medico
select * from Especialidade
select * from Consulta

select 
C.IdPaciente,
P.NomePaciente,
C.IdMedico,
M.NomeMedico,
C.DataConsulta
from Consulta C
inner join Paciente P on P.IdPaciente = C.IdPaciente
inner join Medico M on M.IdMedico = C.IdMedico
where c.DataConsulta between '11-08-2024' and '11/14/2024'

 