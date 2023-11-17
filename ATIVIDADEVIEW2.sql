create database AtvView2;
use AtvView2;

create table Produtos (
	Id_produto int primary key auto_increment,
    Nome varchar (50) not null,
    Preco_unitario decimal (7, 2) not null,
    Categoria varchar (50) not null
);

create table Estoque (
	Quantidade int  not null,
    Produtoid int,
    foreign key(Produtoid) references Produtos(Id_produto)
);

create view estoque_critico as 
select p.Nome as nome_produto, e.Quantidade as quantidade_estoque
from Produtos p
join Estoque e 
on p.Id_produto = e.Produtoid
where e.Quantidade < 100; 

insert into Produtos (Nome, Preco_unitario, Categoria)  
values('SmarthPhone Samsung', 2.400, 'Eletrônico'),
('SmarthPhone iPhone', 3.600, 'Eletrônico'),
('SmarthPhone Nokia', 654.99, 'Eletrônico'),
('SmarthPhone Redmi', 1.700, 'Eletrônico');

insert  into Estoque (Quantidade, Produtoid) 
values(10, 3),
(2, 2),
(7, 4),
(90, 1);

select * from estoque_critico;