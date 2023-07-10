create schema if not exists `desafio-4` ;
use `desafio-4` ;

drop table if exists `desafio-4`.`cliente` ;
create table if not exists `desafio-4`.`cliente` (
  `id_cliente` int not null auto_increment,
  `nome` varchar(11) null,
  `sobrenome` varchar(45) null,
  `endereco` varchar(45) null,
  primary key (`id_cliente`)
);


drop table if exists `desafio-4`.`veiculo` ;
create table if not exists `desafio-4`.`veiculo` (
  `id_veiculo` int not null auto_increment,
  `modelo` varchar(20) null,
  `placa` varchar(10) not null,
  primary key (`id_veiculo`)
);


drop table if exists `desafio-4`.`mecanico` ;
create table if not exists `desafio-4`.`mecanico` (
  `id_mecanico` int not null auto_increment,
  `nome` varchar(45) not null,
  `especialidade` varchar(20) not null,
  `endereco` varchar(45) null,
  primary key (`id_mecanico`)
);


drop table if exists `desafio-4`.`equipe_mecanicos` ;
create table if not exists `desafio-4`.`equipe_mecanicos` (
  `id_equipe_mecanicos` int not null,
  `descricao` varchar(45) null,
  primary key (`id_equipe_mecanicos`)
);


drop table if exists `desafio-4`.`ordem_servico` ;
create table if not exists `desafio-4`.`ordem_servico` (
  `id_ordem_servico` int not null auto_increment,
  `data_emissao` date not null,
  `valor` decimal(8,2) null,
  `status` varchar(20) null,
  `data_conclusao` date null,
  `id_veiculo` int not null,
  `id_equipe_mecanicos` int not null,
  primary key (`id_ordem_servico`, `id_veiculo`, `id_equipe_mecanicos`),
  constraint `fk_ordem_servico_veiculo1`
    foreign key (`id_veiculo`)
    references `desafio-4`.`veiculo` (`id_veiculo`),
  constraint `fk_ordem_servico_equipe_mecanicos1`
    foreign key (`id_equipe_mecanicos`)
    references `desafio-4`.`equipe_mecanicos` (`id_equipe_mecanicos`)
);


drop table if exists `desafio-4`.`peca` ;
create table if not exists `desafio-4`.`peca` (
  `id_peca` int not null auto_increment,
  `descricao` varchar(45) null,
  `valor` decimal(8,2) null,
  primary key (`id_peca`)
);

drop table if exists `desafio-4`.`servico` ;
create table if not exists `desafio-4`.`servico` (
  `id_servico` int not null auto_increment,
  `descricao` varchar(45) not null,
  `valor` decimal(8,2) not null,
  primary key (`id_servico`)
);


drop table if exists `desafio-4`.`mecanico_has_ordem_servico` ;
create table if not exists `desafio-4`.`mecanico_has_ordem_servico` (
  `id_mecanico` int not null,
  `id_ordem_servico` int not null,
  primary key (`id_mecanico`, `id_ordem_servico`),
  constraint `fk_mecanico_has_ordem_servico_mecanico1`
    foreign key (`id_mecanico`)
    references `desafio-4`.`mecanico` (`id_mecanico`),
  constraint `fk_mecanico_has_ordem_servico_ordem_servico1`
    foreign key (`id_ordem_servico`)
    references `desafio-4`.`ordem_servico` (`id_ordem_servico`)
);


drop table if exists `desafio-4`.`servico_realizado` ;
create table if not exists `desafio-4`.`servico_realizado` (
  `id_servico` int not null,
  `id_ordem_servico` int not null,
  `quantidade` int null,
  primary key (`id_servico`, `id_ordem_servico`),
  constraint `fk_servico_has_ordem_servico_servico1`
    foreign key (`id_servico`)
    references `desafio-4`.`servico` (`id_servico`),
  constraint `fk_servico_has_ordem_servico_ordem_servico1`
    foreign key (`id_ordem_servico`)
    references `desafio-4`.`ordem_servico` (`id_ordem_servico`)
);

drop table if exists `desafio-4`.`peca_utilizada` ;
create table if not exists `desafio-4`.`peca_utilizada` (
  `id_ordem_servico` int not null,
  `id_peca` int not null,
  `quantity` int null,
  primary key (`id_ordem_servico`, `id_peca`),
  constraint `fk_ordem_servico_has_peca_ordem_servico1`
    foreign key (`id_ordem_servico`)
    references `desafio-4`.`ordem_servico` (`id_ordem_servico`),
  constraint `fk_ordem_servico_has_peca_peca1`
    foreign key (`id_peca`)
    references `desafio-4`.`peca` (`id_peca`)
);


drop table if exists `desafio-4`.`mecanico_has_equipe_mecanicos` ;
create table if not exists `desafio-4`.`mecanico_has_equipe_mecanicos` (
  `id_mecanico` int not null,
  `id_equipe_mecanicos` int not null,
  primary key (`id_mecanico`, `id_equipe_mecanicos`),
  constraint `fk_mecanico_has_equipe_mecanicos_mecanico1`
    foreign key (`id_mecanico`)
    references `desafio-4`.`mecanico` (`id_mecanico`),
  constraint `fk_mecanico_has_equipe_mecanicos_equipe_mecanicos1`
    foreign key (`id_equipe_mecanicos`)
    references `desafio-4`.`equipe_mecanicos` (`id_equipe_mecanicos`)
);

drop table if exists `desafio-4`.`veiculo_has_cliente` ;
create table if not exists `desafio-4`.`veiculo_has_cliente` (
  `id_veiculo` int not null,
  `id_cliente` int not null,
  primary key  (`id_veiculo`, `id_cliente`),
  constraint `fk_veiculo_has_cliente_veiculo1`
    foreign key (`id_veiculo`)
    references `desafio-4`.`veiculo` (`id_veiculo`),
  constraint `fk_veiculo_has_cliente_cliente1`
    foreign key (`id_cliente`)
    references `desafio-4`.`cliente` (`id_cliente`)
);