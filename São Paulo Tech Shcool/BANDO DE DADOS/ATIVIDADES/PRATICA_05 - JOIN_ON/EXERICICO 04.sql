-- Criar um banco de dados chamado Treinador.
create database treinador;

--  Selecionar esse banco de dados
use treinador;

-- Criar as tabelas correspondentes à sua modelagem
create table nadador (
	nadador_id int primary key auto_increment,
    nome varchar (45),
    estado char (2),
    dt_nasc date,
    fk_treinador int) auto_increment = 100;
    

-- Inserir dados nas tabelas, de forma que exista mais de um nadador para algum 
-- treinador, e mais de um treinador sendo orientado por algum treinador mais
-- experiente
insert into nadador (nome, estado, dt_nasc, fk_treinador) values
	('Pedro Souza', 'SP', '1990-05-15'),
	('Juliana Lima', 'RJ', '1995-08-20'),
	('Rafaela Costa', 'MG', '2000-03-10'),
	('Lucas Oliveira', 'BA', '1998-11-25');
    
update nadador set fk_treinador = 13
	where nadador_id in (100,103);
    
update nadador set fk_treinador = 11
	where nadador_id = 101;

update nadador set fk_treinador = 10
	where nadador_id = 102;

-- Exibir todos os dados de cada tabela criada, separadamente	
select * from nadador;
    
--  Criar as tabelas correspondentes à sua modelagem
create table treinador (
	treinador_id int primary key auto_increment,
    nome varchar (45),
    telefone char(11),
    email varchar(100),
    fk_treinador_super int,
    fk_nadador int) auto_increment = 10;



alter table treinador add constraint fkTreinadorEx
	foreign key (fk_treinador_super)
		references treinador(treinador_id);
        
alter table nadador add constraint fkTreinador
	foreign key (fk_treinador)
		references treinador (treinador_id);
        
        
insert into treinador (nome, telefone, email, fk_treinador_super, fk_nadador) values
	('João Silva', '12345678901', 'joao@gmail.com', null),
	('Maria Oliveira', '98765432101', 'maria@gmail.com', 10),
	('Carlos Santos', '55544433322', 'carlos@gmail.com', 10),
	('Ana Pereira', '11122233344', 'ana@gmail.com', 11);

-- Exibir todos os dados de cada tabela criada, separadamente
select * from treinador;

desc treinador;

-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores
select * from
	treinador left join nadador
		on treinador_id = fk_treinador;
    
-- Exibir os dados de um determinado treinador (informar o nome do treinador na
-- consulta) e os dados de seus respectivos nadadores
select * from 
	treinador join nadador
		on treinador_id = fk_treinador
			where treinador.nome = 'Ana Pereira';
            
-- Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores
select * from 
	treinador as s join treinador as t
		on t.fk_treinador_super = s.treinador_id;
 
 
-- Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores, porém somente de um determinado treinador orientador (informar o
-- nome do treinador na consulta).
select * from 
	treinador as s join treinador as t
		on t.fk_treinador_super = s.treinador_id
			where s.nome = 'João Silva';

-- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados
-- dos respectivos treinadores orientadores
select * from 
	treinador as t left join nadador
		on treinador_id = fk_treinador
			left join treinador as s 
				on  t.fk_treinador_super = s.treinador_id;
  
-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos
-- respectivos nadadores e os dados do seu treinador orientador
select * from 
	treinador as t left join nadador
		on treinador_id = fk_treinador
			 join treinador as s
				on t.fk_treinador_super = s.treinador_id
					where t.nome = 'Carlos Santos';