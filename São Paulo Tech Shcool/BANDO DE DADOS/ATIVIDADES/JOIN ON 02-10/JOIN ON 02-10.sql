use sprint2;

create table pessoa (
id_pessoa int primary key auto_increment,
nome varchar (50),
cpf char (11),
dt_nasc date,
fk_mae int);

alter table pessoa add constraint fkMae
	foreign key (fk_mae)
		references pessoa (id_pessoa);
        
desc pessoa;

insert into pessoa (nome, cpf, dt_nasc)values 
	('Luis', '00000000000', '2015-05-24'),
    ('Maria', '00000000000', '1970-07-21'),
    ('Marta', '00000000000', '2012-08-15'),
    ('Antonia', '00000000000', '1950-02-27');
    
    select * from pessoa;
    
    update pessoa set fk_mae = 2
		where id_pessoa in (1,3);
        
	update pessoa set fk_mae = 4
		where id_pessoa = 2;
        
        
    select filho.nome as NOME_FILHO, mae.nome as NOME_MAE from
					pessoa as filho join pessoa as mae 
							on mae.id_pessoa = filho.fk_mae;
                            
create table aluno (
	ra char(8) primary key,
    nome varchar (50),
    fk_monitor int);
    
alter table aluno modify column fk_monitor char(8);

alter table aluno add constraint fkMonitor
	foreign key (fk_monitor)
		references aluno (ra);

desc aluno;

insert into aluno values 
('01232039', 'Jonathan Carvalho', null),
('01232044', 'Felipe', null),
('01232049', 'Julia', null),
('01232456', 'Leo', null);

select * from aluno;

update aluno set fk_monitor = '01232456' 
	where ra = '01232039';
    
update aluno set fk_monitor = '01232456'
	where ra = '01232049';
    
update aluno set fk_monitor = '01232456'
	where ra = '01232044';
    
select monitor.nome as NOME_MONITOR,
			aluno.nome as NOME_ALUNO
				from aluno join aluno as monitor
					on monitor.ra = aluno.fk_monitor;
                    

        