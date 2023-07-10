USE `desafio_3`;

INSERT INTO `produto` (`categoria`, `descricao`, `valor`, `nome`) VALUES
  ('Livro', 'O Senhor dos Anéis: A Sociedade do Anel', 59.99, 'A Sociedade do Anel'),
  ('Livro', 'O Senhor dos Anéis: As Duas Torres', 59.99, 'As Duas Torres'),
  ('Livro', 'O Senhor dos Anéis: O Retorno do Rei', 59.99, 'O Retorno do Rei'),
  ('DVD', 'O Senhor dos Anéis: A Sociedade do Anel (Edição Estendida)', 29.99, 'A Sociedade do Anel - Edição Estendida'),
  ('DVD', 'O Senhor dos Anéis: As Duas Torres (Edição Estendida)', 29.99, 'As Duas Torres - Edição Estendida'),
  ('DVD', 'O Senhor dos Anéis: O Retorno do Rei (Edição Estendida)', 29.99, 'O Retorno do Rei - Edição Estendida');

INSERT INTO `estoque` (`local`) VALUES
  ('Rivendell'),
  ('Moria'),
  ('Gondor');

INSERT INTO `fornecedor` (`razao_social`, `cnpj`) VALUES
  ('Livros de Terra-média Ltda.', '12345678901234'),
  ('DVDs Épicos S.A.', '98765432109876');

INSERT INTO `cliente` (`nome`, `cpf`, `endereco`, `is_pessoa_juridica`) VALUES
  ('Frodo', '12345678901', 'Condado, Vila dos Hobbits', 0),
  ('Gandalf', '98765432109', 'Cidade Branca, Valinor', 0),
  ('Elrond', '45678901234', 'Valfenda, Terra-média', 0);

INSERT INTO `pedido` (`cliente_id_cliente`, `status_pedido`, `status_entrega`, `rastreio`) VALUES
  (1, 'Em andamento', NULL, NULL),
  (2, 'Confirmado', 'Enviado', 'ABC123456'),
  (3, 'Em andamento', NULL, NULL);

INSERT INTO `produto_has_estoque` (`produto_id_produto`, `estoque_id_estoque`, `quantidade`) VALUES
  (1, 1, 10),
  (2, 1, 5),
  (3, 2, 7),
  (4, 2, 3),
  (5, 3, 8),
  (6, 3, 2);

INSERT INTO `fornecedor_has_produto` (`fornecedor_id_fornecedor`, `produto_id_produto`) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 4),
  (2, 5),
  (2, 6);

INSERT INTO `pedido_has_produto` (`pedido_id_pedido`, `produto_id_produto`, `quantidade`) VALUES
  (1, 1, 2),
  (1, 2, 1),
  (2, 2, 1),
  (3, 3, 2);

INSERT INTO `terceiro_vendedor` (`razao_social`, `local`) VALUES
  ('Mercado dos Elfos Ltda.', 'Lórien'),
  ('Loja dos Anões', 'Erebor');

INSERT INTO `terceiro_vendedor_has_produto` (`terceiro_vendedor_id_terceiro_vendedor`, `produto_id_produto`, `quantidade`) VALUES
  (1, 1, 5),
  (1, 3, 3),
  (2, 5, 6),
  (2, 6, 4);
  
  -- --------------
  
INSERT INTO cliente (nome, cpf, endereco, is_pessoa_juridica)
VALUES
    ('Sophie Hatter', '12345678901', 'Rua das Flores, 123', 0),
    ('Howl Jenkins Pendragon', '98765432101', 'Avenida dos Magos, 456', 0),
    ('Calcifer', '', 'Casa de Howl', 0),
    ('Witch of the Waste', '78901234501', 'Torre Assombrada, 789', 0);

INSERT INTO produto (categoria, descricao, valor, nome)
VALUES
    ('Roupas', 'Vestido elegante', 89.99, 'Vestido de Sophie'),
    ('Acessórios', 'Brinco de cristal', 29.99, 'Brinco do Howl'),
    ('Livros', 'Livro de feitiços', 49.99, 'Livro Mágico'),
    ('Objetos', 'Bola de cristal', 19.99, 'Bola de Adivinhação'),
    ('Roupas', 'Casaco mágico', 129.99, 'Casaco do Howl');

INSERT INTO pedido (cliente_id_cliente, status_pedido, status_entrega, rastreio)
VALUES
    (1, 'Concluído', 'Entregue', '123456789'),
    (2, 'Concluído', 'Em trânsito', '987654321'),
    (3, 'Pendente', NULL, NULL),
    (4, 'Concluído', 'Entregue', '789012345');


  
  
