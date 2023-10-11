create database petshop;
use petshop;
create table cliente(
idCliente int primary key auto_increment,
nomeCliente varchar(45),
telCliente char(10),
celCliente char(11),
endereçoCliente varchar(60));

create table pet(
idPet int primary key auto_increment,
nomePet varchar(45),
tipoPet varchar(30),
racaPet varchar(30),
nascPet date
) auto_increment = 100;

insert into cliente values
(null,'Maycon Nogueira',null,'11978025643','Rua Frei Claude'),
(null,'Anna Nogueira',null,'11979778997','Rua conselheiro moreira'),
(null,'Pedro Moraes','1134478621','11987356543','Av. Rio branco'),
(null,'Aline Aparecida',null,'11975435699','Rua general padroeiro'),
(null,'Mary kley','1140028022','11980045635','Av. pinheiros menores'),
(null,'Gabriel Anterio',null,'11974640809','Rua lapa baixa'),
(null,'Gustavo Carneiro',null,'1165754510','Comendador pereira filho');

insert into pet values
(null,'Duque','cachorro','pinscher','2008-07-28'),
(null,'Mel','Gato','branco', '2018-10-15'),
(null,'Cacau','Gato','cinza','2014-05-05'),
(null,'Scooby','Cachorro','labrador','2012-04-30'),
(null,'Soren','Coruja','Coruja-de-igreja','2016-02-05'),
(null,'mini-chef','Rato','azul','2019-09-23'),
(null,'Pipoca','Porquinho da índia','Rato grande','2013-08-28'),
(null,'Fred jason','Gato','Pelado','2019-06-29'),
(null,'Ponkã','Gato','branco','2012-10-11'),
(null,'Rubinho','Cachorro','Doberman','2013-09-19');

select * from cliente;
select * from pet;

alter table pet add column fkcliente int;
alter table pet add constraint fkclientepet foreign key (fkcliente)
references cliente(idCliente);

UPDATE `petshop`.`pet` SET `fkcliente` = '1' WHERE (`idPet` = '120');
UPDATE `petshop`.`pet` SET `fkcliente` = '1' WHERE (`idPet` = '121');
UPDATE `petshop`.`pet` SET `fkcliente` = '2' WHERE (`idPet` = '122');
UPDATE `petshop`.`pet` SET `fkcliente` = '4' WHERE (`idPet` = '123');
UPDATE `petshop`.`pet` SET `fkcliente` = '1' WHERE (`idPet` = '124');
UPDATE `petshop`.`pet` SET `fkcliente` = '5' WHERE (`idPet` = '125');
UPDATE `petshop`.`pet` SET `fkcliente` = '6' WHERE (`idPet` = '126');
UPDATE `petshop`.`pet` SET `fkcliente` = '7' WHERE (`idPet` = '127');
UPDATE `petshop`.`pet` SET `fkcliente` = '5' WHERE (`idPet` = '128');
UPDATE `petshop`.`pet` SET `fkcliente` = '7' WHERE (`idPet` = '129');

alter table cliente modify column nomeCliente varchar(30);

select * from pet where tipoPet = 'Gato';
select nomePet,nascPet from pet;
select * from pet order by nomePet;
select * from cliente order by endereçoCliente desc;
select * from pet where nomePet like 'M%';
select * from cliente where nomeCliente like '%Nogueira';

UPDATE `petshop`.`cliente` SET `telCliente` = '1768892104' WHERE (`idCliente` = '1');

select * from cliente;

select * from cliente join pet
on fkcliente = idCliente;

select * from cliente join pet
on fkcliente = idCliente
where nomeCliente = 'Gabriel Anterio';

delete from pet where idPet = 127;
select * from pet;
drop table petshop.cliente, petshop.pet;

-------------------------------------------
-- ex 2

create database financas;
use financas;

create table Pessoa (
idPessoa int primary key auto_increment,
nomePessoa varchar(45),
nascPessoa date,
profissao varchar(45));

create table Gasto (
idGasto int primary key auto_increment,
Data date,
valor int,
descricao varchar(45))
auto_increment = 20;

insert into Pessoa values
(null,'Maycon Nogueira','2001-09-23','Dev'),
(null,'Anna Nogueira','2002-08-24','Nutricionista'),
(null,'Pedro Moraes','2000-01-01','Minerador');

insert into Gasto values
(null,'2023-09-30', 6087.76, 'Computador,placaVideo 3090TI'),
(null,'2023-10-02', 4013.24, 'iphone-13(Apple)'),
(null,'2019-02-15', 100.01, 'Cinemark');

select * from pessoa;
select * from gasto;
select * from gasto where idGasto = '21';
select * from pessoa where nascPessoa like '2%';

alter table gasto add column fkPessoa int;
alter table gasto add constraint fkpessoaGasto foreign key (fkPessoa)
references Pessoa(idPessoa);

UPDATE `financas`.`gasto` SET `fkPessoa` = '1' WHERE (`idGasto` = '20');
UPDATE `financas`.`gasto` SET `fkPessoa` = '2' WHERE (`idGasto` = '21');
UPDATE `financas`.`gasto` SET `fkPessoa` = '3' WHERE (`idGasto` = '22');

Select * from pessoa join gasto
on fkpessoa = idPessoa;

select * from pessoa join gasto
on fkpessoa = idpessoa
where nomePessoa = 'Maycon Nogueira';

UPDATE `financas`.`pessoa` SET `profissao` = 'Arquiteto' WHERE (`idPessoa` = '3');
UPDATE `financas`.`pessoa` SET `nomePessoa` = 'Anna Castro' WHERE (`idPessoa` = '2');
UPDATE `financas`.`pessoa` SET `nomePessoa` = 'Maycon Castro' WHERE (`idPessoa` = '1');

delete from gasto where idGasto = '22';

--------------------------------------------------
-- Ex 3
create database PraticaFuncionario;
use PraticaFuncionario;

create table setor(
idSetor int primary key auto_increment,
nomeSetor varchar(45),
andarSetor int);

create table funcionario (
idFuncionario int primary key auto_increment,
nomeFuncionario varchar(45),
TelFuncionario char(11),
Salario int,
fkSetor int,
constraint salario check (salario>0)) auto_increment = 50;


create table acompanhante ( 
idAcomp int primary key auto_increment,
nomeAcomp varchar(45),
relacao varchar(30),
nascAcomp date,
fkFunc int) auto_increment = 100;

insert into setor values
(null,'Financeiro', 12),
(null,'Recursos Humanos',14),
(null,'Administrativo',13),
(null,'Tecnologia da informação',11);

insert into funcionario values
(null,'Maycon Nogueira','11978025643', 10000, 4),
(null,'Anna Nogueira','11979778997',10000,1),
(null,'Pedro Moraes','1134478621',4500,2),
(null,'Aline Aparecida','11975435699',5000,3),
(null,'Mary kley','11980045635',10000,4),
(null,'Gabriel Anterio','11974640809',8000,3),
(null,'Gustavo Carneiro','1165754510',6000,1),
(null,'Guilherme Carneiro','1165754510',5800,2);

insert into Acompanhante values
(null,'Célia Maria','Mãe','1979-08-01', 50),
(null,'Silvana Castro','Mãe','1970-04-28',51),
(null,'Leonardo Aparecida','Conjugê','1989-03-14',52),
(null,'John Leonard','Irmão','1996-07-04',53),
(null,'Marcelo Martins','Pai','1965-02-27',54);

select * from setor;
select * from Funcionario;
select * from Acompanhante;

alter table Funcionario add constraint fksetorfunc foreign key funcionario(fkSetor) 
references Setor(idSetor);

alter table Acompanhante add constraint fkfuncAcomp foreign key Acompanhante(fkFunc)
references Funcionario(idFuncionario);

select `s`.`nomeSetor`, `s`.`andarSetor`,
`f`.`nomeFuncionario`, `f`.`TelFuncionario`, `f`.`Salario`
from setor as s
join Funcionario as f
on fkSetor = idSetor;

select `s`.`nomeSetor`, `s`.`andarSetor`,
`f`.`nomeFuncionario`, `f`.`TelFuncionario`, `f`.`Salario`
from setor as s
join Funcionario as f
on fkSetor = idSetor 
where nomeSetor = 'Financeiro';

select `f`.`nomeFuncionario`, `f`.`TelFuncionario`, `f`.`Salario`,
`a`.`nomeAcomp`, `a`.`relacao`, `a`.`nascAcomp`
from funcionario as f
join acompanhante as a
on fkFunc = idFuncionario;

select `f`.`nomeFuncionario`, `f`.`TelFuncionario`, `f`.`Salario`,
`a`.`nomeAcomp`, `a`.`relacao`, `a`.`nascAcomp`
from funcionario  as f
join acompanhante as a
on fkFunc = idFuncionario 
where nomeFuncionario = 'Mary Kley';

select `s`.`nomeSetor`, `s`.`andarSetor`,
`f`.`nomeFuncionario`, `f`.`TelFuncionario`, `f`.`Salario`,
`a`.`nomeAcomp`, `a`.`relacao`, `a`.`nascAcomp` 
from Setor as S 
join funcionario as f
on f.FkSetor = S.idSetor
join acompanhante as a
on a.fkFunc = f.idFuncionario;

-------------------------------------------
-- Ex 4
create database Treinador;
use Treinador;

create table Treinador (
idTreinador int primary key auto_increment,
nomeTreinador varchar(45),
telTreinador char (11),
emailTreinador varchar (50));

create table Nadador (
idNadador int primary key auto_increment,
nomeNadador varchar(45),
estadoNadador char(2),
nascNadador date ,
fkTreinador int) auto_increment = 100;

alter table Nadador add constraint fkTreiNadador 
foreign key Nadador(fkTreinador)
references Treinador(idTreinador);
 
 insert into Treinador values
(null,'Maycon Nogueira','11978025643', 'mayconsinogueira@gmail.com'),
(null,'Pedro Moraes','1134478621','Pedrinho@hotmail.com'),
(null,'Aline Aparecida','11975435699','ApAline@hotmail.com'),
(null,'Alex Castro','11986044680','alexcastrogh@outlook.com.br');

insert into Nadador values
(null,'Mary kley','SP','2006-09-09',1),
(null,'Gabriel Anterio','RN','2008-11-19',3),
(null,'Gustavo Carneiro','RJ','2007-12-01',1),
(null,'Guilherme Carneiro','RJ','2006-06-25',2);

select * from Treinador;
select * from Nadador;

select * from Treinador join Nadador
on fkTreinador = idTreinador;

select * from Treinador join Nadador
on fkTreinador = idTreinador
where nomeTreinador = 'Maycon Nogueira';

alter table Treinador add column fkTreinadorExp int;

alter table Treinador add constraint exp foreign key
Treinador(fkTreinadorExp) references Treinador(idTreinador);
select * from Treinador;

UPDATE  `Treinador` SET `fkTreinadorExp` = '4' WHERE (`idTreinador` = '1');
UPDATE  `Treinador` SET `fkTreinadorExp` = '4' WHERE (`idTreinador` = '2');
UPDATE  `Treinador` SET `fkTreinadorExp` = '4' WHERE (`idTreinador` = '3');

select * from Treinador as tAluno join treinador as tProf 
on tProf.idTreinador = tAluno.fkTreinadorExp;

select * from Treinador as tAluno join treinador as tProf
on tProf.idTreinador = tAluno.fkTreinadorExp
where tProf.nomeTreinador = 'Alex Castro';

select * from Treinador as tAluno join Nadador as N
on N.fktreinador = tAluno.idTreinador
join Treinador as tProf 
on tAluno.fkTreinadorExp = tProf.idTreinador;

select * from Treinador as Taluno join Nadador as N
on N.fkTreinador = tAluno.idTreinador
join Treinador as tProf
on tAluno.fkTreinadorExp = tProf.idTreinador
where  tAluno.nomeTreinador = 'Aline Aparecida';

-------------------------------------------
-- EX Desafio pet :

create database petshop;
use petshop;
create table cliente(
idCliente int primary key auto_increment,
nomeCliente varchar(45),
telCliente char(10),
celCliente char(11),
endereçoCliente varchar(60));

create table pet(
idPet int primary key auto_increment,
nomePet varchar(45),
tipoPet varchar(30),
racaPet varchar(30),
nascPet date
) auto_increment = 100;

insert into cliente values
(null,'Maycon Nogueira',null,'11978025643','Rua Frei Claude'),
(null,'Anna Nogueira',null,'11979778997','Rua conselheiro moreira'),
(null,'Pedro Moraes','1134478621','11987356543','Av. Rio branco'),
(null,'Aline Aparecida',null,'11975435699','Rua general padroeiro'),
(null,'Mary kley','1140028022','11980045635','Av. pinheiros menores'),
(null,'Gabriel Anterio',null,'11974640809','Rua lapa baixa'),
(null,'Gustavo Carneiro',null,'1165754510','Comendador pereira filho');

insert into pet values
(null,'Duque','cachorro','pinscher','2008-07-28'),
(null,'Mel','Gato','branco', '2018-10-15'),
(null,'Cacau','Gato','cinza','2014-05-05'),
(null,'Scooby','Cachorro','labrador','2012-04-30'),
(null,'Soren','Coruja','Coruja-de-igreja','2016-02-05'),
(null,'mini-chef','Rato','azul','2019-09-23'),
(null,'Pipoca','Porquinho da índia','Rato grande','2013-08-28'),
(null,'Fred jason','Gato','Pelado','2019-06-29'),
(null,'Ponkã','Gato','branco','2012-10-11'),
(null,'Rubinho','Cachorro','Doberman','2013-09-19');

select * from cliente;
select * from pet;

alter table pet add column fkcliente int;
alter table pet add constraint fkclientepet foreign key (fkcliente)
references cliente(idCliente);

UPDATE `petshop`.`pet` SET `fkcliente` = '1' WHERE (`idPet` = '120');
UPDATE `petshop`.`pet` SET `fkcliente` = '1' WHERE (`idPet` = '121');
UPDATE `petshop`.`pet` SET `fkcliente` = '2' WHERE (`idPet` = '122');
UPDATE `petshop`.`pet` SET `fkcliente` = '4' WHERE (`idPet` = '123');
UPDATE `petshop`.`pet` SET `fkcliente` = '1' WHERE (`idPet` = '124');
UPDATE `petshop`.`pet` SET `fkcliente` = '5' WHERE (`idPet` = '125');
UPDATE `petshop`.`pet` SET `fkcliente` = '6' WHERE (`idPet` = '126');
UPDATE `petshop`.`pet` SET `fkcliente` = '7' WHERE (`idPet` = '127');
UPDATE `petshop`.`pet` SET `fkcliente` = '5' WHERE (`idPet` = '128');
UPDATE `petshop`.`pet` SET `fkcliente` = '7' WHERE (`idPet` = '129');

alter table pet add column fkfilhote int;
alter table pet add constraint fkfilho foreign key(fkfilhote)
references pet(idPet);

UPDATE `petshop`.`pet` SET `fkfilhote` = '101' WHERE (`idPet` = '102');
UPDATE `petshop`.`pet` SET `fkfilhote` = '107' WHERE (`idPet` = '108');

Select `pais`.`nomePet`, `pais`.`tipoPet`, `pais`.`racaPet`,`pais`. `nascPet`,
 `filhote`.`nomePet`, `filhote`.`tipoPet`, `filhote`.`racaPet`, `filhote`.`nascPet`
from pet as pais
join pet as filhote 
on filhote.fkfilhote = pais.idpet;
