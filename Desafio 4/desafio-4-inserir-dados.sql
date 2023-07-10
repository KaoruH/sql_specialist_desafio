use `desafio-4`;

insert into `cliente` (`nome`, `sobrenome`, `endereco`) values
('Relâmpago', 'McQueen', 'Rua A, 123'),
('Mate', 'Tow', 'Av. B, 456'),
('Sally', 'Carrera', 'Rua C, 789'),
('Doc', 'Hudson', 'Av. D, 987'),
('Guido', 'Rocha', 'Rua E, 654');

insert into `veiculo` (`modelo`, `placa`) values
('Ferrari', 'RED001'),
('Chevrolet', 'BLU002'),
('Porsche', 'YEL003'),
('Ford', 'GRN004'),
('Fiat', 'ORG005');

insert into `mecanico` (`nome`, `especialidade`, `endereco`) values
('Ramone', 'Pintura', 'Rua X, 111'),
('Luigi', 'Pneus', 'Av. Y, 222'),
('Flo', 'Radiador', 'Rua Z, 333'),
('Mack', 'Motor', 'Av. W, 444'),
('Fillmore', 'Óleo', 'Rua V, 555');

insert into `equipe_mecanicos` (`id_equipe_mecanicos`, `descricao`) values
(1, 'Equipe Relâmpago'),
(2, 'Equipe Mate'),
(3, 'Equipe Sally'),
(4, 'Equipe Doc'),
(5, 'Equipe Guido');

insert into `ordem_servico` (`data_emissao`, `valor`, `status`, `data_conclusao`, `id_veiculo`, `id_equipe_mecanicos`) values
('2023-07-01', 500.00, 'Em andamento', null, 1, 1),
('2023-07-02', 800.00, 'Concluída', '2023-07-04', 2, 2),
('2023-07-03', 300.00, 'Em andamento', null, 3, 3),
('2023-07-04', 700.00, 'Concluída', '2023-07-06', 4, 4),
('2023-07-05', 400.00, 'Em andamento', null, 5, 5);

insert into `peca` (`descricao`, `valor`) values
('Vela de Ignição', 12.50),
('Pastilha de Freio', 45.90),
('Filtro de Ar', 19.99),
('Correia Dentada', 32.75),
('Amortecedor', 85.00);

insert into `servico` (`descricao`, `valor`) values
('Troca de Óleo', 50.00),
('Alinhamento', 80.00),
('Balanceamento', 60.00),
('Troca de Bateria', 150.00),
('Revisão Geral', 200.00);

insert into `mecanico_has_ordem_servico` (`id_mecanico`, `id_ordem_servico`) values
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3);

insert into `servico_realizado` (`id_servico`, `id_ordem_servico`, `quantidade`) values
(1, 1, 1),
(2, 1, 1),
(3, 2, 2),
(4, 2, 1),
(5, 3, 1);

insert into`peca_utilizada` (`id_ordem_servico`, `id_peca`, `quantity`) values
(1, 1, 4),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2);

insert into `mecanico_has_equipe_mecanicos` (`id_mecanico`, `id_equipe_mecanicos`) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

insert into `veiculo_has_cliente` (`id_veiculo`, `id_cliente`) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
