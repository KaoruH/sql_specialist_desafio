CREATE SCHEMA IF NOT EXISTS `desafio_3` ;
USE `desafio_3` ;


DROP TABLE IF EXISTS `desafio_3`.`produto` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(20) NULL,
  `descricao` VARCHAR(100) NULL,
  `valor` DOUBLE NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id_produto`));

DROP TABLE IF EXISTS `desafio_3`.`estoque` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`estoque` (
  `id_estoque` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estoque`));

DROP TABLE IF EXISTS `desafio_3`.`fornecedor` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`fornecedor` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fornecedor`));

DROP TABLE IF EXISTS `desafio_3`.`cliente` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `is_pessoa_juridica` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_cliente`));

DROP TABLE IF EXISTS `desafio_3`.`pedido` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `cliente_id_cliente` INT NOT NULL,
  `status_pedido` VARCHAR(20) NULL,
  `status_entrega` VARCHAR(20) NULL,
  `rastreio` VARCHAR(20) NULL,
  PRIMARY KEY (`id_pedido`, `cliente_id_cliente`),
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `desafio_3`.`cliente` (`id_cliente`));



DROP TABLE IF EXISTS `desafio_3`.`produto_has_estoque` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`produto_has_estoque` (
  `produto_id_produto` INT NOT NULL,
  `estoque_id_estoque` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`produto_id_produto`, `estoque_id_estoque`),
  CONSTRAINT `fk_Produto_has_Estoque_Produto`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `desafio_3`.`produto` (`id_produto`),
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`estoque_id_estoque`)
    REFERENCES `desafio_3`.`estoque` (`id_estoque`));


DROP TABLE IF EXISTS `desafio_3`.`fornecedor_has_produto` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`fornecedor_has_produto` (
  `fornecedor_id_fornecedor` INT NOT NULL,
  `produto_id_produto` INT NOT NULL,
  PRIMARY KEY (`fornecedor_id_fornecedor`, `produto_id_produto`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor1`
    FOREIGN KEY (`fornecedor_id_fornecedor`)
    REFERENCES `desafio_3`.`fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `desafio_3`.`produto` (`id_produto`));


DROP TABLE IF EXISTS `desafio_3`.`pedido_has_produto` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`pedido_has_produto` (
  `produto_id_produto` INT NOT NULL,
  `pedido_id_pedido` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`pedido_id_pedido`, `produto_id_produto`),
  CONSTRAINT `fk_Pedido_has_Produto_Pedido1`
    FOREIGN KEY (`pedido_id_pedido`)
    REFERENCES `desafio_3`.`pedido` (`id_pedido`),
  CONSTRAINT `fk_Pedido_has_Produto_Produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `desafio_3`.`produto` (`id_produto`));


DROP TABLE IF EXISTS `desafio_3`.`terceiro_vendedor` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`terceiro_vendedor` (
  `id_terceiro_vendedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_terceiro_vendedor`));


DROP TABLE IF EXISTS `desafio_3`.`terceiro_vendedor_has_produto` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`terceiro_vendedor_has_produto` (
  `terceiro_vendedor_id_terceiro_vendedor` INT NOT NULL,
  `produto_id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`terceiro_vendedor_id_terceiro_vendedor`, `produto_id_produto`),
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1`
    FOREIGN KEY (`terceiro_vendedor_id_terceiro_vendedor`)
    REFERENCES `desafio_3`.`terceiro_vendedor` (`id_terceiro_vendedor`),
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `desafio_3`.`produto` (`id_produto`));


DROP TABLE IF EXISTS `desafio_3`.`TipoCliente` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`TipoCliente` (
  `idTipoCliente` INT NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoCliente`));


DROP TABLE IF EXISTS `desafio_3`.`forma_pagamento` ;
CREATE TABLE IF NOT EXISTS `desafio_3`.`forma_pagamento` (
  `id_forma_pagamento` INT NOT NULL AUTO_INCREMENT,
  `titular` VARCHAR(45) NOT NULL,
  `numero_cartao` VARCHAR(45) NOT NULL,
  `is_debito` TINYINT(1) NOT NULL,
  `data_expiracao` DATE NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`id_forma_pagamento`, `cliente_idCliente`),
  CONSTRAINT `fk_Forma_Pagamento_Cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `desafio_3`.`cliente` (`id_cliente`));
