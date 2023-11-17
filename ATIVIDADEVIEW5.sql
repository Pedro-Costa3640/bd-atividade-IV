create database AtvView5;
use AtvView5;

create table Clientes (
    Id_cliente int primary key auto_increment,
    Nome varchar(100) not null,
    Endereco varchar(100),
    Cidade varchar(100) not null
);

create table Pagamentos (
    Id_pagamento int primary key auto_increment,
    Data_pagamento date not null,
    Valor_pagamento decimal(10, 2) not null,
    ClienteID int,
    
    foreign key (ClienteID) references Clientes(Id_cliente)
);

insert into Clientes (Nome, Endereco, Cidade) 
values('Bianca', 'Rua Solimões Santos', 'Salvador BA'),
('Mirela', 'Condomínio Mareles', 'Rio de Janeiro RJ'),
('Gabriel', 'Prédio Chora menos', 'São Paulo SP'),
('Pedro', 'Rua Jurandir', 'Salvador BA');

insert into Pagamentos (ClienteID, Data_pagamento, Valor_pagamento) 
values(1, '2023-11-15', 264.50),
(2, '2023-11-14', 2000.35),
(3, '2023-11-13', 759.15),
(4, '2023-11-21', 566.50);

create view relatorio_pagamentos_cidade as
select c.Cidade as nome_cidade,
sum(p.Valor_pagamento) as valor_total_pagamentos
from Clientes c
join Pagamentos p on c.Id_cliente = p.ClienteID
group by c.Cidade;

select * from relatorio_pagamentos_cidade;