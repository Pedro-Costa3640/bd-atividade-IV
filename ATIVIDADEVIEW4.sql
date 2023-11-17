create database AtvView4;
use AtvView4;

create table Categorias (
	Id_categoria int primary key auto_increment,
    Nome_categoria varchar (50) not null,
	Descricao varchar(255) not null
);

create table Produtos (
	Id_produto int primary key auto_increment,
    Nome varchar(30) not null,
    Preco_unitario decimal (7, 2)not null,
    CategoriaID int,
    
    foreign key(Categoriaid) references Categorias(Id_categoria)
);

insert into Categorias (Nome_categoria, Descricao) 
values('Sonoplastia', 'Aproveite o melhor da sonoplastia'),
('Entretenimento/Sala', 'Compre os melhores produtos e com qualidade superior'),
('Quarto', 'Descanse em paz'),
('Calçados', 'As melhores meias para você(estudante paga meia sim)');

insert into Produtos (Nome, Preco_unitario, CategoriaID) 
values('Microfone', 91.50, 1),
('Televisão', 4600.75, 2),
('Colchão', 2800, 3),
('Meia', 26.50, 4);

create view relatorio_produtos_categoria as 
select c.Nome_categoria as nome,
count(p.Id_produto) as quantidade_produto
from Categorias c
join Produtos p on c.Id_categoria = p.CategoriaID
group by c.Id_categoria;

select * from relatorio_produtos_categoria;