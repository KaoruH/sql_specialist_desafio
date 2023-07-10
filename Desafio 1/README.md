# Desafio 1 - Refinando um Projeto Conceitual de Banco de Dados - E-COMMERCE

Este repositório contém a solução do Desafio 1 da Formação SQL Specialist da DIO, onde foi proposto o refinamento de um modelo conceitual de banco de dados para um E-COMMERCE, adicionando os seguintes pontos: Cliente PJ e PF, Pagamento e Entrega.

### Objetivo

O objetivo deste desafio é refinar o modelo conceitual de banco de dados do E-COMMERCE, incluindo as seguintes funcionalidades:

- Cliente PJ e PF: O sistema deve permitir que um cliente seja identificado como Pessoa Jurídica (PJ) ou Pessoa Física (PF), mas não pode ter ambas as informações. Será necessário ajustar o modelo para lidar com essa distinção entre os tipos de cliente.

- Pagamento: Um cliente pode ter cadastrado mais de uma forma de pagamento. Será necessário incluir essa funcionalidade no modelo, considerando os dados relevantes para cada forma de pagamento, como dados de cartão (exceto código de 3 números) e se é débito ou crédito.

- Entrega: A funcionalidade de entrega deve ter um status e um código de rastreio associados. Será necessário incluir essas informações no modelo para acompanhar o status e rastrear a entrega dos pedidos.

### Tecnologias Utilizadas

- Ferramentas: MySQL Workbench

### Resultado

![Resultado](./desafio-1.png)
