use sprint1;

create table Professor(
idProfessor int primary key auto_increment,
Nome varchar(50),
Sobrenome varchar(30),
Especialidade1 varchar(40),
Especialidade2 varchar(40));


insert into professor values
(null,'Maycon','Nogueira','Banco de dados','gastronomia'),
(null, 'Caio','pinheiro', 'Algoritmos','Java'),
(null,'Thiago','Oliveira','Socioemocional','Recursos Humanos'),
(null,'Eduardo','gomes','Arquitetura Computacional','inteligencia artificial'),
(null, 'Monica','Herrero','Tecnologia da informação','gestão de empresas'),
(null,'Fernando','Brandão','Pesquisa e inovação','gestão de negócios');

create table Disciplinas (
idDisc int primary key auto_increment,
nomeDisc varchar (45));

insert into Disciplinas values
(null, 'Algoritmos'),
(null, 'Banco de Dados'),
(null, 'Tecnologia da informação');

alter table professor add column fkdisc int;

alter table professor add foreign key (fkdisc) references disciplinas(idDisc);

update professor set fkdisc = '1' where idprofessor = '2';
update professor set fkdisc = '2' where idprofessor = '1';
update professor set fkdisc = '3' where idprofessor = '5';

select * from professor join Disciplinas 
on Disciplinas.iddisc = professor.fkdisc; 

select professor.nome, Disciplinas.nomeDisc from professor join Disciplinas 
on Disciplinas.iddisc = professor.fkdisc;

select P.*,D.nomedisc from professor as P join Disciplinas as D 
on D.idDisc = P.fkDisc where sobrenome = 'Nogueira';

Select p.especialidade1,d.nomeDisc from professor as p join Disciplinas as D
on D.idDisc = p.fkDisc 
where Nome = 'Monica' order by especialidade1;

---------------------------------------------------------------------------------
-- EX 2
use sprint2;
create table Curso(
idCurso int primary key auto_increment,
NomeCurso varchar(50),
Sigla char(3),
Coordenador varchar(40));

insert into Curso values
(null,'Analise e Desenvolvimento de Sistemas','ADS','Gerson'),
(null,'Sistemas da Informação','SIS','Alex'),
(null,'Ciência da computação','CCO','Marise');

create table Professor(
idProfessor int primary key auto_increment,
Nome varchar(50),
Sobrenome varchar(30),
Especialidade varchar(40));


insert into professor values
(null,'Maycon','Nogueira','Banco de dados'),
(null, 'Caio','Pinheiro', 'Algoritmos'),
(null,'Thiago','Oliveira','Socioemocional'),
(null,'Eduardo','Gomes','Arquitetura Computacional'),
(null, 'Monica','Herrero','Tecnologia da informação'),
(null,'Fernando','Brandão','Pesquisa e inovação');

alter table professor add column Fkcurso int;

alter table professor add constraint foreign key fkCursoProf (fkcurso) 
references Curso(idcurso);

UPDATE `professor` SET `Fkcurso` = '1' WHERE (`idProfessor` = '1');
UPDATE `professor` SET `Fkcurso` = '1' WHERE (`idProfessor` = '2');
UPDATE `professor` SET `Fkcurso` = '3' WHERE (`idProfessor` = '3');
UPDATE `professor` SET `Fkcurso` = '1' WHERE (`idProfessor` = '4');
UPDATE `professor` SET `Fkcurso` = '2' WHERE (`idProfessor` = '5');
UPDATE `professor` SET `Fkcurso` = '2' WHERE (`idProfessor` = '6');

Select * from Curso join Professor
on Professor.fkcurso = Curso.idCurso;

Select P.Nome, P.especialidade, C.Sigla from professor as P join Curso as C
on P.fkcurso = C.idCurso where p.Sobrenome like '%A';

alter table Curso add column qtdSemestres int;
alter table Curso add constraint duracao 
Check (qtdSemestres = '4' or qtdSemestres = '8');
