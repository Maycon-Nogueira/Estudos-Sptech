-- Pratica 1 -Ex. 1

Create database sprint1;
Use sprint1;
create table Atletas(
idAtleta int primary key,
nome varchar(40),
modalidade varchar (40),
qtdMedalha int
);

insert into Atletas values
(1, 'Maycon', 'Handebol', 76),
(2, 'Luka', 'Maratona', 16),
(3, 'Pedro', '100 metros rasos', 58),
(4, 'Vitor', 'Nado sincronizado', 31),
(5, 'Marcio', 'Basquetebol', 95),
(6, 'Carlos','futebol', 4);

Select * from Atletas;
Select nome,qtdMedalha from Atletas;
Select * from Atletas where modalidade = 'futebol';
Select * from Atletas order by qtdMedalha desc;
Select * from atletas where nome like '%s%';
Select * from Atletas where nome like 'm%';
Select * from Atletas where nome like '%O';
Select * from Atletas where nome like'%R_';
Drop table Atletas;

-- Ex. 2
Use sprint1;
create table Musica (
IdMusica int primary key,
Titulo varchar(40),
Artista varchar(40),
Genero varchar(40));

Insert into Musica values
(1,'Te Amo Disgraça','Baco Exu do Blues','Rap Br'),
(2, 'Lucifer', 'Jay-z','Hip Hop'),
(3, 'Work', 'Rihanna', 'POP'),
(4, 'Heart Of the city','Jay-z','Hip Hop'),
(5, 'Faroeste caboblo', 'Legião Urbana','MPB'),
(6, 'To de pé', 'Maneva', 'Raggae'),
(7, 'Fuego','Alok','eletonica'),
(8, '999', 'Baco Exu do Blues', 'Rap Br'),
(9, 'Sincerely', 'Stephen','Rock alternativo');

Select * from Musica;
Select * from Musica where Genero = 'POP';
Select * from Musica where Artista = 'Baco Exu do Blues';
Select * from Musica order by Titulo;
Select * from Musica order by Artista desc;
Select * from Musica where Titulo like 'f%';
Select * from Musica where Artista like '%a';
Select * from Musica where Genero like '_i%';
Select * from Musica where Titulo like'%e_';

Drop table Musica; -- :(

-- Ex. 3
Use sprint1;
Create table Filme(
Idfilme int primary key,
Titulo varchar (50),
genero varchar(40),
Diretor Varchar(40));

Insert into Filme values
(10,'Soul','Animação','Pete docter'),
(20,'Black panther','Ficção Cientifica','Ryan Coogler'),
(30,'Creed','Luta','Ryan Coogler'),
(40,'Medida provisória','Ficção cientifica','lazaro ramos'),
(50,'ó pai ó','Comédia','jorge furtado'),
(60,'O menino de pijama listrado','Drama','Mark Herman'),
(70,'A mulher Rei','Ação','Gina Prince-Bythewood'),
(80,'Infiltado na Klan','Crime','Spike Lee'),
(90,'Nope','Ficção Cientifica','Jordan Peele');

Select * From Filme;
Select Titulo,Diretor From Filme;
Select * From Filme where genero = 'Ficção Cientifica';
Select * From Filme where diretor = 'Ryan Coogler';
Select * From Filme order by Titulo;
Select * From Filme order by Diretor desc;
Select * From Filme Where Titulo like 'B%';
Select * From Filme where Diretor like '%e';
Select * From Filme Where Genero like '_o%';
Select * From Filme where Titulo like '%e_';
drop table Filme;

-- Ex 4
Use Sprint1;
Create table Professor(
IdProfessor int primary key,
Nome varchar(50),
especialidade varchar (40),
dtNasc date);

Insert into Professor values
(1,'Alex Adão','Matematica','1967-06-04'),
(2,'Priscila Vereno','História','1983-02-19'),
(3,'Leonardo Leão','Matematica','1990-12-21'),
(4,'Michael Jackson','Canto','1958-08-29'),
(5,'Natanael Silva','Geografia','2001-09-01'),
(6,'Thiago Borges','Portugues','1970-07-25'),
(7,'Célia Maria','Humanidade','1979-08-01');

Select * From Professor;
Select especialidade from Professor;
Select * From Professor where especialidade = 'Canto';
Select * From professor order by nome;
Select * From Professor order by dtNasc desc;
Select * From Professor where Nome like 'L%';
Select * From Professor where Nome Like '%A';
Select * From Professor where Nome Like '_H%';
Select * From Professor where Nome Like '%I_';
Drop table Professor;

-- Ex 5
Use Sprint1;
Create table Curso(
IdCurso int primary key,
Nome varchar(50),
Sigla Varchar(3),
Coordenador varchar (40));

Insert into Curso values
(101,'Educação Física','Fef','Maycon'),
(102,'Analise e desenvolvimento de Sistemas','Ads','Gustavo'),
(103,'Psicologia','FPP','Nogueira');

Select * From Curso;
Select Coordenador From Curso;
Select * From Curso where Sigla = 'Fef';
Select * From curso order by nome;
Select * From curso order by Coordenador desc;
Select * From curso where nome like 'A%';
Select * From curso where nome like '%A';
Select * From curso Where nome like '_N%';
Select * From curso Where nome like '%i_';
Drop table Curso;

-- Ex 6
Use Sprint1;
Create Table Revistas(
idRevista int primary key auto_increment,
nome varchar(40),
categoria varchar(30));

Insert into Revistas values
(1,'Veja',null),
(Null,'Folha',null),
(Null,'Estadão',null),
(Null,'Gazeta',null);

Select * From Revistas;
update Revistas set categoria = 'fofocas' where idRevista = 1;
update Revistas set categoria = 'Atualidades' where idRevista = 2;
update Revistas set categoria = 'Localidade' where idRevista = 3;
update Revistas set categoria = 'Polemicas' where idRevista = 4;
Select * from Revistas;

insert into Revistas values
(null,'epoca','Politica'),
(null,'Globo','Atualidades'),
(null,'R7','Fofocas'); 
Select * From Revistas;

desc Revistas;
alter table Revistas modify column categoria varchar(40);
desc Revistas;
alter table Revistas add column Periodiocidade varchar(15);
Select * from Revistas;
alter table Revistas drop column periodicidade;
Drop database Sprint1;