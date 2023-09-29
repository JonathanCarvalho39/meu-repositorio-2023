create database teste;

use sprint2;

show tables;


create table supervisor (
id_super int primary key auto_increment,
nome varchar (45));

insert into supervisor values 
(null, 'José'),
(null, 'Alberto');


create table estagiario (
id_espagiario int primary key auto_increment,
nome varchar(45)) auto_increment = 1000;

insert into estagiario values
	(null, 'Murilo', 1),
    (null, 'Marcio', 2),
    (null, 'Fernando', 1);
    
alter table estagiario add column fk_super int;

alter table estagiario add constraint fkSuper
	foreign key (fk_super)
		references supervisor (id_super);
        

select * from estagiario;

select * from supervisor;

select e.nome as Estagiario, s.nome as Supervisor
	from supervisor as s
		join estagiario as e
			on id_super = fk_super;
	





