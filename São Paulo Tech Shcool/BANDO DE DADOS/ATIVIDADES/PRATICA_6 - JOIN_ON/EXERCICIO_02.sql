create database campanha;

use campanha;

create table endereco (
	endereco_id int primary key auto_increment,
    estado char(2),
    CEP char(8),
    cidade varchar (45),
    bairro varchar (45),
    rua varchar (45),
    numero varchar (10))auto_increment = 100;
    
insert into endereco (estado, CEP, cidade, bairro, rua, numero) values
('SP', '12345678', 'São Paulo', 'Centro', 'Avenida Paulista', '123'),
('RJ', '87654321', 'Rio de Janeiro', 'Copacabana', 'Rua Nascimento Silva', '456'),
('MG', '98765432', 'Belo Horizonte', 'Savassi', 'Rua Pernambuco', '789'),
('SP', '45678901', 'São Paulo', 'Vila Madalena', 'Rua Girassol', '789'),
('RJ', '23456789', 'Rio de Janeiro', 'Ipanema', 'Avenida Vieira Souto', '123'),
('MG', '34567890', 'Belo Horizonte', 'Funcionários', 'Rua Bernardo Guimarães', '456');
    
select * from endereco;


create table organizador (
	organizador_id int primary key auto_increment,
    nome varchar(50),
    email varchar (100),
    fk_endereco int,
    fk_organizador_exp int) auto_increment = 30;
    

truncate table organizador;
    
insert into organizador (nome, email, fk_endereco, fk_organizador_exp) values
('João Silva', 'joao@email.com', 100, null),
('Maria Oliveira', 'maria@email.com', 101, 30),
('Carlos Santos', 'carlos@email.com', 102, 30),
('Ana Oliveira', 'ana@email.com', 103, null),
('Lucas Santos', 'lucas@email.com', 104, 33),
('Juliana Lima', 'juliana@email.com', 105, 33);

select * from organizador;
    
alter table organizador add constraint fkOrganizadorEX
	foreign key (fk_organizador_exp)
		references organizador (organizador_id);
        
alter table organizador add constraint fkEndereco
	foreign key (fk_endereco)
		references endereco(endereco_id);
        
desc organizador;

create table campanha_doacao (
	campanha_id int,
    fk_organizador int,
	primary key (campanha_id, fk_organizador),
    categoria varchar(45),
    instituicao varchar(45),
    dt_final_campanha date);
    
alter table campanha_doacao auto_increment = 500;
    
alter table campanha_doacao add constraint chkInstituicao
	check (instituicao in('Bancorbrás','Ituverava'));

insert into campanha_doacao(campanha_id, fk_organizador, categoria, instituicao, dt_final_campanha) values
(500, 30, 'Alimentos', 'Bancorbrás', '2023-12-31'),
(501, 31, 'Roupas', 'Ituverava', '2023-11-30'),
(502, 31, 'Dinheiro', 'Bancorbrás', '2023-10-15'),
(503, 33, 'Livros', 'Ituverava', '2023-09-30'),
(504, 34, 'Brinquedos', 'Bancorbrás', '2023-08-31'),
(505, 33, 'Eletrônicos', 'Ituverava', '2023-07-15');

select * from campanha_doacao;

-- Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
select * from 
	organizador join campanha_doacao
		on organizador_id = fk_organizador;
        
-- Exibir os dados de um determinado organizador (informar o nome do
-- organizador na consulta) e os dados de suas respectivas campanhas.
select * from
	organizador join campanha_doacao
		on organizador_id = fk_organizador
			where organizador.nome = 'Maria Oliveira';
            
-- Exibir os dados dos organizadores novatos e os dados dos respectivos
-- organizadores orientadores.
select * from 
	organizador as o left join organizador as exp
		on o.fk_organizador_exp = exp.organizador_id;
        
-- Exibir os dados dos organizadores novatos e os dados dos respectivos
-- organizadores orientadores, porém somente de um determinado organizador
-- orientador (informar o nome do organizador orientador na consulta
select * from 
	organizador as o join organizador as exp
		on o.fk_organizador_exp = exp.organizador_id
			where exp.nome = 'João Silva';
            
-- Exibir os dados dos organizadores novatos, os dados das respectivas
-- campanhas organizadas e os dados dos respectivos organizadores orientadores.
select * from 
	organizador as o left join campanha_doacao
		on o.organizador_id = fk_organizador
			left join organizador as exp
				on o.fk_organizador_exp = exp.organizador_id;
                
-- Exibir os dados de um organizador novato (informar o seu nome na consulta),
-- os dados das respectivas campanhas em que trabalha e os dados do seu
-- organizador orientador
select * from 
	organizador as o join campanha_doacao
		on o.organizador_id = fk_organizador
			join organizador as exp 
				on exp.organizador_id = o.fk_organizador_exp
					where o.nome = 'Maria Oliveira';

    

    

    


