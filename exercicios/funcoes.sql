use atividade;
-- exercicios
/*
exercicio01 => para todos os vendedores que tem a comissão igual a "A", atualize a dataAdm para ser 560dias 
exercicio02 => para todos os vendedores que tem a comissão igual a "B", atualize a dataAdm para ser 860dias
exercicio03 => para todos os vendedores que tem a comissão igual a "C", atualize a dataAdm para ser 1000 dias
exercicio04 => para todos os vendedores que tem a comissao igual a "A", atualize a dataDem para null 
exercicio05 => para todos os vendedores que tem a comissao igual a "B", atualize a dataDem para 6meses apos a dataAdm
exercicio06 => para todos os vendedores que tem a comissao igual a "C", atualize a dataDem para 100 dias apos dataDem  
*/


-- adicionando as duas novas entidades a tabela
alter table vendedor add dataAdm date;
alter table vendedor add dataDem date;

-- mostrando todos os dados da tabela vendedor
select * from vendedor;

-- adicionando a data atual do computador aos atributos da tabela vendedor
update vendedor 
set dataAdm = getdate();

update vendedor 
set dataDem = getdate();

--exercicio01
update vendedor 
set dataAdm = dateadd(day, -560, getdate())
where comissao = 'A';

--exercicio02
update vendedor 
set dataAdm = dateadd(day, -860, getdate())
where comissao = 'B';

-- exercicio03
update vendedor
set dataAdm = dateadd(day , -1000, getdate())
where comissao = 'C';

--exercicio04
update vendedor 
set dataDem = null
where comissao = 'A';

--exercicio05
update vendedor 
set dataDem = dateadd(month, -6, dataAdm)
where comissao = 'B';

--exercicio06
update vendedor
set dataDem = dateadd(day, -100, dataDem)
where comissao = 'C';

-- 1 Quantos vendedores estao cadastrados na tabela vendedor
-- 2 Quantos clientes nao possuem cep
-- 3 Quantos clientes possuem cep
-- 4 Quantos produtos tem preço maior que 50
-- 5 Qual o total pago de salario aos vendedores?
-- 6 QUal o total monetario existente na tabela produto
-- 7 QUal a media salarial existente na tabela vendedor
-- 8 Exibir o maior e menor valores dos salarios cadastrados na tabela vendedor

-- exercicio01
select count(cod_ven) as 'quantidade de vendedores' from vendedor;

--exercicio02
select count(cod_clie) as 'clientes sem cep' from cliente 
where cep is null;

--exercicio03
select count(cep) as 'clientes com cep' from cliente;

--exercicio04
select count(produto.unidade) as 'produtos com preco maior que 50' from produto
where produto.val_unit > 50;

--exercicio05
select sum(vendedor.salario_fixo) as 'total de salario pago aos vendedores' from vendedor;

--exercicio06
select sum(produto.val_unit) as 'valor total dos produtos' from produto;

-- exercicio07
select avg(salario_fixo) as 'media dos salarios dos vendedores' from vendedor;

-- exercicio08
select max(salario_fixo) as 'menor salario' , min(salario_fixo) as 'maior salario' from vendedor;