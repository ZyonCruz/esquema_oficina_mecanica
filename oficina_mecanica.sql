-- Este script cria um banco de dados para o sistema de controle de uma oficina mecânica.
-- Ele inclui tabelas para Clientes, Veículos, Mecânicos, Equipes, Ordens de Serviço (OS),
-- Serviços e Peças, seguindo a modelagem conceitual do projeto.

-- Cria o banco de dados 'oficina'
CREATE DATABASE oficina;

-- Usa o banco de dados 'oficina'
USE oficina;

-- ------------------------------------------------------------------------------------------
-- Entidades Principais
-- ------------------------------------------------------------------------------------------

-- Tabela para os clientes que levam veículos
CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100),
    cpf_cnpj VARCHAR(14) UNIQUE NOT NULL,
    endereco VARCHAR(255)
);

-- Tabela para os veículos levados à oficina
CREATE TABLE Veiculos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(7) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

-- Tabela para os mecânicos
CREATE TABLE Mecanicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_mecanico VARCHAR(10) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    especialidade VARCHAR(100)
);

-- Tabela para as equipes de mecânicos
CREATE TABLE Equipes_Mecanicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- ------------------------------------------------------------------------------------------
-- Tabela de Junção (Relacionamento N:N)
-- ------------------------------------------------------------------------------------------

-- Tabela de junção para relacionar Mecânicos a Equipes
CREATE TABLE Equipe_Membros (
    mecanico_id INT NOT NULL,
    equipe_id INT NOT NULL,
    PRIMARY KEY (mecanico_id, equipe_id),
    FOREIGN KEY (mecanico_id) REFERENCES Mecanicos(id),
    FOREIGN KEY (equipe_id) REFERENCES Equipes_Mecanicos(id)
);

-- ------------------------------------------------------------------------------------------
-- Tabela de Ordem de Serviço (OS)
-- ------------------------------------------------------------------------------------------

CREATE TABLE Ordens_Servico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero_os VARCHAR(20) UNIQUE NOT NULL,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    status_os ENUM('Aguardando Avaliação', 'Aguardando Autorização', 'Em Execução', 'Concluído') NOT NULL,
    data_conclusao DATE,
    veiculo_id INT NOT NULL,
    equipe_id INT NOT NULL,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculos(id),
    FOREIGN KEY (equipe_id) REFERENCES Equipes_Mecanicos(id)
);

-- ------------------------------------------------------------------------------------------
-- Tabelas para Serviços e Peças
-- ------------------------------------------------------------------------------------------

-- Tabela para os serviços oferecidos
CREATE TABLE Servicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    valor_mao_obra DECIMAL(10, 2) NOT NULL
);

-- Tabela para as peças
CREATE TABLE Pecas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- Tabela de junção para relacionar OS a Serviços (N:N)
CREATE TABLE OS_Servicos (
    os_id INT NOT NULL,
    servico_id INT NOT NULL,
    PRIMARY KEY (os_id, servico_id),
    FOREIGN KEY (os_id) REFERENCES Ordens_Servico(id),
    FOREIGN KEY (servico_id) REFERENCES Servicos(id)
);

-- Tabela de junção para relacionar OS a Peças (N:N)
CREATE TABLE OS_Pecas (
    os_id INT NOT NULL,
    peca_id INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (os_id, peca_id),
    FOREIGN KEY (os_id) REFERENCES Ordens_Servico(id),
    FOREIGN KEY (peca_id) REFERENCES Pecas(id)
);

-- ------------------------------------------------------------------------------------------
-- Inserção de dados de exemplo
-- ------------------------------------------------------------------------------------------

-- Inserindo Clientes
INSERT INTO Clientes (nome, sobrenome, cpf_cnpj, endereco) VALUES
('João', 'Ferreira', '12345678901', 'Rua das Flores, 10 - Centro'),
('Maria', 'Oliveira', '98765432109', 'Av. Principal, 50 - Bairro Novo');

-- Inserindo Veículos
INSERT INTO Veiculos (placa, marca, modelo, ano_fabricacao, cliente_id) VALUES
('ABC1234', 'Ford', 'Ka', 2018, 1),
('XYZ5678', 'Honda', 'Civic', 2020, 2);

-- Inserindo Mecânicos
INSERT INTO Mecanicos (codigo_mecanico, nome, endereco, especialidade) VALUES
('MEC001', 'Carlos', 'Rua dos Mecânicos, 1 - Bairro A', 'Motor'),
('MEC002', 'Ana', 'Av. dos Carros, 2 - Bairro B', 'Eletricista');

-- Inserindo Equipes de Mecânicos
INSERT INTO Equipes_Mecanicos (nome) VALUES
('Equipe Alpha'),
('Equipe Beta');

-- Associando Mecânicos às Equipes
INSERT INTO Equipe_Membros (mecanico_id, equipe_id) VALUES
(1, 1),
(2, 1);

-- Inserindo Serviços
INSERT INTO Servicos (nome, descricao, valor_mao_obra) VALUES
('Troca de Óleo', 'Troca de óleo do motor e filtro', 50.00),
('Revisão Geral', 'Check-up completo do veículo', 150.00);

-- Inserindo Peças
INSERT INTO Pecas (nome, descricao, valor_unitario, estoque) VALUES
('Filtro de Óleo', 'Filtro para motor', 25.00, 50),
('Oleo de Motor', 'Oleo sintético', 40.00, 100);

-- Criando uma Ordem de Serviço
INSERT INTO Ordens_Servico (numero_os, data_emissao, valor_total, status_os, veiculo_id, equipe_id) VALUES
('OS-001-2025', '2025-09-10', 0.00, 'Aguardando Avaliação', 1, 1);

-- ------------------------------------------------------------------------------------------
-- Consultas de exemplo 
-- ------------------------------------------------------------------------------------------

-- Consulta 1: Retorna a OS com o nome do cliente e a placa do veículo
SELECT 
    os.numero_os,
    os.data_emissao,
    os.status_os,
    c.nome AS nome_cliente,
    v.placa
FROM Ordens_Servico AS os
JOIN Veiculos AS v ON os.veiculo_id = v.id
JOIN Clientes AS c ON v.cliente_id = c.id;