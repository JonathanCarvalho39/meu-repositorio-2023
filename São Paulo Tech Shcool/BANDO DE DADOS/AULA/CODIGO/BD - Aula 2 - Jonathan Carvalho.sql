-- Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária
-- da tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), 
-- qtdMedalha (int, representando a quantidade de medalhas que o atleta possui)

CREATE TABLE atleta (
idAtleta INT PRIMARY KEY,
nome VARCHAR(40),
modalidade VARCHAR(40),
qntMedalha int
);

-- Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade

INSERT INTO atleta VALUES
(1, 'EDUARDO', 'NATAÇÃO', 1),
(2, 'FERNADNA', 'BASQUETE', 5),
(3, 'FELIPE', 'FUTEBOL', 4),
(4, 'SABRINA', 'VOLEI', 60);


-- Exibir todos os dados da tabela.
SELECT *FROM atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas
SELECT nome, qntmedalha from atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade
SELECT *fROM atleta WHERE modalidade = 'BASQUETE';

-- Exibir os dados da tabela ordenados pela modalidade.
SELECT *FROM atleta ORDER BY modalidade ;

--  Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem 
-- decrescente.
SELECT *FROM atleta ORDER BY qntMedalha DESC;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
SELECT *FROM atleta
	WHERE nome LIKE '%S%';
    
-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra
SELECT *FROM atleta
	WHERE nome LIKE 'F%';
    
-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
SELECT *FROM atleta 
	WHERE nome LIKE '%O';
    
-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
SELECT *FROM atleta
	WHERE nome LIKE '%R_';
    
-- Eliminar a tabela.
DROP TABLE atleta;


-- Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
-- (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.

 CREATE TABLE musica (
 idMusica INT PRIMARY KEY,
 titulo VARCHAR(40),
 artista VARCHAR(40),
 genero VARCHAR(40)
 );

-- Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
-- música, e um artista, que tenha mais de uma música cadastrada.
 INSERT INTO musica VALUES
 (100, 'ATE O SOL QUIS VER', 'ATE O SOL QUIS VER', 'PAGODE'),
 (101, 'VIDA LOKA PARTE 1', 'RACIONAIS', 'RAP'),
 (102, 'DA PONTE PRA CA', 'RACIONAIS', 'RAP'),
 (103, 'QUASE SEM QUERER', 'MARIA GADU', 'MPB');
 
-- Exibir todos os dados da tabela
SELECT *FROM MUSICA;
 
-- Exibir apenas os títulos e os artistas das músicas
SELECT titulo, artista from musica;
 
-- Exibir apenas os dados das músicas de um determinado gênero.
SELECT *fROM musica WHERE genero = 'RAP';
 
-- Exibir apenas os dados das músicas de um determinado artista.
SELECT *fROM musica WHERE artista = 'RACIONAIS';
 
-- Exibir os dados da tabela ordenados pelo título da música.
SELECT *fROM musica ORDER BY titulo;
  
-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente
SELECT *fROM musica ORDER BY artista DESC;
   
-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
SELECT titulo FROM musica
	WHERE titulo LIKE 'V%';
    
-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
SELECT *FROM musica
	WHERE artista LIKE '%S';
    
-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma
-- determinada letra.
SELECT *FROM musica
	WHERE genero LIKE '_A%';
    
-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma
-- determinada letra.
SELECT *FROM musica
	WHERE titulo LIKE '%E_';
    
--  Elimine a tabela.
DROP TABLE musica;


-- Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
-- (tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.

CREATE TABLE filme(
idFilme INT PRIMARY KEY,
titulo VARCHAR(50),
genero VARCHAR(40),
diretor VARCHAR(40));

-- Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
-- filme, e um diretor, que tenha mais de um filme cadastrado.
INSERT INTO filme VALUES
(1000, 'SENHOR DOS ANEIS', 'FANTASIA', 'PETER JACKSON'),
(1001, 'EU SOU A LENDA', 'APOCALIPTICO', 'FRANCIS LAWRENCE'),
(1002, 'GENTE GRANDE', 'COMEDIA', 'DENNIS DUGAN');

-- Exibir todos os dados da tabela
SELECT *FROM filme;

-- Exibir apenas os títulos e os diretores dos filmes.
SELECT titulo, diretor FROM filme;

-- Exibir apenas os dados dos filmes de um determinado gênero.
SELECT *FROM filme WHERE genero = 'FANTASIA';

-- Exibir apenas os dados dos filmes de um determinado diretor.
SELECT *FROM filme WHERE diretor = 'PETER JACKSON';

-- Exibir os dados da tabela ordenados pelo título do filme.
SELECT *FROM filme ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
SELECT *FROM filme ORDER BY diretor DESC;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
SELECT *FROM filme
	WHERE titulo LIKE 'G%';
    
-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
SELECT *FROM filme
	WHERE diretor LIKE '%N';

-- • Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
SELECT *FROM filme
	WHERE genero LIKE '_A%';
    
-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.

SELECT *FROM filme
	WHERE titulo LIKE '%D_';
    
-- Elimine a tabela.
DROP TABLE filme;

-- Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
-- especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da tabela.
CREATE TABLE professor (
idProfessor INT PRIMARY KEY,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNascimento DATE);

-- Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
INSERT INTO professor VALUES 
(10000, 'ROGERIO', 'PORTUGUES', '1995-03-5'),
(10001, 'VIVIAN', 'BANCO DE DADOS', '1893-10-13'),
(10002, 'JOÃO PEDRO', 'ALGORITIMOS', '1999-09-18'),
(10003, 'MARIANA', 'TECNOLOGIA DA INFORMAÇÃO', '1965-12-17');

-- Exibir todos os dados da tabela.
SELECT * FROM professor;

-- Exibir apenas as especialidades dos professores
SELECT especialidade FROM professor;

-- Exibir apenas os dados dos professores de uma determinada especialidade.
SELECT *FROM professor 
	WHERE especialidade = 'BANCO DE DADOS';
    
-- Exibir os dados da tabela ordenados pelo nome do professor.
SELECT *FROM professor ORDER BY nome;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
SELECT *FROM professor ORDER BY dtNascimento DESC;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
SELECT  *FROM professor 
	WHERE nome LIKE 'M%';
    
-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
SELECT *FROM professor 
	WHERE nome LIKE '%N';
    
-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
SELECT *FROM professor 
	WHERE nome LIKE '_I%';
    
-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
SELECT *FROM professor 
	WHERE nome LIKE '%I_';
    
-- Elimine a tabela.
DROP TABLE professor;


-- Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
-- (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
CREATE TABLE curso (
idCurso INT PRIMARY KEY,
nome VARCHAR(50),
sigla CHAR(3),
coodenador VARCHAR(50));

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos.
INSERT INTO curso VALUES
(10, 'ANALISE E DESENVOLVIMENTO DE SISTEMAS', 'ADS', 'GERSON'),
(11, 'CIÊNCIAS DA COMPUTAÇÃO', 'CCO', 'FERNANDO'),
(12, 'SISTEMAS DE INFORMAÇÃO', 'SIS', 'ANDREZA');

-- Exibir todos os dados da tabela.
SELECT *FROM curso;

-- Exibir apenas os coordenadores dos cursos.
SELECT coodenador FROM curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT *FROM curso 
	WHERE sigla = 'ADS';
    
-- Exibir os dados da tabela ordenados pelo nome do curso.
SELECT *FROM curso ORDER BY nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT *FROM curso ORDER BY coodenador DESC;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra
SELECT *FROM curso 
	WHERE nome LIKE 'A%';
    
-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT *FROM curso 
	WHERE nome LIKE '%O';
    
-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT *FROM curso 
	WHERE nome LIKE '_I%';
    
-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra
SELECT *FROM curso 
	WHERE nome LIKE '%Ã_';
    
DROP TABLE curso;

-- Criar a tabela chamada Revista para conter os campos: idRevista (int e chave primária da tabela),
-- nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os valores de idRevista devem iniciar
-- com o valor 1 e ser incrementado automaticamente pelo sistema.
CREATE TABLE revista (
idRevista INT AUTO_INCREMENT,
nome VARCHAR(40), 
categoria VARCHAR(30),
PRIMARY KEY(idRevista)
);
DROP TABLE revista;
-- Inserir 4 registros na tabela, mas sem informar a categoria
INSERT INTO revista (nome, categoria) VALUES 
('VEJA', 'FOFOCA'),
('UOU', 'NOTICIA'),
('VRUM', 'ESPOSTIVO'),
('FOLHA', 'NOTICIA');


-- Exibir todos os dados da tabela.
SELECT *FROM revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela
-- novamente para verificar se atualizou corretamente.
UPDATE revista SET categoria = 'NOTICIA'
	WHERE idRevista = 1;
UPDATE revista SET categoria = 'AUTOMOBILISTICO'
	WHERE idRevista = 3;
UPDATE revista SET categoria = 'FOFOCA'
	WHERE idRevista = 2;
SELECT *FROM revista;

-- Insira mais 3 registros completos.
INSERT INTO revista (nome, categoria) VALUES
('CARAS', 'FOFOCA'),
('FORBES', 'INVESTIMENTOS'),
('GLOSS', 'MODA');

-- Exibir novamente os dados da tabela
SELECT *FROM revista;

-- Exibir a descrição da estrutura da tabela.
DESCRIBE revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE revista MODIFY COLUMN categoria VARCHAR(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
DESCRIBE revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE revista ADD COLUMN periodicidade VARCHAR(15);

-- Exibir os dados da tabela.
SELECT *FROM revista;

-- Excluir a coluna periodicidade da tabela
ALTER TABLE revista DROP COLUMN periodicidade;