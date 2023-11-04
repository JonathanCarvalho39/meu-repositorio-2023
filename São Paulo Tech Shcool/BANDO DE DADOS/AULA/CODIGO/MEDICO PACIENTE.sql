-- Aula 1 Relacionamento N - N


create database consulta ;

use consulta;


create table paciente (
	id_paciente int primary key auto_increment,
    nome varchar (60))auto_increment = 10;
    
    
insert into paciente (nome) values
	('Brian'),
    ('Toreto');
    
select * from paciente;
    
    
create table medico (
	id_medico int primary key auto_increment,
    nome varchar (50),
    salario decimal(10,2)) auto_increment = 100;
    
    
insert into medico (nome, salario) values
	('Mia', 100.99),
    ('Letty', 200.99),
    ('Han', 99.99);
    
select * from medico;
-- Criando tabela associativa 

create table consulta (
	id_consulta int,
    fk_medico int,
    fk_paciente int,
    primary key (id_consulta, fk_medico, fk_paciente),
    dt_consulta datetime);
    
    
alter table consulta add constraint fkMedico
	foreign key (fk_medico)
		references medico (id_medico);
        
alter table consulta add constraint fkPaciente
	foreign key (fk_paciente)
		references paciente (id_paciente);
        
        
insert into consulta values 
	(1, 100, 10, '2023-10-30 12:06:00'),
    (2, 101, 11, '2023-10-30 15:06:00'),
    (3, 102, 10, '2023-10-30 20:06:00');
    
select * from paciente;


select * from 
	paciente join consulta
		on fk_paciente = id_paciente
			join medico
				on fk_medico = id_medico;
		