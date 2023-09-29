use sprint2;




create table professor(
id_professor int primary key auto_increment,
nome varchar (45),
sobrenome varchar(30),
especialidade varchar(40),
especialidade2 varchar (40),
fk_disciplina int);


create table disciplina (
id_disc int primary key auto_increment,
nome_disc varchar (45)) auto_increment = 100;

alter table professor add constraint fkDisciplina
	foreign key (fk_disciplina)
		references disciplina (id_disc);
        
insert into disciplina values 
	(null, 'Bando de dados'),
    (null, 'Algoritimos'),
    (null, 'TI');
    
    
select * from disciplina;
		
        
insert into professor values 
	(null, 'Vivian', 'Silva', 'Cientista de dados', null, 100),
    (null, 'João Paulo', 'Ferreira', 'Front end', 'Back And', 101),
    (null, 'Monica', 'Freire', 'Documentação', 'Gestão de projetos', 102),
    (null, 'Caio', 'Silva', 'Front end', null, 101),
    (null, 'Leo', 'Carvalho', 'Cientista de dados', null, 100),
    (null, 'Petri', null, 'Metodologias', null, 102);
        
desc professor;

select * from professor;

select * from professor as p
			join disciplina as d
				on id_disc = fk_disciplina;
            
select d.nome_disc as DISCIPLINA, p.nome as PROFESSOR
	from professor as p
		join disciplina as d
			on id_disc = fk_disciplina;
            
select * from professor join disciplina 
	on id_disc = fk_disciplina
		where sobrenome = 'silva';
        
select p.especialidade as ESPECIALIDADE, d.nome_disc as DISCIPLINA
	from professor as p join disciplina as d 
		on id_disc = fk_disciplina
			where id_professor = 1
				order by especialidade asc;
                
                
create table curso (
id_curso int primary key auto_increment,
nome varchar (50),
sigla char (3),
coodenador varchar (45));

alter table curso add constraint chkSigla
	check (sigla in ('ADS', 'CCO', 'SIS'));
    
    
create table aluno (
ra char(8) primary key,
nome varchar (45),
idade varchar(3),
email varchar(100),
fk_curso int) auto_increment = 100;

alter table aluno add constraint fkCurso
	foreign key (fk_curso)
		references curso (id_curso);
        
select * from aluno;

insert into curso(nome, sigla, coodenador) values 
('Analise e Desenvolvimento de sistemas', 'ADS', 'Gerson'),
('Ciências da Computação', 'CCO', 'Marise Miranda'),
('Sistemas da informação', 'SIS', 'Alex Barreira');

insert into aluno (ra, nome, idade, email, fk_curso) values
('01232087', 'Pedro', 21, 'pedro@gmail.com', 1),
('01232190', 'Sabrina', 19, 'sabrina@gmail.com', 2), 
('01232452', 'Julio', 24, 'Julio@gmail.com', 3);

insert into aluno (ra, nome, idade, email, fk_curso) values
('01232567', 'Mariana', 20, 'mariana@gmail.com', 1),
('01232789', 'Lucas', 22, 'lucas@gmail.com', 2), 
('01232901', 'Ana', 18, 'ana@gmail.com', 3);


select * from aluno;

select * from aluno join curso
	on fk_curso = id_curso;
    
select a.nome as ALUNO, c.sigla as CURSO from
	aluno as a join curso as c
		on fk_curso = id_curso;
        
select a.nome as ALUNO, a.idade as IDADE, c.nome as CURSO from
	aluno as a join curso as c
		on fk_curso = id_curso
        where ra = '01232087';
        
select a.nome as ALUNO, a.email as EMAIL, c.nome as CURSO, c.sigla as SIGLA from
	aluno as a join curso as c
		on fk_curso = id_curso
        where sigla = 'ADS';
	
