create database AtvView1;
use AtvView1;

create table Clientes (
	Id_cliente int primary key auto_increment not null,
    Nome varchar (100) not null,
    Email varchar (100) not null unique,
    Telefone varchar (100) not null unique
);

create table Pedidos (
    Id_pedidos int primary key auto_increment,
    Data_pedido datetime not null,
    Valor_total decimal(5, 2) not null,
    Clienteid int not null,
    
    foreign key (Clienteid) references Clientes(Id_cliente)
);

insert into Clientes(Nome, Email, Telefone) 
values ('Carol', 'carol@gmail.com', '(71)8888-8888'),
('Jessica', 'jess@gmail.com', '(71)7777-7777'),
('Marcia', 'marciie@gmail.com', '(71)6666-6666'),
('Ruanita', 'ruanite@gmail.com', '(71)5555-5555');

insert into Pedidos (Data_pedido, Valor_total, Clienteid) 
values ('2023-07-22 14:00:02', 12.05, 1),
('2023-03-12 15:05:00', 29, 4),
('2023-04-15 16:50:00', 52, 3),
('2023-10-01 17:20:02', 63, 2);

create view relatorio_pedidos_cliente as 
select c.Nome as nome_cliente, c.Id_cliente, COUNT(p.Id_pedidos) as num_pedidos, 
sum(p.Valor_total) as t_gasto 
from Clientes c
join Pedidos p on  c.Id_cliente = p.Clienteid
group by c.Id_cliente, c.Nome;

drop database AtvView1;
select * from relatorio_pedidos_cliente;