-- Aula 9
-- tipos de atributos:
-- Atributo simples - por exemplo: genero
-- atributo composto - deve ser dividido em subpartes
-- por exemplo: endereço(cep,numero,bairro)
-- atributo monovalorado - apenas um valor
-- atributo multivalorado - muitos valores
 -- por exemplo - telefoneCelular e telefone Fixo
 -- atibuto identificador - chave primária
 -- atributo derivado - idade
 
 -- Tipos de entidades
 -- entidade fraca - chave primaria simples
 -- entidade forte - chave primaria composta
 
 -- tipos de relacionamentos
 -- relacionamento forte - entre duas entidades fortes
 -- relacionamento fraco - pelo menos uma entidade fraca
 -- relacionamento recursivo - 1 tabela se relaciona com ela mesma
 
 -- criar o banco de dados
 create database convenio;
 use convenio;
 
 create table funcionario (
 idfunc int primary key auto_increment,
 nome varchar(45), -- + sobrenome = atributo composto
 sobrenome varchar(45),
 emailP varchar(45), -- + emailS = atributo multivalorado
 emailS varchar(45),
 fkSuper int, constraint fkSupervisor foreign key
 (fKSuper) references funcionario(idFunc));
 
 insert into funcionario(nome, emailP) values
 ('Garoto', 'garoto@choc.com');
 
 insert into funcionario(nome,emailP,fkSuper) values
 ('Lindt', 'lindt@choc.com', 1),
 ('Cacau Show', 'cacaushow@choc.com', 1),
 ('Toblerone','toblerone@choc.com', 2);
 
 select * from funcionario;
 
 -- exibir os funcionarios e seus respectivos supervisores
 select f.nome as nomeFunc,
 s.nome as nomeSuper
 from funcionario as f
 join funcionario as s
 on f.fkSuper = s.idFunc;
 
 select funcionario.nome as Funcionario,
 supervisor.nome as Supervisor
 from funcionario
 join funcionario as supervisor
 on funcionario.fkSuper = Supervisor.idfunc;
 
 create table dependente (
 idDep int,
 fkFunc int,
 primary key (idDep, Fkfunc),
 nome varchar(45),
 parentesco varchar(45),
 dtNasc date, -- idade é um atributo derivado de dtNasc
 constraint	fkFuncDep foreign key(fkFunc)
	references Funcionario(idFunc));
    
insert into dependente values
(1,1,'lacta','irmão','2000-10-10'),
(2,1,'chokito','Primo', '2000-10-11'),
(1,2,'lolo','Pai','1950-10-12'),
(1,3,'Prestigio','mãe','1958-10-12');

select * from dependente;

select f.nome as Funcionario,
s.nome as Supervisor,
d.nome as Dependente
from funcionario as f
join funcionario as s
on f.fkSuper = s.idFunc
join dependente as d
on f.idFunc = d.fkFunc;

select * from funcionario left join dependente
	on idFunc = fkFunc;
    
    select * from dependente right join funcionario
	on idFunc = fkFunc;
    
    select nome, timestampdiff(year,dtNasc,now()) as idade
     from dependente;
     
         select nome, timestampdiff(day,dtNasc,now()) as idade
     from dependente;
     
         select nome, timestampdiff(week,dtNasc,now()) as idade
     from dependente;
     
         select nome, timestampdiff(month,dtNasc,now()) as idade
     from dependente;
     
         select nome, timestampdiff(second,dtNasc,now()) as idade
     from dependente;