create database sprint2;
use sprint2;

create table Atleta(
idAtleta int primary key,
nome varchar(40),
modalidade varchar (40),
qtdMedalha int);


insert into Atleta values
(1,'Maycon','Handebol',98),
(2,'Julia','Ginastica artistica',0),
(3,'Kelvin','jiu jitsu',39),
(4,'Andrei','jiu jitsu',39),
(5,'Kely','Ginastica artistica',12),
(6,'Luka','Handebol',32);

Create table Pais(
idPais int primary key auto_increment,
nome varchar (30),
capital varchar (40));


insert into Pais values
(null,'Japão','Tóquio'),
(null,'Brasil','Brasilia'),
(null,'Estados Unidos','Washington dc'),
(null,'Bolívia','La paz');

alter table atleta add column FKidpais int;

Alter table Atleta ADD constraint fkPais foreign key (FKidPais) references Pais(idPais);

select * from Pais join Atleta	
on pais.idPais = Atleta.fkidPais;

SELECT Atleta.nome,
	Pais.nome
    FROM Atleta JOIN Pais
	ON idPais = fkidPais;
    
SELECT Atleta.nome, Pais.nome
    FROM Pais JOIN Atleta
	ON idPais = fkidPais
    WHERE pais.Capital = 'Tóquio';
    
    ---------------------------
    -- ex 2:
use sprint2;
create table Musica (
IdMusica int auto_increment primary key,
Titulo varchar(40),
Artista varchar(40),
Genero varchar(40));

Insert into Musica values
(null,'Te Amo Disgraça','Baco Exu do Blues','Rap Br'),
(null, 'Lucifer', 'Jay-z','Hip Hop'),
(null, 'Work', 'Rihanna', 'POP'),
(null, 'Heart Of the city','Jay-z','Hip Hop'),
(null, '999', 'Baco Exu do Blues', 'Rap Br');

create table Album(
 idAlbum int auto_increment primary key,
 nome varchar(40),
 tipo varchar(30), 
dtLancamento DATE) auto_increment=100;

insert into album values
(null, 'Esú','digital','2017-09-04'),
(null, 'the black album','físico','2003-09-23'),
(null,'Single','digital','2016-01-27'),
(null, 'the blue print','físico','2001-09-11'),
(null,'Single','digital','2016-07-30');

select * from musica;
select * from album;

alter table Musica add column FKalbum int;
alter table Musica ADD CONSTRAINT fkalb FOREIGN KEY (fkAlbum) REFERENCES Album(idAlbum);

SELECT * FROM Musica JOIN Album
	ON idAlbum = fkalbum;

SELECT Musica.Titulo,
	Album.nome
    FROM Album JOIN Musica
	ON idAlbum = fkalbum;
    
SELECT Musica.Titulo, Album.nome
    FROM Album JOIN Musica
	ON idAlbum = fkAlbum
    WHERE Musica.Genero = 'Rap Br';





