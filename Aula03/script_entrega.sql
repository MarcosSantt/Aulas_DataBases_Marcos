-- PARTE 1: Criação das tabelas
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE IF NOT EXISTS Autores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Livros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    isbn VARCHAR(20),
    ano_publicacao INT,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
);

-- PARTE 2: Teste de Integridade Referencial (Gera erro proposital)
-- O comando abaixo falha pois o autor_id 99 não existe em 'Autores'
INSERT INTO Livros (titulo, isbn, ano_publicacao, autor_id)
VALUES ('O Guia do Mochileiro', '12345', 1979, 99);

-- PARTE 3: Álgebra Relacional (Projeção e Seleção)
SELECT titulo 
FROM Livros 
WHERE ano_publicacao > 2020;