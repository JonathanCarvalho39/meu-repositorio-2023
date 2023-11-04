
/* Fazer a modelagem lógica de um sistema para cadastrar os clientes, suas vendas e seus respectivos produtos.
- Cada cliente realiza mais de uma venda.
- Cada venda é de apenas um cliente e tem mais de um produto.
- Cada produto pode ser vendido em mais de uma venda.
- Sobre cada cliente, o sistema guarda um identificador, que identifica de forma única cada cliente.
 Além desse identificador, o sistema guarda o nome, o email e o endereço.
- Sobre cada venda, o sistema guarda um identificador, que identifica de forma única cada venda. O sistema também guarda o total da venda e a data.
- Sobre cada produto, o sistema guarda um identificador, que identifica de forma única cada produto. Além desse identificador, o sistema guarda o nome, a descrição
e o preço do produto.
- Um cliente indica outro cliente, necessário que o sistema guarde qual cliente indicou o outro cliente. Cada cliente pode indicar muitos clientes
e cada cliente é indicado por apenas um cliente.
- O sistema ainda precisa saber quantidade do produto vendido numa determinada venda e o valor do desconto.
Abra no MySQL Workbench uma nova aba para fazer os comandos SQL. Escrever os comandos do MySQL para: */ 

-- a) Criar um banco de dados chamado Venda.
create database venda;

-- b) Selecionar esse banco de dados.
use venda;

-- c) Criar as tabelas correspondentes à sua modelagem.
create table cliente (
	cliente_id int primary key,
    nome varchar (50),
    email varchar (100),
    fk_cliente_indicador int,
    cidade varchar (45),
    bairro varchar (45),
    logradouro varchar (45),
    numero varchar (45));
    
alter table cliente add constraint fkIndicador
	foreign key (fk_cliente_indicador)
		references cliente (cliente_id);
        
desc cliente;
        
create table venda (
	venda_id int auto_increment,
    fk_cliente int,
    primary key(venda_id, fk_cliente),
    data_venda datetime,
    valor_total decimal);
    
    alter table venda modify column valor_total decimal(8,2);

alter table venda add constraint fkCliente
	foreign key (fk_cliente) references cliente (cliente_id);
   
desc venda;

insert into venda (fk_cliente, data_venda, valor_total) values
(1, '2023-10-30 10:00:00', 150.50),
(2, '2023-10-29 15:30:00', 200.00),
(3, '2023-10-28 14:45:00', 75.80),
(1, '2023-10-27 11:20:00', 120.00),
(4, '2023-10-26 09:00:00', 300.25);

select * from  venda;

create table produto (
	produto_id int primary key auto_increment,
    nome varchar (50),
    descricao text,
    preco decimal (8, 2));

insert into produto (nome, descricao, preco) values
('Camisa', 'Camisa de algodão de alta qualidade', 29.99),
('Calça Jeans', 'Calça jeans confortável e durável', 49.99),
('Tênis Esportivo', 'Tênis para corrida com tecnologia avançada', 79.99),
('Mochila', 'Mochila resistente com vários compartimentos', 39.99),
('Relógio Inteligente', 'Relógio com monitoramento de atividades', 129.99);

select * from produto;

desc produto;

create table nota_fiscal (
	id_nota_fical int auto_increment,
    fk_produto int,
    fk_venda int,
    fk_cliente int,
    primary key(id_nota_fical, fk_produto, fk_venda, fk_cliente),
	constraint fk_Produto foreign key (fk_produto) references produto (produto_id),
    constraint fk_Venda foreign key (fk_venda) references venda (venda_id),
    constraint fk_Cliente foreign key (fk_cliente) references cliente (cliente_id),
    quantidade_produto int,
    desconto decimal);
    
insert into nota_fiscal (fk_produto, fk_venda, fk_cliente, quantidade_produto, desconto) values
	(1, 1, 1, 2, 5.00),
	(2, 2, 2, 1, 2.50),
	(3, 3, 3, 3, 0.00),
	(4, 4, 4, 1, 10.00),
	(5, 5, 5, 2, 7.50);
    

-- d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada
-- cliente, e mais de um cliente sendo indicado por outro cliente.
insert into cliente values
(1, 'João Silva', 'joao@email.com', null, 'São Paulo', 'Vila Mariana', 'Rua A', '123'),
(2, 'Maria Oliveira', 'maria@email.com', 1, 'Rio de Janeiro', 'Copacabana', 'Avenida B', '456'),
(3, 'Carlos Santos', 'carlos@email.com', 1, 'Belo Horizonte', 'Centro', 'Rua C', '789'),
(4, 'Ana Pereira', 'ana@email.com', 2, 'Salvador', 'Barra', 'Avenida D', '101'),
(5, 'Pedro Souza', 'pedro@email.com', null, 'Brasília', 'Asa Sul', 'Quadra E', '202');

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from cliente;

select i.* from cliente as c 
	join cliente as i
		on i.cliente_id = c.fk_cliente_indicador;
-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
select * from cliente 
	join venda 
		on cliente_id = fk_cliente;
			

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
select * from cliente 
	join venda 
		on cliente_id = fk_cliente
        where nome = 'joão silva';

-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.

select * from cliente as c
	join cliente as i
		on i.cliente_id = c.fk_cliente_indicador;
        

-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado
-- cliente indicador (informar o nome do cliente que indicou na consulta).

select * from cliente as c
	join cliente as i
		on i.cliente_id = c.fk_cliente_indicador
		where i.nome = 'joao silva';
        
-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.
select * from cliente as c
	join cliente as i
		on i.cliente_id = c.fk_cliente_indicador
	join venda 
		on i.cliente_id = fk_cliente
	join nota_fiscal
		on venda_id = fk_venda;

-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
select data_venda, p.nome, quantidade_produto from venda
	join nota_fiscal
		on venda_id = fk_venda
	join produto as p
		on p.produto_id = fk_produto;

-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.

insert into cliente values
(6, 'João Pedro', 'joao@email.com', null, 'São Paulo', 'Vila Mariana', 'Rua A', '14');

select * from cliente 
	left join venda 
		on cliente_id = fk_cliente;