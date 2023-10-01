-- Pratica 2 -Ex. 1

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
update Atletas set qtdMedalha = 101 where idAtleta = '1';
update Atletas set qtdMedalha = 35 where idAtleta = '2';
update Atletas set qtdMedalha = 89 where idAtleta = '3';
update Atletas set nome = 'Pietro' where idAtleta = '4';

alter table Atletas ADD column dtNasc date;
update Atletas set dtNasc = '2001-09-23' where idAtleta = '1';
update Atletas set dtNasc = '2004-07-03' where idAtleta = '2';
update Atletas set dtNasc = '1987-04-04' where idAtleta = '3';
update Atletas set dtNasc = '1999-09-09' where idAtleta = '4';
update Atletas set dtNasc = '2002-12-25' where idAtleta = '5';
update Atletas set dtNasc = '2005-10-23' where idAtleta = '6';

delete from Atletas where idAtleta = '5';
select * from Atletas where modalidade <> 'nado sincronizado';
select * from Atletas where qtdMedalha >= '3';
alter table Atletas modify column modalidade varchar (60);
desc Atletas;
truncate Atletas;

-- Ex 2

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

select * from Musica;
alter table Musica add column curtidas int;
update Musica set curtidas = 960000 where idMusica = '1';
update Musica set curtidas = 1000000 where idMusica = '2';
update Musica set curtidas = 6000000 where idMusica = '3';
update Musica set curtidas = 3000000 where idMusica = '4';
update Musica set curtidas = 1370599 where idMusica = '5';
update Musica set curtidas = 499870 where idMusica = '6';
update Musica set curtidas =  2980780 where idMusica = '7';
update Musica set curtidas = 770900 where idMusica = '8';
update Musica set curtidas = 890500 where idMusica = '9';

alter table musica modify column titulo varchar(80);
update Musica set curtidas = 5000000 where idMusica = '1';
update Musica set curtidas = 10005007 where idMusica in (2,3);
update Musica set Titulo = 'Pais e filhos' where idMusica = '5';
delete from Musica where idMusica = '4';

Select * from Musica where Genero <> 'funk';
Select * from Musica where Curtidas > 20;
describe Musica;
truncate Musica;

-- ex 3

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

Select * from Filme;
alter table Filme add column Protagonista varchar (50);

update Filme set Protagonista = 'Joe' where idfilme =  '10';
update Filme set Protagonista = 'tchala' where idfilme = '20';
update Filme set Protagonista = 'Michael B Jordan' where idfilme ='30';
update Filme set protagonista = 'antonio' where idfilme = '40';
update Filme set protagonista = 'Roque' where idfilme = '50';
update Filme set protagonista = 'Bruno' where idfilme = '60';
update Filme set protagonista = 'Nanisca' where idfilme = '70';
update Filme set protagonista = 'Ron Stallworth' where idfilme = '80';
update Filme set Protagonista ='OJ ' where idfilme = '90';

alter table Filme modify column diretor Varchar (150);
update Filme set diretor ='Furtado, jorge' where idFilme = '50';
update Filme set diretor = 'Desconhecido' where idfilme in (2,7);

-- ex 4

--

Use Sprint1;
Create table Professor(
IdProfessor int primary key auto_increment,
Nome varchar(50),
especialidade varchar (40),
dtNasc date) auto_increment = 100;

Insert into Professor values
(1,'Alex Adão','Matematica','1967-06-04'),
(2,'Priscila Vereno','História','1983-02-19'),
(3,'Leonardo Leão','Matematica','1990-12-21'),
(4,'Michael Jackson','Canto','1958-08-29'),
(5,'Natanael Silva','Geografia','2001-09-01'),
(6,'Thiago Borges','Portugues','1970-07-25'),
(7,'Célia Maria','Humanidade','1979-08-01');

select * from professor;

alter table professor add column  funcao varchar(50);
alter table professor add constraint restrifuncao check (funcao in('monitor', 'assistente', 'titular'));

update professor set funcao = 'monitor' where idProfessor = '1';
update professor set funcao = 'monitor' where idProfessor = '3';
update professor set funcao = 'monitor' where idProfessor = '5';

update professor set funcao = 'titular' where idProfessor =  '4';
update professor set funcao = 'titular' where idProfessor = '7';

update professor set funcao = 'assistente' where idProfessor = '2';
update professor set funcao = 'assistente' where idProfessor = '6';


insert into professor values
(8,'Anna Nogueira','biologia', '2002-08-24','titular');

delete from professor where idProfessor = '5';
select * from professor where funcao = 'titular';
select especialidade,dtNasc from professor where funcao = 'monitor';
update professor set dtNasc = '1945-04-19' where idProfessor = '3';

truncate professor;

-- ex 5
use sprint1;
Create table Curso(
IdCurso int primary key,
Nome varchar(50),
Sigla Varchar(3),
Coordenador varchar (40));

Insert into Curso values
(101,'Educação Física','Fef','Maycon'),
(102,'Analise e desenvolvimento de Sistemas','Ads','Gustavo'),
(103,'Psicologia','FPP','Nogueira');

Select * from Curso;
select Coordenador from Curso;
Select * from Curso where Sigla = 'fef';
Select * from Curso order by Nome;
Select * from Curso order by Coordenador desc;
Select * from Curso where nome like 'P%';
Select * from Curso where nome like '%A';
Select * from Curso where nome like '_n%';
Select * from Curso where nome like '%A_';

drop table Curso;

-- ex 6
Use sprint1;
Create Table Revistas(
idRevista int primary key auto_increment,
nome varchar(40),
categoria varchar(30));

Insert into Revistas values
(Null,'Veja',null),
(Null,'Folha',null),
(Null,'Estadão',null),
(Null,'Gazeta',null);

Select * From Revistas;
update Revistas set categoria = 'Jornalismo' where idRevista = 1;
update Revistas set categoria = 'Atualidades' where idRevista = 2;
update Revistas set categoria = 'Noticias' where idRevista = 3;
update Revistas set categoria = 'entretenimento' where idRevista = 4;
Select * from Revistas;

insert into Revistas values
(null,'Vogue','moda'),
(null,'Forbes','Finanças'),
(null,'info','tecnologia'); 
Select * From Revistas;

Desc Revistas;
alter table Revistas modify column categoria varchar (40);
Desc Revistas;

alter table Revistas add column periodicidade varchar(15);
Select * from Revistas;
alter table Revistas drop column periodicidade; 