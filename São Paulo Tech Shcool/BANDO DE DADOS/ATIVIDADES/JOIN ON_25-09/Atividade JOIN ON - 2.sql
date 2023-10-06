use sprint2;

-- CRIANDO A TABELA PROFESSOR
create table professor(
id_professor int primary key auto_increment,
nome varchar (45),
sobrenome varchar(30),
especialidade varchar(40),
especialidade2 varchar (40));

-- CRIANDO A TABELA DISCIPLINA
create table disciplina (
id_disc int primary key auto_increment,
nome_disc varchar (45),
fk_professor int) auto_increment = 100;

-- DEFININDO A FK
alter table disciplina add constraint fkProfessor
	foreign key (fk_professor)
		references professor (id_professor);

-- INSERINDO DADOS 
insert into disciplina values 
	(null, 'Banco de dados',1),
    (null, 'Algoritimos',2),
    (null, 'TI',3),
    (null, 'Banco de dados',5),
    (null, 'Algoritimos',4),
    (null, 'TI',6);
    

select * from disciplina;
		
-- INSERINDO DADOS        
insert into professor values 
	(null, 'Vivian', 'Silva', 'Cientista de dados', null),
    (null, 'João Paulo', 'Ferreira', 'Front end', 'Back And'),
    (null, 'Monica', 'Freire', 'Documentação', 'Gestão de projetos'),
    (null, 'Caio', 'Silva', 'Front end', null),
    (null, 'Leo', 'Carvalho', 'Cientista de dados', null),
    (null, 'Petri', null, 'Metodologias', null);
        
desc professor;

select * from professor;

-- EXIBINDO A TABELA PROFESSOR E E SUA DISCIPLINA
select * from professor as p
			join disciplina as d
				on id_professor = fk_professor;

-- EXIBINDO O PROFESSOR E SUA DISCPLINA            
select d.nome_disc as DISCIPLINA, p.nome as PROFESSOR
	from professor as p
		join disciplina as d
			on id_professor = fk_professor;


-- EXIBINDO O PROFESSOR QUE TEM O SOBRENOME SILVA E SUA DISCIPLINA            
select * from professor join disciplina 
		on id_professor = fk_professor
			where sobrenome = 'silva';

-- EXIBINDO A ESPECIALIDADE E A DISCIPLINA DO PROFESSOR COM O ID 1 
select p.especialidade as ESPECIALIDADE, d.nome_disc as DISCIPLINA
	from professor as p join disciplina as d 
		on id_professor = fk_professor
			where id_professor = 1
				order by especialidade asc;
                
                
create table curso (
id_curso int primary key auto_increment,
nome varchar (50),
sigla char (3),
coodenador varchar (45),
fk_aluno int);

alter table curso add constraint chkSigla
	check (sigla in ('ADS', 'CCO', 'SIS'));
    
select * from curso; 
   
create table aluno (
ra char(8) primary key,
nome varchar (45),
idade varchar(3),
email varchar(100));

alter table aluno add constraint fkCurso
	foreign key (fk_curso)
		references curso (id_curso);
        
select * from aluno;

insert into curso(nome, sigla, coodenador, fk_aluno) values 
('Analise e Desenvolvimento de sistemas', 'ADS', 'Gerson', 01232087),
('Ciências da Computação', 'CCO', 'Marise Miranda', 01232190),
('Sistemas da informação', 'SIS', 'Alex Barreira', 01232452);

insert into aluno (ra, nome, idade, email) values
('01232087', 'Pedro', 21, 'pedro@gmail.com'),
('01232190', 'Sabrina', 19, 'sabrina@gmail.com'), 
('01232452', 'Julio', 24, 'Julio@gmail.com');

insert into aluno (ra, nome, idade, email) values
('01232567', 'Mariana', 20, 'mariana@gmail.com'),
('01232789', 'Lucas', 22, 'lucas@gmail.com'), 
('01232901', 'Ana', 18, 'ana@gmail.com');


select * from aluno;

select * from aluno join curso
	on fk_aluno = ra;
    
select a.nome as ALUNO, c.sigla as CURSO from
	aluno as a join curso as c
		on fk_aluno = ra;
        
select a.nome as ALUNO, a.idade as IDADE, c.nome as CURSO from
	aluno as a join curso as c
		on fk_aluno = ra
        where ra = '01232087';
        
select a.nome as ALUNO, a.email as EMAIL, c.nome as CURSO, c.sigla as SIGLA from
	aluno as a join curso as c
		on fk_aluno = ra
        where sigla = 'ADS';
	
