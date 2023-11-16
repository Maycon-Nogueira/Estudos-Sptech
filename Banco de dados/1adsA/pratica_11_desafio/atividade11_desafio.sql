-- pratica 11
create database exercicio11;
use exercicio11;

create table departamento(
idDepto int primary key,
nomeDepto varchar(45),
dataInicioGer date);

create table funcionario(
idFunc int not null,
fkDepto int not null,
primary key(idFunc, fkDepto),
fkSuper int not null,
nomeFunc varchar(30),
salarioFunc int,
sexoFunc varchar(15),
dataNascFunc date);

create table projeto(
idProj int,
fkDepto int,
primary key(idProj, fkDepto),
nomeProj varchar(45),
localProj varchar(45));

create table funcProj (
fkFunc int,
fkProj int,



