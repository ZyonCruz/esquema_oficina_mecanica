# esquema_oficina_mecanica

# Projeto de Banco de Dados: Sistema de Gestão de Oficina Mecânica

Este repositório contém o resultado do desafio de projeto da DIO, que consistiu na criação de um esquema de banco de dados para um sistema de gestão de oficina mecânica. O projeto inclui um **modelo conceitual** e o **script SQL** para a sua implementação.

## 🎯 Objetivos do Projeto

O objetivo principal foi modelar e construir um banco de dados relacional para gerenciar o fluxo de Ordens de Serviço (OS), desde o cliente até a execução dos trabalhos pela equipe de mecânicos. O projeto se baseou em uma narrativa específica para definir as entidades, atributos e relacionamentos.

## 📄 Componentes do Repositório

* `esquema_oficina_mecanica.pdf`: Imagem do diagrama conceitual de Entidade-Relacionamento (ER), desenvolvido no Draw.io.
* `esquema_oficina_mecanica.sql`: Script SQL que cria o banco de dados e todas as tabelas, incluindo chaves primárias e estrangeiras, além de alguns dados de exemplo.

## 📈 Esquema Conceitual e Modelagem

O diagrama conceitual foi a base para a criação do banco de dados. Ele mostra como as entidades se relacionam para refletir o fluxo de trabalho da oficina.

A modelagem reflete as seguintes relações e decisões:

* **Cliente e Veículo:** Um cliente pode ter múltiplos veículos, enquanto um veículo pertence a apenas um cliente.
* **Mecânicos e Equipes:** Vários mecânicos compõem uma equipe, e uma equipe é responsável por uma ou mais Ordens de Serviço.
* **Ordem de Serviço (OS):** A OS é a entidade central que conecta o veículo, a equipe de mecânicos, os serviços a serem realizados e as peças utilizadas.
* **Serviços e Peças:** Uma OS pode ter vários serviços, e cada serviço pode consumir várias peças.

## 🛠️ Como Usar o Script SQL

Para criar o banco de dados em seu ambiente local, siga estes passos simples:

1.  Abra o **MySQL Workbench** e conecte-se ao seu servidor local.
2.  No menu superior, vá em `File > Open SQL Script` e selecione o arquivo `oficina_mecanica.sql`.
3.  Execute o script clicando no botão de **raio amarelo**. Isso criará o banco de dados `oficina` com todas as tabelas e dados de exemplo.

## 🔑 Tecnologias Utilizadas

* **MySQL**: Sistema de Gerenciamento de Banco de Dados Relacional.
* **MySQL Workbench**: Ferramenta para gerenciar o banco de dados e executar scripts.
* **Draw.io**: Ferramenta online para a modelagem conceitual do diagrama.

---
