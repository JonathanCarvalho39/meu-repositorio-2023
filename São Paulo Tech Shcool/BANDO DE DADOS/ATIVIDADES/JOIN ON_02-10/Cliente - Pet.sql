use sprint2;

create table pet (
pet_id int primary key auto_increment,
tipo varchar (40),
nome varchar(50),
raca varchar(50),
data_nasc date,
fk_cliente int) auto_increment = 100;

-- DEFINDO FOREIGN KEY DA TABELA PET
alter table pet add constraint fkCliente
	foreign key (fk_cliente)
		references cliente (cliente_id);
        
insert into pet (tipo, nome, raca, data_nasc, fk_cliente)values
('Cachorro','Bruce', 'Pastor Alemão', '2014-03-01', 1),
('Cachorro','Thor', 'São Bernardo', '2011-05-25', 2),
('Cachorro','Snupy', 'Vira-lata', '2018-04-11', 3),
('Gato', 'Wisck', 'Vira-lata', '2019-02-20', 1);

-- EXIBINDO TABELA PET
select * from pet;

create table cliente (
cliente_id int primary key auto_increment,
nome varchar (50),
telefone_fixo char(11),
telefone_celular char (11));


insert into cliente (nome, telefone_fixo, telefone_celular) values
('João Silva', '12345678901', '98765432101'),
('Maria Oliveira', '23456789012', '87654321012'),
('Pedro Costa', '56789012345', '54321098745'),
('Julia Costa', '56789012345', '54321058745');

desc cliente;

-- EXIBINDO TABELA CLIENTE
select * from cliente;

create table endereco (
    endereco_id int primary key auto_increment,
    cep char(8),
    estado char(2),
    cidade varchar(40),
    bairro varchar(50),
    logradouro varchar(50),
    numero varchar(10),
    fk_cliente int
) auto_increment = 200;

-- DEFINDO FOREIGN KEY DA TABELA ENDEREÇO
alter table endereco add constraint fk_Cliente
	foreign key (fk_cliente)
		references cliente(cliente_id);
        
insert into endereco (cep, estado, cidade, bairro, logradouro, numero, fk_cliente) values
('67890125', 'SP', 'São Paulo', 'Vila Madalena', 'Rua alameda', '789', 1),
('78901236', 'RJ', 'Rio de Janeiro', 'Botafogo', 'Rua pereira', '012', 2),
('89012347', 'MG', 'Belo Horizonte', 'Santa Efigênia', 'Rua joao', '345', 3),
('90123458', 'RS', 'Porto Alegre', 'Partenon', 'Rua silva', '678', 3),
('01234569', 'BA', 'Salvador', 'Pituba', 'Rua tatui', '901', 4);

-- EXIBINDO TABELA ENDEREÇO
select * from endereco;

-- MODIFICANDO TAMANHO DA COLUNA NOME DA TABELA CLIENTE
alter table cliente modify column nome varchar (70);


-- EXIBINDO TODOS OS PETS QUE SAO DO TIPO CACHORRO
select * from pet where tipo = 'cachorro';

-- EXIBINDO SOMENTE O NOME E A DATA DOS PETS
select nome as NOME_CACHORRO, data_nasc as NASCIMENTO from pet; 

-- EXIBINDO DADOS DOS PETS EM ORDEM CRESCENTE PELO NOME DOS PETS
select * from pet order by nome asc;

-- EXIBINDO DADOS DOS CLIENTES EM ORDEM DESC PELO BAIRRO
select * from 
	cliente join endereco
				on cliente_id = fk_cliente
					order by bairro desc;
                    
-- EXIBINDO DADOS DOS PETS CUJO O NOME COMECE COM B
select * from pet where nome like ('B%');

-- EXIBINDO OS DADOS DOS CLIENTES QUE TEM O MESMO SOBRENOME
select * from cliente where nome like ('% Costa%');

-- ALTERANDO TELEFONE DE UM DETERMINADO CLIENTE
update cliente set telefone_fixo = '12345645325'
	where cliente_id = 1;
    
-- EXIBINDO TABELA CLIENTE PARA VERIFICAR SE FOI FEITO A ALTERAÇÃO OU NÃO
 select cliente_id, telefone_fixo from cliente;
 
 -- EXIBINDO DADOS DOS PETS E SEUS DONOS 
 select * from 
			pet join cliente
				on cliente_id = fk_cliente;

-- EXIBIR DADOS DOS PETS E SEU RESPECTVO DONO DO CLIENTE JOAO SILVA
select * from 
		pet join cliente
			on cliente_id = fk_cliente
				where cliente.nome = 'João Silva';

-- DELETANDO O PET COM O ID 102
delete from pet where pet_id = 102;

-- EXIBINDO A TABELA PET PARA VERIFICAR EXCLUSÃoptimize
select * from pet;

-- EXCLUINDO TABELAS DO BANDO DE DADOS 
drop table cliente, pet, endereco;

-- VERIFICANDO EXCLUSÃO
show tables;




