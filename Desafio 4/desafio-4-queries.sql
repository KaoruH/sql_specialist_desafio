use `desafio-4`;

select * from `cliente`;
select * from `veiculo`;
select * from `mecanico`;
select * from `ordem_servico`;
select * from `peca`;
select * from `servico`;

select * from `cliente` where `nome` = 'Relâmpago';
select * from `veiculo` where `placa` like 'BLU%';
select * from `mecanico` where `especialidade` = 'Pneus';
select * from `ordem_servico` where `status` = 'Concluída';
select * from `peca` where `valor` > 50.00;
select * from `servico` where `valor` between 100.00 and 200.00;

select concat(`nome`, ' ', `sobrenome`) as `nome_completo` from `cliente`;

select
  `ordem_servico`.`id_ordem_servico`,
  sum(`peca`.`valor` * `peca_utilizada`.`quantity`) as `valor_pecas`,
  sum(`servico`.`valor` * `servico_realizado`.`quantidade`) as `valor_servicos`,
  sum(`peca`.`valor` * `peca_utilizada`.`quantity` + `servico`.`valor` * `servico_realizado`.`quantidade`) as `valor_total`
from
  `ordem_servico`
  inner join `peca_utilizada` on `ordem_servico`.`id_ordem_servico` = `peca_utilizada`.`id_ordem_servico`
  inner join `peca` on `peca_utilizada`.`id_peca` = `peca`.`id_peca`
  inner join `servico_realizado` on `ordem_servico`.`id_ordem_servico` = `servico_realizado`.`id_ordem_servico`
  inner join `servico` on `servico_realizado`.`id_servico` = `servico`.`id_servico`
group by
  `ordem_servico`.`id_ordem_servico`;

select * from `cliente` order by `sobrenome` desc;
select * from `veiculo` order by `modelo` asc;
select * from `mecanico` order by `nome` asc;
select * from `ordem_servico` order by `data_emissao` asc;
select * from `peca` order by `valor` desc;
select * from `servico` order by `valor` asc;

select
  os.`id_ordem_servico`,
  sum(pe.`valor` * pu.`quantity` + se.`valor` * sr.`quantidade`) as `valor_total`
from
  `ordem_servico` os
  inner join `peca_utilizada` pu on os.`id_ordem_servico` = pu.`id_ordem_servico`
  inner join `peca` pe on pu.`id_peca` = pe.`id_peca`
  inner join `servico_realizado` sr on os.`id_ordem_servico` = sr.`id_ordem_servico`
  inner join `servico` se on sr.`id_servico` = se.`id_servico`
group by
  os.`id_ordem_servico`
having
  `valor_total` > 500;

select
  `ordem_servico`.*,
  `veiculo`.`modelo`,
  `veiculo`.`placa`,
  concat(`cliente`.`nome`, ' ', `cliente`.`sobrenome`) as `nome_cliente`,
  `cliente`.`endereco` as `endereco_cliente`
from
  `ordem_servico`
  inner join `veiculo` on `ordem_servico`.`id_veiculo` = `veiculo`.`id_veiculo`
  inner join `veiculo_has_cliente` on `veiculo`.`id_veiculo` = `veiculo_has_cliente`.`id_veiculo`
  inner join `cliente` on `veiculo_has_cliente`.`id_cliente` = `cliente`.`id_cliente`;
