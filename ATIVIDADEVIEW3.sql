create database AtvView3;
use AtvView3;

create table Funcionarios (
	Id_funcionario int auto_increment primary key,
    Nome varchar (50) not null,
    Cargo varchar (40) not null,
	Salario decimal (10, 2) not null
);

create table Vendas (
	Id_venda int auto_increment primary key,
    Data_venda datetime not null,
    Valor_venda decimal (7, 2),
    Funcionarioid int, 
    
    foreign key(Funcionarioid) references Funcionarios(Id_funcionario)
);

insert into Funcionarios (Nome, Cargo, Salario) 
values('Mirela', 'Vendedora 1', 3250.00),
('Bianca', 'Vendedora 2', 3250.00),
('Pedro', 'Diretor', 7000.50),
('Gabriel', 'Assistente', 4880.20);

insert into Vendas (Data_venda, Valor_venda, Funcionarioid) 
values('2023-11-11 15:50:00', 1.7800, 1),
('2023-11-12 14:28:00', 1.200, 2),
('2023-11-13 14:30:00', 12.000, 3),
('2023-11-14 14:00:28', 1660.00, 4);

create view relatorio_vendas_funcionario as 
select f.Nome as nome_funcionario,
count(v.Id_venda) as numero_vendas,
sum(v.Valor_venda) as valor_total
from  Vendas v
join Funcionarios f 
on f.Id_funcionario = v.Funcionarioid
group by f.Id_funcionario, f.Nome;

select * from relatorio_vendas_funcionario;