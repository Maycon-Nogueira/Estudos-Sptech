create database pratica_09;
use pratica_09;

create table grupo(
idGrupo int primary key auto_increment,
nomeGrupo varchar(45),
descGrupo varchar(100));

create table aluno(
raAluno char(8) primary key,
fkGrupo int,
nomeAluno varchar(45),
emailAluno varchar(80),
constraint fkAlunoGrupo foreign key
	aluno(fkGrupo) references grupo(idGrupo));
    
create table professor(
idProf int primary key auto_increment,
nomeProf varchar(45),
discProf varchar(45)
) auto_increment = 10000;

create table avaliacao(
idAval int auto_increment,
fkGrupo int,
fkProf int,
primary key(idAval,fkGrupo,fkProf),
dataAval datetime,
notaAval decimal(10,2),
constraint fkAvalGrupo foreign key
avaliacao(fkGrupo) references grupo(idGrupo),
constraint fkAvalProf foreign key
avaliacao(fkProf) references professor(idProf)
) auto_increment = 300;

insert into grupo (nomeGrupo, descGrupo) values
('Lumus Save', 'Gerenciamento de energia através da economia de energia'),
('Ar coffe','Cuiados em armazens de sacas de café para diminuição de perdas');

insert into aluno (raAluno, fkGrupo, nomeAluno, emailAluno) values
('01232060', '1', 'Maycon Nogueira', 'maycon@sptech'),
('01232008', '1', 'Julia Damacena', 'julia@sptech'),
('01232097', '1', 'Isabela Rosa', 'isabela@sptech'),
('01232942', '2','Julia Hikari', 'hikari@sptech'),
('01232900', '2','Davi Lima','davi@sptech'),
('01232991', '2', 'Patrick Oliveira','patrick@sptech');	

insert into professor (nomeProf, discProf) values
('Fernando Brandão', 'Projeto e Inovação'),
('Julia Lima', 'Projeto e inovação');

insert into avaliacao( fkGrupo, fkProf, dataAval, notaAval)values 
('1','10000', '2023-10-25 11:30:00', '8.5'),
('1','10001','2023-10-25 11:35:00','9.1'),
('2','10000','2023-11-01 13:20:06', '9.5'),
('2','10001','2023-11-01 13:15:00', '9.8');


select * from grupo;
select * from aluno;
select * from professor;
select * from avaliacao;

select nomeGrupo as 'Grupo',
descGrupo as 'Descrição',
raAluno as 'RA',
nomeAluno as 'Aluno',
emailAluno as 'Email'
from grupo join aluno
on grupo.idGrupo = aluno.fkGrupo;

select nomeGrupo as 'Grupo',
descGrupo as 'Descrição',
raAluno as 'RA',
nomeAluno as 'Aluno',
emailAluno as 'Email'
from grupo join aluno
on grupo.idGrupo = aluno.fkGrupo
where idGrupo = '2';

select nomeGrupo as 'Grupo',
 avg(notaAval) as 'Média'
	from avaliacao
    join grupo on
    grupo.idGrupo = avaliacao.fkGrupo 
    group by nomeGrupo;
 
select nomeGrupo as 'Grupo',
 min(notaAval) as 'Nota Mínima',
 max(notaAval) as 'Nota Maxíma'
 from avaliacao
 join grupo on
 grupo.idGrupo = avaliacao.fkGrupo
 group by nomeGrupo;
 
 select nomeGrupo as 'Grupo',
 sum(notaAval) as 'Soma das notas'
 from avaliacao
 join grupo on
 grupo.idGrupo = avaliacao.fkGrupo
 group by nomeGrupo;
 
 select G.nomeGrupo as 'Grupo',
 G.descGrupo as 'Descrição',
 A.dataAval as 'Data',
 P.nomeProf as 'Professor',
 P.discProf as 'Disciplina'
 from grupo as G
 join avaliacao as A
 on G.idGrupo = A.fkGrupo
 join professor as P
 on A.fkProf = P.idProf;
 
 select G.nomeGrupo as 'Grupo',
 G.descGrupo as 'Descrição',
 A.dataAval as 'Data',
 P.nomeProf as 'Professor',
 P.discProf as 'Disciplina'
 from grupo as G
 join avaliacao as A
 on G.idGrupo = A.fkGrupo
 join professor as P
 on A.fkProf = P.idProf
 where G.idGrupo = '1';
 
 select G.nomeGrupo as 'Grupo',
 G.descGrupo as 'Descrição',
 A.dataAval as 'Data',
 P.nomeProf as 'Professor',
 P.discProf as 'Disciplina'
 from grupo as G
 join avaliacao as A
 on G.idGrupo = A.fkGrupo
 join professor as P
 on A.fkProf = P.idProf
 where p.nomeProf = 'Julia Lima';
 
 select G.nomeGrupo as 'Grupo',
 G.descGrupo as 'Descrição',
 Al.raAluno as 'RA',
 Al.nomeAluno as 'Aluno',
 Al.emailAluno as'email',
 Av.dataAval as 'Data',
 P.nomeProf as 'Professor',
 P.discProf as 'Disciplina'
 from grupo as G
 join aluno as Al
 on G.idGrupo = Al.fkGrupo
 join avaliacao as Av
 on G.idGrupo = Al.fkGrupo
 join professor as P
 on Av.fkProf = P.idProf;
 
 select distinct (notaAval) as 'Notas Distintas'
 from avaliacao;
 
 select nomeProf as 'Nome do professor',
 avg(notaAval) as 'Média das notas',
 sum(notaAval) as 'Soma das notas'
 from professor join avaliacao
 on professor.idProf = avaliacao.fkProf
 group by nomeProf;
 
 select nomeGrupo as 'Grupo',
 avg(notaAval) as 'Média das notas',
 sum(notaAval) as 'Soma das notas'
 from grupo join avaliacao
 on grupo.idGrupo = avaliacao.fkGrupo
 group by nomeGrupo;
 
 select nomeProf as 'Nome do professor',
 min(notaAval) as 'Menor nota',
 max(notaAval) as 'Maior nota'
 from professor join avaliacao
 on professor.idProf = avaliacao.fkProf
 group by nomeProf;
 
 select nomeGrupo as 'Grupo',
 min(notaAval) as 'Menor nota',
 max(notaAval) as 'Maior nota'
 from grupo join avaliacao
 on idGrupo = fkGrupo
 group by nomeGrupo;