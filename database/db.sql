-- Criar o banco de dados
CREATE DATABASE aula_anderson_20_10;

-- Conectar ao banco (no psql)
\c aula_anderson_20_10;

-- Criar tabela de usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar tabela de livros
CREATE TABLE livros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publicado_em INT,
    disponivel BOOLEAN DEFAULT TRUE
);

-- Criar tabela de empréstimos
CREATE TABLE emprestimos (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    livro_id INT REFERENCES livros(id),
    emprestado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    devolvido_em TIMESTAMP
);
