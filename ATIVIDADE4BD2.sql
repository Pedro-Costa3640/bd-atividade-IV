create database Atv4_2;
use Atv4_2;

create table Produtos(
    Id_produto int primary key auto_increment,
    Nome varchar(255) not null,
    Quantidade_estoque int not null
);

create table Vendas(
    Id_venda int primary key auto_increment,
    Data_venda datetime not null
);

create table Itens_venda (
    Id_item_venda int primary key,
    Id_venda int not null,
    Id_produto int not null,
    Quantidade int not null,
    foreign key (id_venda) references vendas(id_venda),
    foreign key (id_produto) references produtos(id_produto)
);

DELIMITER //

CREATE TRIGGER verificar_estoque
BEFORE INSERT ON Itens_venda
FOR EACH ROW
BEGIN
    DECLARE estoque_disponivel INT;

    -- Obtém a quantidade em estoque do produto correspondente
    SELECT Quantidade_estoque INTO estoque_disponivel
    FROM Produtos
    WHERE Id_produto = NEW.Id_produto;

    -- Verifica se a quantidade em estoque é suficiente
    IF estoque_disponivel < NEW.Quantidade THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Produto está fora de estoque.' ;
	END IF;
END;

//

DELIMITER ;


insert into Produtos (Nome, Quantidade_estoque) 
values ('Raquete de Tênis', 20),
('Raquete de Baisebol', 55),
('Raquete de seilá', 30);

insert into Vendas (Data_venda) 
values ('2023-06-24 19:20:00');

insert into Itens_venda (Id_venda, Id_produto, Quantidade) 
values (1, 1, 25);

select * from Produtos;

drop database Atv4_2;
