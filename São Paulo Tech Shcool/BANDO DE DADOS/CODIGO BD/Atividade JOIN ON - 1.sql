create database sprint2;

use sprint2;

create table Atleta (
	idAtleta int primary key,
	nome varchar(40),
	modalidade varchar(40),
	qntMedalha int);

insert into Atleta values
	(1, 'Julio', 'Futebol', 5),
	(2, 'Fernanda', 'Volei', 2),
	(3, 'Vivian', 'Futebol', 4),
	(4, 'Arthur', 'Basquete', 2),
	(5, 'Fernando', 'Volei', 4);

select * from atleta;

create table Pais (
	idPais int primary key,
	nome varchar (40),
	capital varchar (40));

insert into Pais values 
	(100, 'Brasil', 'Brasilia'),
	(101, 'EUA', 'Washington'),
	(102, 'Canada', 'Ottawa'),
	(103, 'França', 'Paris');

select * from Pais;

-- Alterando uma coluna da tabela, adicionando o fkPais, para servir de referencia de chave estrangeira
Alter table Atleta add column fkPais int;

-- Alterando A tabela definindo a chave estrangeira, buscando a referencia do id contido na tabela PAIS
Alter table Atleta add constraint fkPais
	foreign key (fkPais)
		references Pais(idPais);
        
desc Atleta;

-- Adicionando Pais aos atletas
update atleta set fkPais = 101
	where idAtleta = 1;
    
update atleta set fkPais = 102
	where idAtleta = 2;
    
update atleta set fkPais = 100
	where idAtleta = 3;
    
update atleta set fkPais = 103
	where idAtleta = 4;
    
update atleta set fkPais = 100
	where idAtleta = 5;


-- Exibindo os Dados de todos atletas e seus Paises     
select * from 
	Atleta join Pais
		on idPais = fkPais;

-- Exibindo Somente o nome do atleta e seu pais, Lembrando que eu alterei o nome das tabelas para a exibição
select Atleta.nome as Atleta, Pais.nome as Pais 
	from Atleta join Pais
		on idPais = fkPais;

-- Exibindo os dados somento de Atletas que moram em um Pais cujo a capital é Brasilia
Select * from 
	Atleta join Pais
		on idPais = fkPais
			where capital = 'Brasilia';
        
