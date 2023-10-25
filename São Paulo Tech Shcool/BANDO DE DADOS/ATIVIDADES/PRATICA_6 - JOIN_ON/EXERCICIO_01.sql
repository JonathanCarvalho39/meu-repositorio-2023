use sprint2;

create table projeto (
    projeto_id int primary key auto_increment,
    nome_projeto varchar (45),
    descricao varchar (45));

-- Inserir mais dados na tabela 'projeto'
insert into projeto (nome, descricao) values
('Projeto de Energias Renováveis', 'fontes de energia sustentável'),
('Desenvolvimento de Plataforma', 'Criação de uma plataforma online'),
('Projeto de Arte Urbana', 'Arte em espaços urbanos');

select * from projeto;
    
create table aluno (
     RA char(8) primary key,
     nome_aluno varchar (45),
	 telefone char (12),
     fk_representante char(8),
     fk_projeto int);
     
insert into aluno (ra, nome, telefone, fk_representante, fk_projeto) values
('01234568', 'Lucas Santos', '111222333', null, 1),
('01235679', 'Isabela Silva', '999888777', '01234568', 1),
('01236780', 'Rafael Lima', '333555777', '01234568', 1),
('01237891', 'Juliana Costa', '777888999', null, 2),
('01238901', 'Gabriel Oliveira', '444555666', '01237891', 2),
('01239012', 'Amanda Pereira', '666777888', '01237891', 2),
('01234576', 'Luciana Santos', '777888999', null, 3),
('01234577', 'Gustavo Silva', '444555666', '01234576', 3),
('01234578', 'Carla Pereira', '666777888', '01234576', 3);

select *from aluno order by fk_projeto asc;

     

alter table aluno add constraint fkRepresentante
	foreign key (fk_representante)
		references aluno (ra);
        
alter table aluno add constraint fkProjeto
	foreign key (fk_projeto)
		references projeto (projeto_id);
        
create table acompanhante (
	acompanhante_id int,
    ra char (8),
    primary key (acompanhante_id, fk_aluno),
    nome_acompanhante varchar (45),
    tipo_relacao varchar (45)) auto_increment = 100;
    
-- Inserir dados na tabela 'acompanhante'
-- Inserir dados fictícios na tabela 'acompanhante'
insert into acompanhante (ra, nome, tipo_relacao) values
('01234568', 'Carlos Santos', 'Pai'),
('01235679', 'Fernanda Silva', 'Mãe'),
('01236780', 'Rodrigo Lima', 'Pai'),
('01237891', 'Mariana Costa', 'Tia'),
('01238901', 'Antônio Oliveira', 'Pai'),
('01239012', 'Cristina Pereira', 'Irmã'),
('01234576', 'Miguel Santos', 'Pai'),
('01234577', 'Isabel Pereira', 'Namorada'),
('01234578', 'Pedro Pereira', 'Pai');

select * from acompanhante;
 
alter table acompanhante add constraint fkAcompanhante
	foreign key (ra)
		references aluno (ra);
        
-- Exibir os dados dos alunos e dos projetos correspondentes.
select * from
	aluno join projeto 
		on projeto_id = fk_projeto;
        
-- Exibir os dados dos alunos e dos seus acompanhantes.
select * from 
	aluno join acompanhante
		on ra = fk_aluno;
        
-- Exibir os dados dos alunos e dos seus representantes.
select * from 
	aluno as a left join aluno as r
		on r.ra = a.fk_representante;

-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente
-- de um determinado projeto (indicar o nome do projeto na consulta).
select aluno.*, projeto.nome as NOME_PROJETO from
	aluno join projeto
		on projeto_id = fk_projeto;
        
        
-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus
-- acompanhantes
select * from 
	aluno join projeto
		on projeto_id = fk_projeto
			join acompanhante
				on ra = fk_aluno;
                

    
        

  