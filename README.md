# esquema_oficina_mecanica

Projeto Conceitual de Banco de Dados: Oficina Mecânica
Este projeto é a resolução do desafio de Engenharia de Banco de Dados da DIO, focado na modelagem conceitual de um sistema de controle e gerenciamento de Ordens de Serviço (OS) para uma oficina mecânica.

🎯 Objetivo
Criar um esquema conceitual de banco de dados a partir de uma narrativa, identificando entidades, atributos e seus relacionamentos.

🛠️ Ferramenta de Modelagem
O esquema foi desenvolvido utilizando Draw.io e MySQL Workbench

📄 Narrativa do Projeto
O sistema deve gerenciar o fluxo de trabalho em uma oficina mecânica: clientes trazem veículos para conserto ou revisão. Cada veículo é designado a uma equipe de mecânicos que cria uma Ordem de Serviço (OS). A OS detalha os serviços e peças necessários, e seu valor final é calculado com base no custo da mão de obra e das peças.

📊 Esquema Conceitual do Banco de Dados
O diagrama abaixo ilustra a estrutura do banco de dados, detalhando as entidades e suas conexões.

📌 Principais Entidades e Relacionamentos
Cliente e Veículo: Um cliente pode ter múltiplos veículos, mas um veículo pertence a apenas um cliente.
Mecânico e Equipe de Mecânicos: Vários mecânicos compõem uma equipe. Uma equipe, por sua vez, é responsável por uma Ordem de Serviço.
Ordem de Serviço (OS): Uma OS é um documento central que vincula um veículo, a equipe responsável, os serviços e as peças utilizadas.
Serviço e Peça: Uma OS pode conter vários serviços, e cada serviço pode consumir diferentes peças.
