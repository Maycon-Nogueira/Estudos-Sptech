create database pratica_08;
use pratica_08;

create table cliente(
idCliente int primary key auto_increment,
fkIndicador int,
nomeCliente varchar(45),
emailCliente varchar(90),
enderecoCliente varchar(100),
constraint clienteIndicador foreign key `cliente`(fkIndicador)
 references `cliente`(idCliente));

create table venda (
idVenda int auto_increment,
fkCliente int,
primary key(idVenda, fkCliente),
valorVenda decimal(10,2),
dataVenda datetime,
constraint clienteVenda foreign key `venda`(fkCliente)
 references `cliente`(idCliente)) auto_increment=100;
 
 create table produto (
 idProd int primary key auto_increment,
 nomeProd varchar(45),
 descricoProd varchar(100),
 precoProd decimal(10,2)) auto_increment = 5000;

insert into `cliente`( `nomeCliente`, `emailCliente`, `enderecoCliente`) values
( 'Gabriel', 'gabriel123@sptech','Rua cleito son'),
( 'Vitor', 'vitoo@sptech', 'Rua minus tau'),
( 'Bryan', 'brBryan@sptech', 'Av not bom'),
( 'Maria', 'mariM@sptech',  'Rua nossa sim');

UPDATE `cliente` SET `fkIndicador` = '11' WHERE (`idCliente` = '9');
UPDATE `cliente` SET `fkIndicador` = '11' WHERE (`idCliente` = '10');
UPDATE `cliente` SET `fkIndicador` = '11' WHERE (`idCliente` = '12');

insert into `venda`(`fkCliente`, `valorVenda`, `dataVenda`)values
(9, 600.9,'2023-10-31'),
(9, 110.56, '2023-09-23'),
(10,599.20, '2023-10-31'),
(10, 215.15, '2023-04-03'),
(11, 350.40, '2022-05-18'),
(11, 490.80, '2023-10-30'),
(12, 650.15,'2023-08-20'),
(12, 300.23, '2023-11-04');

insert into `produto`(`nomeProd`, `descricoProd`, `precoProd`) values
('Celulares','celulares marcas diversas', 700.0),
('carregadores','carregadores de bateria para celulares', 120.50),
('Fones de ouvido', 'Fones com e sem fio para uso em aparelhos eletrônicos', 250.75);

create table notaFiscal(
idNota int,
fkVenda int,
fkProd int,
primary key (idNota, fkVenda,fkProd),
qtdProd int,
desconto decimal(10,2),
constraint vendaNota foreign key 
`notaFiscal`(fkVenda) references `venda`(idVenda),
constraint prodNota foreign key
 `notaFiscal`(fkProd) references `produto`(idProd));

insert into notaFiscal(`idNota`, `fkVenda`, `fkProd`, `qtdProd`, `desconto`) values
(300, 100, 5000, 1, 100.10),
(301, 101, 5001, 3, 10.50),
(302, 102, 5000, 2, 102.30),
(303, 103, 5002, 1, 250.4),
(304, 104, 5001, 2, 29.9),
(305, 105, 5002, 1, 25.2),
(306, 106, 5000, 2, 180.4),
(307, 107, 5002, 2, 0.40);


select * from cliente;
select * from venda;
select * from produto;
select * from notaFiscal;

select `venda`.valorVenda as Valor,
`venda`.dataVenda as 'Data',
`cliente`.nomeCliente as Cliente,
 `cliente`.emailCliente as Email,
 `cliente`.enderecoCliente as Endereço
from venda join cliente
on venda.fkCliente = cliente.idCliente;

select `venda`.valorVenda as Valor,
`venda`.dataVenda as 'Data',
`cliente`.nomeCliente as Cliente,
`cliente`.emailCliente as Email,
`cliente`.enderecoCliente as Endereço from venda join cliente
on venda.fkCliente = cliente.idCliente
where cliente.nomeCliente = 'Maria';

select `indicador`.nomeCliente as 'Cliente indicador',
`indicador`.emailCliente as Email,
`indicador`.enderecoCliente as Endereço,
`indicação`.nomeCliente as 'Cliente indicado',
`indicação`.emailCliente as Email,
`indicação`.enderecoCliente as Endereço
 from cliente as indicador 
join cliente as indicação
on indicador.idCliente = indicação.fkIndicador;

select `indicador`.nomeCliente as 'Cliente indicador',
`indicador`.emailCliente as Email,
`indicador`.enderecoCliente as Endereço,
`indicação`.nomeCliente as 'Cliente indicado',
`indicação`.emailCliente as Email,
`indicação`.enderecoCliente as Endereço
from cliente as indicador 
join cliente as indicação
on indicador.idCliente = indicação.fkIndicador
where indicador.nomeCliente = 'bryan';

select `indicador`.nomeCliente as 'Cliente indicador',
`indicador`.emailCliente as Email,
`indicador`.enderecoCliente as Endereço,
`indicação`.nomeCliente as 'Cliente Indicado',
`indicação`.emailCliente as Email,
`indicação`.enderecoCliente as Endereço,
`venda`.valorVenda as Venda,
`venda`.dataVenda as 'Data',
`notaFiscal`.qtdProd as 'Quantidade de produtos',
`produto`.nomeProd as Produto,
`produto`.descricoProd as Descrição,
`produto`.precoProd as Preço
 from cliente as indicador
 join cliente as indicação
on indicador.idCliente = indicação.fkIndicador
join venda
on indicação.idCliente = venda.FkCliente
join notaFiscal 
on venda.idVenda = notaFiscal.fkVenda 
join produto
on notaFiscal.fkProd = produto.idProd;

select `venda`.dataVenda as 'Data',
`produto`.nomeProd as Produto,
`notaFiscal`.qtdProd as 'Quantidade de produtos'
from cliente as indicador
join cliente as indicação
on indicador.idCliente = indicação.fkIndicador
join venda
on indicação.idCliente = venda.FkCliente
join notaFiscal 
on venda.idVenda = notaFiscal.fkVenda 
join produto
on notaFiscal.fkProd = produto.idProd
where `venda`.idVenda = '101';

select `produto`.nomeProd as Produto,
`produto`.precoProd as Preço,
`notaFiscal`.qtdProd as 'Quantidade de produtos',
sum(qtdProd*precoProd) as 'Soma da venda'
 from produto 
 join notaFiscal
 on produto.idProd = notaFiscal.fkProd
 group by nomeProd,precoProd,qtdProd;
 
 insert cliente(fkIndicador, nomeCliente, emailCliente, enderecoCliente) values
 (9, 'Laura', 'lala@sptech','Av. scrr');
 
 select * from cliente left join venda
 on cliente.idCliente = venda.fkCliente;

 select min(precoProd) as 'Menor Preço',
 max(precoProd) as 'Maior preço'
 from produto;
 
 select sum(precoProd) as 'Soma dos preços',
 avg(precoProd) as 'Média dos preços'
 from produto;
 
 select count(precoProd) 'Preço(s) acima da média'
 from produto where precoProd > (select avg(precoProd) from produto);
 
select sum(distinct precoProd) 'Soma dos preços distintos'
 from produto;

 select sum(precoProd) as 'Soma dos preços'
 from produto join notaFiscal
 on produto.idProd = notaFiscal.fkProd
 where notaFiscal.fkProd = '5000';
 