-- pratica 11
create database exercicio11;
use exercicio11;

create table departamento(
idDepto int primary key,
nomeDepto varchar(45),
fkGerente int,
dataInicioGer date);

create table funcionario(
idFunc int not null,
fkDepto int not null,
primary key(idFunc, fkDepto),
fkSuper int,
nomeFunc varchar(30),
salarioFunc int,
sexoFunc varchar(15),
dataNascFunc date,
constraint fkDeptoFunc
	foreign key funcionario(fkDepto) 
		references departamento(idDepto));

create table projeto(
idProj int,
fkDepto int,
primary key(idProj, fkDepto),
nomeProj varchar(45),
localProj varchar(45),
constraint fkDeptoProj
	foreign key projeto(fkDepto) 
		references departamento(idDepto));

create table funcProj (
fkFunc int,
fkProj int,
primary key(fkFunc, fkProj),
horas dec(3,1),
constraint fkFuncProjFuncionario
	foreign key funcProj(fkFunc)
		references funcionario(idFunc),
constraint fkFuncProjProjeto
	foreign key projeto(fkProj)
		references projeto(idProj));

insert into departamento(idDepto, nomeDepto, fkGerente, dataInicioGer) values
(105, 'Pesquisa', 2, '2008-05-22'),
(104, 'Administração', 7, '2015-01-01'),
(101, 'Matriz', 8, '2001-06-19');

insert into funcionario (idFunc, nomeFunc, salariofunc, sexofunc, fkSuper, dataNascFunc, fkDepto) values
(1,'Joao Silva', 3500, 'm', 2, '1985-01-09', 105),
(2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105),
(3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104),
(4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
(5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
(6, 'Joice Leite', 2500, 'f', 1,'1992-07-31', 105),
(7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104),
(8,'Juliano Brito', 5500, 'm', NULL, '1957-11-10', 101);

insert into projeto (idProj, nomeProj, localProj, fkDepto) values
(1, 'Produto X', 'Santo André', 105),
(2, 'Produto Y', 'Itu', 105),
(3, 'Produto Z', 'São Paulo', 105),
(10,'Informatização', 'Mauá', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Benefícios', 'Mauá', 104);

insert into funcProj (fkFunc, fkProj, horas) values
(1, 1, 32.5),
(1, 2, 7.5),
(5, 3, 40.0),
(6, 1, 20.0),
(6, 2, 20.0),
(2, 2, 10.0),
(2, 3, 10.0),
(2, 10, 10.0),
(2, 20, 10.0),
(3, 30, 30.0),
(3, 10, 10.0),
(7, 10, 35.0),
(7, 30, 5.0),
(4, 30,20.0),
(4, 20, 15.0),
(8, 20, NULL);

select * from departamento;
select * from funcionario;
select * from projeto;
select * from funcProj;

 -- Inserir mais o seguinte funcionário na tabela Funcionario:
insert into funcionario (idFunc, nomeFunc, salarioFunc, sexoFunc, fkSuper, dataNascFunc, fkDepto)values
(9,'Cecília Ribeiro', 2800, 'f', null, '1980-04-05', 104);


-- Conseguiu inserir? Por que?
-- Sim, porém tive de inserir o idFunc manualmente pois não tem 'auto_increment' 
-- e o id não pode ser nulo.

-- Inserir mais o seguinte funcionário na tabela Funcionario:
insert into funcionario  (idFunc, nomeFunc, salarioFunc, sexoFunc, fkSuper, dataNascFunc, fkDepto) values
(3, 'Alice Sousa', 2800, 'f',  4, '1980-04-05', 104);

-- Conseguiu inserir? Por que?
-- Não, porque o id '3' já existe e não pode ser inseridos dois id's iguais.
-- O que deve ser feito é um update para alterar o salario e a data de nascimento.

UPDATE funcionario SET salarioFunc = '2800', dataNascFunc = '1980-04-05' WHERE (idFunc = '3');

-- Inserir mais o seguinte funcionário na tabela Funcionario:
insert into funcionario (idFunc, nomeFunc, salarioFunc, sexoFunc, fkSuper, dataNascFunc, fkDepto) values
(9, 'Cecília Ribeiro', 2800,  'f', 4, '1980-04-05', 107);

-- Conseguiu inserir? Por que?
-- Não. Pois a constraint fkDeptoFunc não permitiu a 'fkDepto' referenciar a um idDepto inexistente

--  Inserir mais o seguinte funcionário na tabela Funcionario:

insert into funcionario (idFunc, nomeFunc, salarioFunc, sexoFunc, fkSuper, dataNascFunc, fkDepto) values
(9, 'Cecília Ribeiro', '2800', 'f', 4, '1980-04-05', 104);

-- Conseguiu inserir? Por que?
-- Não, pois o id 9 combinado com a fkDepto '104' já existe.

alter table departamento add constraint fkGerenteFuncionario
	foreign key departamento(fkGerente)
		references Funcionario(idFunc);

alter table funcionario add constraint fkFuncSupervisor
	foreign key funcionario(fkSuper)
		references funcionario(idFunc);


 -- Excluir a tupla (registro) da tabela FuncProj, em que fkFunc=3 e fkProj = 10. 
 
 delete from funcProj where fkfunc = 3 and fkproj = 10;
 
  -- Conseguiu excluir? Por que?
-- Sim, pois a tupla não está sendo referenciada em nenhuma outra tabela.
  
  
  -- Excluir a tupla da tabela Funcionario, em que idFunc=4. 
	delete from funcionario where idFunc=4;
    -- Conseguiu excluir? Por que?
-- Não, pois a tabela está sendo referenciada na constraint fkFuncProjFuncionario

-- Excluir a tupla da tabela Funcionário, em que idFunc=2.
 delete from  funcionario where idFunc=2;
	-- Conseguiu excluir? Por que?
 -- Não, pois a tabela está sendo referenciada na constraint fkFuncProjFuncionario
 
-- Alterar o salário do Funcionário com idFunc=3 para 2800
update funcionario set salarioFunc = 2800 where idFunc = 3;
	-- Conseguiu alterar? Por que?
-- Sim, pois o comando update é aceito pelas constraint

-- Alterar o fkDepto do Funcionário com idFunc=3 para 101
update funcionario set fkDepto = 101 where idFunc = 3;
	-- Conseguiu alterar? Por que?
-- Sim, pois o comando update é aceito pelas 

 -- Alterar o fkDepto do Funcionário com idFunc=3 para 107. 
	update funcionario set fkDepto = 107 where idFunc = 3;
    -- Conseguiu alterar? Por que?
-- Nãom pois não existe o idDepto 107 e a fkDepto referencia a esta coluna.
    
-- Exibir a data de nascimento e o salário do funcionário João Silva.
select dataNascFunc as 'Data de nascimento',
salarioFunc as 'Salário' 
from funcionario
where nomeFunc = 'João Silva';

-- Exibir uma lista apenas dos salários de todos os funcionários.
select salarioFunc as 'Salários' 
from funcionario;


-- Exibir uma lista apenas dos salários distintos de todos os funcionários.
select distinct(salarioFunc) as 'Salários distintos'
from funcionario;

--  Exibir os dados dos funcionários ordenados pelo nome.
select * from funcionario order by nomeFunc;

-- Exibir os dados dos funcionários ordenados pelo salário, de forma decrescente.
select * from funcionario order by salarioFunc desc;

-- Exibir os dados dos funcionários que tenham salário entre 2000 e 4000.
select * from funcionario where salarioFunc>2000 and salarioFunc<4000;

-- Exibir os nomes e os salários dos funcionários cujos nomes começam com a letra ‘J’.
select nomeFunc as 'Nomes',
salarioFunc as 'Salários' 
from funcionario 
	where nomeFunc like 'j%';
    
-- Exibir os nomes e os salários dos funcionários cujos nomes terminam com a letra ‘a’.
select nomeFunc as 'Nomes',
salarioFunc as 'Salários' 
from funcionario 
	where nomeFunc like '%a';
    
-- Exibir os nomes dos funcionários que tem a letra ‘n’ como terceira letra do nome.
select nomeFunc as 'Nomes'
from funcionario 
	where nomeFunc like '__n%';

-- Exibir os nomes e as datas de nascimento dos funcionários cujos nomes tenham a letra ‘S’ como 5ª letra de trás para frente.
select nomeFunc as 'Nomes',
dataNascFunc as 'Data de nascimento' 
from funcionario 
	where nomeFunc like '%s____';
    
-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa.
select * from funcionario where fkDepto = 105;

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa e que tenham salário acima de 3500.
select * from funcionario where fkDepto = 105 and salarioFunc>3500;

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa e que tenham o nome com inicial ‘J’.
select * from funcionario where fkDepto = 105 and nomeFunc like 'J%';

-- Exibir o idFunc e o nome de cada funcionário, juntamente com o idFunc e o nome do seu supervisor. 
-- Faça com que o título da coluna seja “idFuncionario” para funcionário e “idSupervisor” para o id do supervisor.
	select f.idFunc as 'IdFuncionario',
    f.nomeFunc as 'Nome funcionario',
    s.idFunc as 'idSupervisor',
    s.nomeFunc as 'Nome Supervisor'
		from funcionario as f
			join funcionario as s
				on f.idFunc = s.fkSuper;
    
-- Exibir para cada projeto localizado em São Paulo, o idProj do projeto, o número do departamento que o controla, 
-- o nome e a data de nascimento do gerente do departamento.
select P.idProj as 'Id projeto',
P.fkDepto as 'Número departamento',
F.nomefunc as 'Nome gerente',
F.dataNascFunc as 'Nascimento Gerente'
from projeto as P
	join departamento as D
		on P.fkDepto = D.idDepto
	join funcionario as F
		on F.idFunc= D.fkGerente
where localProj = 'São Paulo';

-- Exibir o idFunc e o nome do funcionário, o projeto e o nome do projeto em que trabalha, e a quantidade de horas que trabalha nesse projeto.
select idFunc as 'id Funcionario',
nomeFunc as 'nome Funcionario',
nomeProj as 'nome Projeto',
horas from funcionario 
	join funcProj
		on funcionario.idFunc = funcProj.fkFunc
	join projeto 
		on funcProj.fkProj = projeto.idProj;

-- Exibir os nomes dos funcionários que nasceram antes de 1980.
select nomeFunc as 'Nome funcionario' from funcionario
	where dataNascFunc < '1980-01-01';
    
-- Exibir a quantidade de salários diferentes que existem na empresa.
select count(distinct salarioFunc) as 'qtd Salários diferentes'
 from funcionario;

-- Exibir a quantidade de locais diferentes de projeto.
select count(distinct localProj) as 'qtd Locais diferentes'
	from projeto;

-- Exibir o salário médio da empresa e a soma dos salários.
 select avg(salarioFunc) as 'Média salarial'
	from funcionario;
 
-- Exibir o menor e o maior salário da empresa.
select min(salarioFunc) as 'Menor salário',
 max(salarioFunc) as 'Maior salário'
	from funcionario;

-- Exibir o idDepto, o salário médio e a soma do salário de cada departamento (agrupado por departamento)
select fkDepto as 'id do departamento', 
avg(salarioFunc) as 'Média salarial',
sum(salarioFunc) as 'Soma dos salários' 
from funcionario 
	group by fkDepto;

-- Exibir o idDepto, o menor e o maior salário de cada departamento (agrupado por departamento).
select fkDepto as 'id do departamento', 
min(salarioFunc) as 'Menor salario',
max(salarioFunc) as 'Maior salário' 
from funcionario 
	group by fkDepto;
    
insert into funcionario ( idFunc, nomeFunc, salarioFunc, sexoFunc, fkSuper, dataNascFunc, fkDepto) values
(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', 101),
(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', 104);

insert into departamento ( idDepto, nomeDepto, fkGerente, dataInicioGer) values
(110, 'RH', 3, '2018-11-10');
