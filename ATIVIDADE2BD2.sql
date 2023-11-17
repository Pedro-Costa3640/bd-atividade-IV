CREATE DATABASE Atv2_2;
USE Atv2_2;

CREATE TABLE contas(
	id_conta int auto_increment primary key,
    nome varchar(150) not null,
    saldo decimal(7,2) not null
);

CREATE TABLE transacoes(
	id_transacao int auto_increment primary key,
    tipo varchar(15) not null,
    valor decimal(7,2) not null,
    ContaID int not null,
    
    foreign key (ContaID) references contas(id_conta)
);

DELIMITER //

CREATE TRIGGER tg_financas_pessoais
AFTER INSERT ON transacoes
FOR EACH ROW
BEGIN 
	IF NEW.tipo = 'entrada' THEN
		UPDATE contas
    	SET saldo = saldo + NEW.valor
		WHERE id_conta = NEW.ContaID;
	ELSE
		UPDATE contas
		SET saldo = saldo - NEW.valor
		WHERE id_conta = NEW.ContaID;
	END IF;
END //

DELIMITER ;


INSERT INTO contas(nome,saldo)
VALUES('Adalberto Souza',7500),
('Juninho',9600),
('Clarice',10500),
('Judas',2000);

INSERT INTO transacoes(tipo,valor,ContaID)
VALUES('entrada', 150 , 1),
('saida', 4000 , 3),
('entrada', 500 , 2);

select * from contas;

drop database Atv2_2;