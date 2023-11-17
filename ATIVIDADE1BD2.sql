CREATE DATABASE Atv1_2;

USE Atv1_2;

Create table livro(
	id_livro int auto_increment primary key,
    titulo varchar(50) not null,
    autor varchar(100) not null,
    quantidade_estoque int not  null
);

Create table emprestimo(
	id_emprestimo int auto_increment primary key,
    data_emprestimo datetime not null,
    data_devolucao datetime not null,
    LivroID int not null,

	foreign key (LivroID) references livro(id_livro)
);

DELIMITER //
CREATE TRIGGER tg_estoque_livro
AFTER INSERT ON emprestimo
FOR EACH ROW 
BEGIN 
	UPDATE livro
    set quantidade_estoque = quantidade_estoque - 1 
    WHERE id_livro = NEW.LivroID;
END // 
DELIMITER ;

INSERT INTO emprestimo(data_emprestimo,data_devolucao,LivroID)
VALUES('2023-05-12 14:10:20','2023-07-20 11:09:26',1),
('2023-07-20 15:12:20','2023-08-12 16:00:20',1),
('2022-10-15 10:18:00','2023-10-23 20:00:45',4);

INSERT INTO livro(titulo,autor,quantidade_estoque)
VALUES('Barraca das Flores','Jullie Martinez',165),
('Coração de Gelo','Georgie Ruman',56),
('Amor e Gellato','Esqueci',92),
('Vermelho, Branco, Sangue Azul','Gail Marlos',200);

select * from livro;
