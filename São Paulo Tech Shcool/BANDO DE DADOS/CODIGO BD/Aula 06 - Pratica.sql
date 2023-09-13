-- Aula 6
-- Modelagem de dados
-- Nosso primeiro Join

create database sprint2;

use sprint2;

create table empresa 
(idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45)
) auto_increment = 1000;

insert into empresa values 
	(null, 'C6bank', 'andresa'),
    (null, 'accenture', 'rafael');
    
select * from empresa;

create table aluno (
ra char(8) primary key,
nome varchar(45),
bairro varchar(45));

insert into aluno values 
('01232039', 'Luana', 'Pasaiso', 1000),
('01232054', 'Joao', 'Jd record', 1001);

select * from aluno;

-- adicionando chave estrangeira

Alter table aluno add column fkEmpresa int;

desc aluno;

-- Adicionando uma chave estranjeira da empresa na tabela aluno;

alter table aluno add constraint fkEmp
	foreign key (fkEmpresa)
		references empresa(idEmpresa);


select * from aluno join empresa 
	on idEmpresa = fkEmpresa;
    
-- pregando nome da tabela aluno e da tabela empresa 
select aluno.nome as Nome_Aluno,
	empresa.nome as Nome_empresa
		from aluno join empresa
        on idEmpresa = fkEmpresa;
        
-- pregando nome da tabela aluno e da tabela empresa abreviando a tavela  
select a.nome as Nome_Aluno,
	e.nome as Nome_empresa
		from aluno as a join empresa as e
        on idEmpresa = fkEmpresa;
        