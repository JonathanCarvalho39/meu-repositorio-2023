use sprint2;

create table pessoa(
	pessoa_id int primary key auto_increment,
    nome varchar(45),
    data_nasc date,
    profissao varchar(45)
    );
    
insert into pessoa (nome, data_nasc, profissao) values 
	('Jonathan', '1997-03-05', 'Marceneiro'),
	('Fatima', '1980-05-04', 'Professora'),
	('Julia', '2000-04-25', 'Dev'),
	('Leo', '1999-03-25', 'Dev');

select * from pessoa;

create table gasto (
	gasto_id int,
    fk_pessoa int,
    primary key (gasto_id, fk_pessoa),
    descricao varchar(50),
    data_gasto date);
    
    alter table gasto add constraint fkPessoa
		foreign key (fk_pessoa)
			references pessoa(pessoa_id);

-- Populando a tabela gasto
insert into gasto (gasto_id, fk_pessoa, descricao, data_gasto) values
	(10, 1, 'Coca-cola', '2023-01-25'),
    (11, 1, 'Chocolate', '2023-01-25'),
    (12, 2, 'Barra cerial', '2023-05-2'),
    (13, 3, 'Beterraba', '2023-04-5');

-- Exibindo a tabela gasto
select * from gasto;

-- exibindo dados da tabela pessoa com filtos 
select * from pessoa where profissao = 'marceneiro';

-- exibindo dados da tabela gasto e data do gasto
select * from gasto where data_gasto = '2023-01-25';

-- exibindo dadso da da pessoa e dos seus gastos 
select * from pessoa join gasto 
	on pessoa_id = fk_pessoa;
    
-- atualizando valores da tabela gasto 
update gasto set fk_pessoa = 4, descricao = 'Red Bul',  data_gasto = '2023-05-5'
	where gasto_id = 13;

select * from gasto;

-- Deletando os gastos que estao relacionados ao usuario com o id 1
delete from gasto where gasto_id in (10,11);

-- deletando o usuario com o id 1
delete from pessoa where pessoa_id = 1;




    
