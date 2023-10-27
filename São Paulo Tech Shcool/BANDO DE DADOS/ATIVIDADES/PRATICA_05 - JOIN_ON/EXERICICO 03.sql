create database PraticaFuncionario;

use PraticaFuncionario;
 

create table setor (
	setor_id int primary key auto_increment,
    nome_setor varchar (45),
    numero_andar varchar(10));
    
insert into setor (nome_setor, numero_andar) values
	('Metalurgica', '2'),
    ('Desenvolvimento', 3),
    ('RH', 5),
    ('Comtabil', 1);
    
    select * from setor;
    
    
create table funcionario (
	funcionario_id int primary key auto_increment,
    nome varchar (45),
    telefone char(11),
    salario decimal(10),
    fk_setor int) auto_increment = 100;
    
insert into funcionario (nome, telefone, salario, fk_setor) values
	('Pedro', '1111111111', 2500, 4),
    ('Julia', '1111111111', 5000, 3),
    ('Felipe', '1111111111', 5000, 3),
    ('Fernanda', '1111111111', 1800, 1),
    ('Henrrique', '11111111111', 3000, 4);
    
select * from funcionario;
    
alter table funcionario add constraint chkSalario
	check(salario > 0);
    
alter table funcionario add constraint fkSetor
	foreign key (fk_setor)
		references setor(setor_id);
        
        
create table acompanhante (
	acompanhante_id int, 
    fk_funcionario int,
    primary key (acompanhante_id, fk_funcionario),
    nome varchar(45),
    parentesco varchar(45),
    data_nasc date);
    
insert into acompanhante (acompanhante_id, fk_funcionario, nome, parentesco, data_nasc) values
    (1, 100, 'Maria Silva', 'Cônjuge', '1980-05-15'),
    (2, 101, 'João Oliveira', 'Filho', '2005-10-22'),
    (3, 102, 'Ana Souza', 'Cônjuge', '1985-02-10'),
    (4, 103, 'Pedro Santos', 'Filho', '2010-08-08'),
    (5, 104, 'Mariana Lima', 'Cônjuge', '1975-12-03');
    
describe acompanhante;
    
select * from acompanhante;
    
alter table acompanhante add constraint fkFuncionario
	foreign key (fk_funcionario)
		references funcionario(funcionario_id);

-- Exibindo o funcionario e seu setor
select * from setor join funcionario
	on setor_id = fk_setor;
 
-- Exibir os dados de um determinado setor (informar o nome do setor na
-- consulta) e dos seus respectivos funcionários.
select * from
	setor as s join funcionario as f
		on setor_id = fk_setor
			where setor_id = 4;
        
-- exibindo dados do funcionario e seus acompanhantes 
select * from funcionario join acompanhante
	on funcionario_id = fk_funcionario;
    
-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes
select * from
	funcionario as f join acompanhante as a
		on funcionario_id = fk_funcionario
			where f.nome = 'pedro';

-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes. 
select * from 
	funcionario join setor
		on  fk_setor = setor_id
			join acompanhante
				on funcionario_id = fk_funcionario;
                
                select * from funcionario;
                select * from setor;
    

        

        

    
        

    

