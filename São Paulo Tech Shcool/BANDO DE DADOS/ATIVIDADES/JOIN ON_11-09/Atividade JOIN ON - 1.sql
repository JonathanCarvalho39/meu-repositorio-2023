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

-- Criando A tabela musica
create table Musica (
	idMusica int primary key,
    titulo varchar (40),
    artista varchar (40),
    genero varchar (40));
    
insert into Musica values 
	(10, 'Teu segredo', 'Exalta Samba', 'Pagode'),
    (11, 'Até o sol quis ver', 'Exalta Samba', 'Padode'),
    (13, 'Vida loka parte 1', 'Racionais MCs', 'RAP'),
    (14, 'Vida loka parte 2', 'Racionais MCs', 'RAP');
    
select * from Musica;

-- Criando a tabela album
create table album (
	idAlbum int primary key,
    nome  varchar (40),
    tipo varchar (40),
    data_lancamento date);

-- Adicionado uma constrain na tabela album que só pode receber duas palavras, FISICO E DIGITAL    
Alter table album add constraint chekTipo check (tipo in ('digital', 'fisico'));


insert into album values
	(1000, 'Nada como um Dia Após o Outro Dia', 'fisico', '2002-10-02'),
    (1001, 'Ao Vivo na Ilha da Magia', 'fisico', '2008-12-20');
    
select * from album;

-- Alterando a tabela musica, Adicionando uma coluna para receber a chave estrangeira da tabela album 
alter table Musica add column fkAlbum int;

-- Alterando o campo para ser uma chave estrangera e receber a referencia da tabela idAlbum
alter table musica add constraint chkAlbum
	foreign key (fkAlbum)
		references album(idAlbum);
        
desc Musica;

select * from Musica;

Select * from album;

Update musica set fkAlbum = 1000
	where idMusica in(13,14);
    
update musica set fkAlbum = 1001
	where idMusica in(10,11);
    
-- Exibindo todos os campos musicas e album respectivos
select * from musica join album
	on idAlbum = fkAlbum;
    
-- Exibindo o titulo da musica e album respectivos
select musica.titulo as Nome_Musica, album.nome as Nome_Album from 
	musica join album 
		on idAlbum = fkAlbum;
        
-- Exibindo todos os campos de musica que estao relacionados a albuns que são fisicos
select * from musica join album 
	on idAlbum = fkAlbum
		where tipo = 'fisico';
	
	
    
        
