create database Atv4_2;
use Atv4_2;

CREATE TABLE Funcionarios(
    Id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Data_admissao DATE
);

DELIMITER //
CREATE TRIGGER checar_data_admissao
BEFORE INSERT ON funcionarios
FOR EACH ROW
	BEGIN
	IF NEW.data_admissao <= CURDATE() THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Data de admissão não pode ser igual a data atual. Tente Novamente';
	END IF;
END;
//
DELIMITER ;

INSERT INTO Funcionarios (Nome, Data_admissao)
VALUES ('João Kleber', '2022-10-03'),
('Mariana Lorenço', '2021-12-15'),
('Patrick', '2020-10-20'),
('Jordan', '2023-06-29'); 

SELECT * FROM Funcionarios;