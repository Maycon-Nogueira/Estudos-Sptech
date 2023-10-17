-- prática 07
Create database pratica_7;
use pratica_7;

create table projeto(
idProjeto int  primary key auto_increment,
nomeProjeto varchar(45),
descricaoProjeto varchar(150)
);

create table aluno(
raAluno int auto_increment,
nomeAluno varchar(45),
telAluno char(13),
fkProjeto int, constraint fkProjetoAluno 
foreign key (fkProjeto) references projeto(idProjeto),
fkRepresentante int, constraint fkAlunoRepresentante
foreign key (fkRepresentante) references aluno(raAluno),
primary key(raAluno,fkProjeto,fkRepresentante)
) auto_increment=50;

create table acompanhante(
idAcompanhante int auto_increment,
nomeAcompanhante varchar(45),
relacao varchar(20),
fkAluno int, constraint fkAcompanhanteAluno 
foreign key(fkAluno) references Aluno(raAluno),
primary key (idAcompanhante,fkAluno)) auto_increment=100;


insert into projeto(nomeProjeto,descricaoProjeto) values 
('Lumus sense', 'Economia nos gastos relacionados as contas de energia'),
('Ar Coffe', 'Cuidados com armazens de café'),
('safeVax','Gerenciamento na temperatura de vacinas');

insert into aluno(nomeAluno, telAluno, fkProjeto, fkRepresentante) values
('Maycon Nogueira','11978025643', 2, 50),
('Guilherme Martins','11967576509', 3, 50),
('Isabela Rosa','11939704128', 1, 50),
('Julya Lopes','13980548979', 1, 50),
('Julia Damacena','15971897160', 3, 50);

insert into acompanhante (nomeAcompanhante, relacao, fkAluno) values
('Anna Castro','Cônjuge', 50),
('Celia Maria','Mãe', 50),
('Matheus Rosa','Irmão', 52),
('Priscila Lopes','Mãe', 53),
('Pedro Loureiro','primo', 54);

select * from projeto;
select * from aluno;
select * from acompanhante;

select p.nomeProjeto as Projeto, 
p.descricaoProjeto as Descrição,
A.nomeAluno as Aluno,
A.telAluno as Telefone
from projeto as P join aluno as A
on p.idProjeto = A.fkProjeto;

select A.nomeAluno as Aluno,
A.telAluno as Telefone,
Acomp.nomeAcompanhante as Acompanhante,
Acomp.relacao as Relação
from aluno as A join acompanhante as Acomp
on A.raAluno = Acomp.fkAluno;

select Alunos.nomeAluno as Aluno,
Alunos.telAluno,
Representante.nomeAluno as Representante,
Representante.telAluno as Telefone 
from aluno as Alunos join aluno as Representante
on  alunos.fkRepresentante = Representante.raAluno;

select P.nomeProjeto as Projeto,
P.descricaoProjeto as Descrição,
A.nomeAluno as Aluno,
telAluno as Telefone
from projeto as P
join Aluno as A
on P.idProjeto = A.fkProjeto
where  P.nomeProjeto = 'Lumus sense';

select nomeProjeto as Projeto,
P.descricaoProjeto as Descrição,
A.nomeAluno as Aluno,
A.telAluno as Telefone,
Acomp.nomeAcompanhante as Acompanhante,
Acomp.relacao as Relação
from projeto as P join Aluno as A
on P.idProjeto = A.fkProjeto
join acompanhante as Acomp
on A.raAluno = Acomp.fkAluno; 
 
-- --------------------------------
-- Ex 2

create database Campanha;
use Campanha;

create table organizador (
idOrganizador int primary key auto_increment,
nomeOrganizador varchar(45),
enderecoOrganizador varchar(60),
bairroOrganizador varchar(30),
emailOrganizador varchar(60)
) auto_increment=30;

create table campanha(
idCampanha int auto_increment,
fkOrganizador int,
primary key(idCampanha,fkOrganizador),
categoriaCampanha varchar(45),
instituicaoCampanha varchar(45),
finalCampanha date,
constraint fkOrganizadorCampanha foreign key (fkOrganizador)
references organizador(idOrganizador)
) auto_increment=500;

insert into organizador(nomeOrganizador, enderecoOrganizador,
 bairroOrganizador, emailOrganizador) values
( 'Maycon Nogueira', 'Rua Frei Claude', 'João XXIII', 'maycon.nogueira@sptech.school'),
('Anna Nogueira', 'Rua conselheiro moreira', 'Santana', 'anna.beatriz@sptech.school'),
( 'Pedro Moraes', 'Av. Rio branco', 'Paulo VI', 'pedro.moraes@sptech.school'),
( 'Aline Aparecida', 'Rua general padroeiro', 'Jardim São Jorge', 'Aline.aparecida@sptech.school'),
( 'Mary kley', 'Av. pinheiros menores', 'Jaqueline', 'mary.kley@sptech.school'),
( 'Gabriel Anterio', 'Rua lapa baixa', 'Pinheiros', 'gabriel.anterio@sptech.school'),
( 'Gustavo Carneiro', 'Comendador pereira filho', 'Peri', 'gustavo.carneiro@sptech.school'),
( 'Alex Castro', 'Rua Sapetuba', 'Jardim Taboão', 'alexcastrogh@outlook.com.br');

insert into campanha(fkOrganizador, categoriaCampanha, 
instituicaoCampanha, finalCampanha) values
(31,'Alimentos','fome 0','2023-12-12'),
(31,'Roupas','AACD','2023-01-11'),
(33,'dinheiro','Green peace','2025-06-07'),
(34,'Cestas basicas','acidentados tragédia x','2024-01-10'),
(35,'Alimentos','Indigenas refugiados','2023-10-18'),
(36,'Roupas','MST','2023-08-01');

alter table organizador add column fkOrganizadorExp int;

alter table organizador add constraint organizadorExperiente
foreign key(fkOrganizadorExp)
references organizador(idOrganizador);

UPDATE organizador SET fkOrganizadorExp = '37' WHERE (idOrganizador = '30');
UPDATE organizador SET fkOrganizadorExp = '30' WHERE (idOrganizador = '31');
UPDATE organizador SET fkOrganizadorExp = '37' WHERE (idOrganizador = '32');
UPDATE organizador SET fkOrganizadorExp = '37' WHERE (idOrganizador = '33');
UPDATE organizador SET fkOrganizadorExp = '37' WHERE (idOrganizador = '34');
UPDATE organizador SET fkOrganizadorExp = '30' WHERE (idOrganizador = '35');
UPDATE organizador SET fkOrganizadorExp = '30' WHERE (idOrganizador = '36');


select * from organizador;
select * from campanha;

select organizador.nomeOrganizador as Organizador, 
organizador.enderecoOrganizador as Endereço,
organizador.bairroOrganizador as Bairro,
organizador.emailOrganizador as Email,
campanha.categoriaCampanha as Categoria,
campanha.instituicaoCampanha as Instituição,
campanha.finalCampanha as Finalização
from organizador join campanha
on organizador.idOrganizador = campanha.fkOrganizador;

select organizador.nomeOrganizador as Organizador, 
organizador.enderecoOrganizador as Endereço,
organizador.bairroOrganizador as Bairro,
organizador.emailOrganizador as Email,
campanha.categoriaCampanha as Categoria,
campanha.instituicaoCampanha as Instituição,
campanha.finalCampanha as Finalização
from organizador join campanha
on organizador.idorganizador = campanha.fkOrganizador
where (nomeOrganizador = 'Anna Nogueira');

select novato.nomeOrganizador as 'Organizador novato', 
novato.enderecoOrganizador as Endereço,
novato.bairroOrganizador as Bairro,
novato.emailOrganizador as Email,
experiente.nomeOrganizador as 'Organizador experiente', 
experiente.enderecoOrganizador as Endereço,
experiente.bairroOrganizador as Bairro,
experiente.emailOrganizador as Email
from organizador as novato 
join organizador as experiente
on experiente.idOrganizador = novato.fkOrganizadorExp;

select novato.nomeOrganizador as 'Organizador novato', 
novato.enderecoOrganizador as Endereço,
novato.bairroOrganizador as Bairro,
novato.emailOrganizador as Email,
experiente.nomeOrganizador as 'Organizador experiente', 
experiente.enderecoOrganizador as Endereço,
experiente.bairroOrganizador as Bairro,
experiente.emailOrganizador as Email
from organizador as novato
join organizador as experiente
on experiente.idOrganizador = novato.fkOrganizadorExp
where (experiente.nomeOrganizador = 'Alex castro');

select novato.nomeOrganizador as 'Organizador novato', 
novato.enderecoOrganizador as Endereço,
novato.bairroOrganizador as Bairro,
novato.emailOrganizador as Email,
c.categoriaCampanha as Categoria,
c.instituicaoCampanha as Instituição,
c.finalCampanha as Finalização,
experiente.nomeOrganizador as 'Organizador experiente', 
experiente.enderecoOrganizador as Endereço,
experiente.bairroOrganizador as Bairro,
experiente.emailOrganizador as Email
from organizador as novato
join campanha as c
on novato.idOrganizador = c.fkOrganizador
join organizador as experiente
on experiente.idOrganizador = novato.fkOrganizadorExp;

select novato.nomeOrganizador as 'Organizador novato', 
novato.enderecoOrganizador as Endereço,
novato.bairroOrganizador as Bairro,
novato.emailOrganizador as Email,
c.categoriaCampanha as Categoria,
c.instituicaoCampanha as Instituição,
c.finalCampanha as Finalização,
experiente.nomeOrganizador as 'Organizador experiente', 
experiente.enderecoOrganizador as Endereço,
experiente.bairroOrganizador as Bairro,
experiente.emailOrganizador as Email
from organizador as novato
join campanha as C
on novato.idOrganizador = C.fkOrganizador
join organizador as experiente
on experiente.idOrganizador = novato.fkOrganizadorExp
where (novato.nomeOrganizador = 'Mary Kley');