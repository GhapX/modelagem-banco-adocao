-- Limpeza de tabelas existentes
DROP TABLE IF EXISTS Adocao;
DROP TABLE IF EXISTS Solicitacao_de_adocao;
DROP TABLE IF EXISTS Vacinas;
DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Usuario;

CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Contato VARCHAR(50)
);

CREATE TABLE Animal (
    Id_animal INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Especie VARCHAR(50) NOT NULL,
    Raca VARCHAR(100),
    Idade INT,
    Sexo CHAR(1),
    Status VARCHAR(50),
    idUsuario INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(id) ON DELETE CASCADE
);

CREATE TABLE Vacinas (
    Id_vacina INT PRIMARY KEY AUTO_INCREMENT,
    Nome_vacina VARCHAR(100) NOT NULL,
    Data_aplicacao DATE,
    idAnimal INT,
    FOREIGN KEY (idAnimal) REFERENCES Animal(Id_animal) ON DELETE CASCADE
);

CREATE TABLE Solicitacao_de_adocao (
    Id_solicitacao INT PRIMARY KEY AUTO_INCREMENT,
    Data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50),
    idUsuario INT,
    idAnimal INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
    FOREIGN KEY (idAnimal) REFERENCES Animal(Id_animal)
);

CREATE TABLE Adocao (
    Id_adocao INT PRIMARY KEY AUTO_INCREMENT,
    Data_adocao DATE NOT NULL,
    idSolicitacao_de_adocao INT UNIQUE, -- UNIQUE para garantir 1:1 de acordo com o diagrama conceitual
    FOREIGN KEY (idSolicitacao_de_adocao) REFERENCES Solicitacao_de_adocao(Id_solicitacao)
);