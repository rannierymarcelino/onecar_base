-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15-Dez-2023 às 11:48
-- Versão do servidor: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `one_car`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_anuncio` (`id_anum` INT)  BEGIN
		
		DELETE FROM veiculo_opcional WHERE id=id_anum;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_carro` (`id_car` INT)  BEGIN
		
		DELETE FROM veiculo WHERE id=id_car;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_carro_op` (`id_car_op` INT)  BEGIN
		
		DELETE FROM veiculo_opcional WHERE id=id_car_op;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_categ_car` (`id_categ` INT)  BEGIN
		
		DELETE FROM categoria_veiculo WHERE id=id_categ;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_cidade` (`id_cid` INT)  BEGIN
		
		DELETE FROM cidade WHERE id=id_cid;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_estado` (`id_es` INT)  BEGIN
		
		DELETE FROM estado WHERE id=id_es;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_fabricante` (`id_fab` INT)  BEGIN
		
		DELETE FROM fabricante WHERE id=id_fab;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_modelo` (`id_mod` INT)  BEGIN
		
		DELETE FROM modelo WHERE id=id_mod;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_mod_ver` (`id_v_m` INT)  BEGIN
		
		DELETE FROM modelo_versao WHERE id=id_v_m;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_motor` (`id_motor` INT)  BEGIN
		
		DELETE FROM motor WHERE id=id_motor;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_opc` (`id_op` INT)  BEGIN
		
		DELETE FROM opicional WHERE id=id_op;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_prop` (`id_prop` INT)  BEGIN
		
		DELETE FROM proprietario WHERE id=id_prop;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_prop_end` (`id_end` INT)  BEGIN
		
		DELETE FROM endereco_prop WHERE id=id_end;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_prop_tel` (`id_tel` INT)  BEGIN
		
		DELETE FROM telefone_prop WHERE id=id_tel;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spd_versao` (`id_ver` INT)  BEGIN
		
		DELETE FROM versao WHERE id=id_ver;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_anuncio` (`id_car` INT, `data_cad` DATE, `data_valid` DATE, `rel` BOOLEAN, `descricao` TEXT)  BEGIN
		
		INSERT INTO anuncio(veiculo_id, data_anuncio, data_vencimento, relevancia, descricao) VALUES (id_car,data_cad,data_valid,rel,descricao);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_carro` (`id_prop` INT, `id_cid` INT, `id_categ` INT, `id_model_ver` INT, `fab` INT, `vl` VARCHAR(20), `odo` INT)  BEGIN
		
		INSERT INTO veiculo(proprietario_id, cidade_id, categoria_veiculo_id, modelo_versao_id, ano, preco, km) VALUES (id_prop,id_cid,id_categ,id_model_ver,fab,vl,odo);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_carro_op` (`id_op` INT, `id_car` INT)  BEGIN
		
		INSERT INTO veiculo_opcional(opicional_id, veiculo_id) VALUES (id_op,id_car);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_categ_car` (`categoria` VARCHAR(20))  BEGIN
		
		INSERT INTO categoria_veiculo(nome) VALUES (categoria);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_cidade` (`id_estado` INT, `cidade` VARCHAR(150))  BEGIN
		
		INSERT INTO cidade(estado_id, nome) VALUES (id_estado,cidade);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_estado` (`estado` VARCHAR(30))  BEGIN
		
		INSERT INTO estado(nome) VALUES (estado);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_fabricante` (`fabricante` VARCHAR(20))  BEGIN
		
		INSERT INTO fabricante(nome) VALUES (fabricante);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_modelo` (`id_motor` INT, `id_fab` INT, `modelo` VARCHAR(50))  BEGIN
		
		INSERT INTO modelo(motor_id, fabricante_id, nome) VALUES (id_motor,id_fab,modelo);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_mod_ver` (IN `id_ver` INT, IN `id_mod` INT)  BEGIN
		
		INSERT INTO modelo_versao(versao_id, modelo_id) VALUES (id_ver,id_mod);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_motor` (`motor` VARCHAR(20), `tam` DOUBLE, `cilindro` INT)  BEGIN
		
		INSERT INTO motor(nome, tamanho, qtd_cilindros) VALUES (motor,tam,cilindro);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_opc` (`opcional` VARCHAR(50))  BEGIN
		
		INSERT INTO opicional(nome) VALUES (opcional);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_prop` (`nomeP` VARCHAR(250), `cpf` VARCHAR(25), `mail` VARCHAR(150), `pass` VARCHAR(15))  BEGIN
		
		INSERT INTO proprietario (nome, cpf_cnpj, email, senha) VALUES (nomeP,cpf,mail,pass);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_prop_end` (`id_prop` INT, `id_cid` INT, `rua` VARCHAR(150), `num` VARCHAR(10), `comp` VARCHAR(255))  BEGIN
		
		INSERT INTO endereco_prop(proprietario_id, cidade_id, endereco, numero, complemento) VALUES (id_prop,id_cid,rua,num,comp);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_prop_tel` (`id_prop` INT, `tel` VARCHAR(15))  BEGIN
		
		INSERT INTO telefone_prop(proprietario_id, telefone) VALUES (id_prop,telefone);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spi_versao` (IN `versao` VARCHAR(20))  BEGIN
		
		INSERT INTO versao(nome) VALUES (versao);


    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_anuncio` (`id_anum` INT, `id_car` INT, `data_cad` DATE, `data_valid` DATE, `rel` BOOLEAN, `descricao` TEXT)  BEGIN
		
		UPDATE veiculo_opcional SET opicional_id=id_op,veiculo_id=id_car WHERE id=id_anum;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_carro` (`id_car` INT, `id_prop` INT, `id_cid` INT, `id_categ` INT, `id_model_ver` INT, `fab` INT, `vl` VARCHAR(20), `odo` INT)  BEGIN
		
		UPDATE veiculo SET proprietario_id=id_prop,cidade_id=id_cid,categoria_veiculo_id=id_categ,modelo_versao_id=id_model_ver,ano=fab,preco=vl,km=odo WHERE id=id_car;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_carro_op` (`id_car_op` INT, `id_op` INT, `id_car` INT)  BEGIN
		
		UPDATE veiculo_opcional SET opicional_id=id_op,veiculo_id=id_car WHERE id=id_car_op;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_categ_car` (`id_categ` INT, `categoria` VARCHAR(20))  BEGIN
		
		UPDATE categoria_veiculo SET nome=categoria WHERE id=id_categ;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cidade` (`id_cid` INT, `id_est` INT, `estado` VARCHAR(150))  BEGIN
		
		UPDATE cidade SET estado_id=id_est,nome=estado WHERE id=id_cid;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_estado` (`id_est` INT, `estado` VARCHAR(30))  BEGIN
		
		UPDATE estado SET nome=estado WHERE id=id_es;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_fabricante` (`id_fab` INT, `fabricante` VARCHAR(20))  BEGIN
		
		UPDATE fabricante SET nome=fabricante WHERE id=id_fab;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_modelo` (`id_mod` INT, `id_motor` INT, `id_fab` INT, `modelo` VARCHAR(50))  BEGIN
		
		UPDATE modelo SET motor_id=id_motor,fabricante_id=id_fab,nome=modelo WHERE id=id_mod;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_mod_ver` (`id_v_m` INT, `id_ver` INT, `id_mod` INT)  BEGIN
		
		UPDATE modelo_versao SET versao_id=id_ver,modelo_id=id_mod WHERE id=id_v_m;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_motor` (`id_motor` INT, `motor` VARCHAR(20), `tam` DOUBLE, `cilindro` INT)  BEGIN
		
		UPDATE motor SET nome=motor,tamanho=tam,qtd_cilindros=cilindro WHERE id=id_motor;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_opc` (`id_op` INT, `opcional` VARCHAR(50))  BEGIN
		
		UPDATE opicional SET nome=opcional WHERE id=id_op;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_prop` (`id_prop` INT, `nomeP` VARCHAR(250), `cpf` VARCHAR(25), `mail` VARCHAR(150), `pass` VARCHAR(15))  BEGIN
		
		UPDATE proprietario SET nome=nomeP,cpf_cnpj=cpf,email=mail,senha=pass WHERE id=id_prop;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_prop_end` (`id_end` INT, `id_prop` INT, `id_cid` INT, `rua` VARCHAR(150), `num` VARCHAR(10), `comp` VARCHAR(255))  BEGIN
		
		UPDATE endereco_prop SET proprietario_id=id_prop,cidade_id=id_cid,endereco=rua,numero=num,complemento=comp WHERE id=id_end;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_prop_tel` (`id_tel` INT, `id_prop` INT, `tel` VARCHAR(15))  BEGIN
		
		UPDATE telefone_prop SET proprietario_id=id_prop,telefone=tel WHERE id=id_tel;

    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_versao` (`id_ver` INT, `versao` VARCHAR(20))  BEGIN
		
		UPDATE versao SET nome=versao WHERE id=id_ver;

    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anuncio`
--

CREATE TABLE `anuncio` (
  `id` int(10) UNSIGNED NOT NULL,
  `veiculo_id` int(10) UNSIGNED NOT NULL,
  `data_anuncio` date DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `relevancia` tinyint(1) DEFAULT NULL,
  `descricao` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `anuncio`
--

INSERT INTO `anuncio` (`id`, `veiculo_id`, `data_anuncio`, `data_vencimento`, `relevancia`, `descricao`) VALUES
(1, 1, '2023-12-12', '2024-05-12', 1, 'Carro em excelente estado de conservação'),
(2, 2, '2023-10-12', '2024-03-12', 0, 'Único dono'),
(3, 3, '2023-11-22', '2024-04-22', 1, 'Carro de Leilão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_veiculo`
--

CREATE TABLE `categoria_veiculo` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `categoria_veiculo`
--

INSERT INTO `categoria_veiculo` (`id`, `nome`) VALUES
(1, 'Hatch'),
(2, 'Sedan'),
(3, 'Pickup');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` int(10) UNSIGNED NOT NULL,
  `estado_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id`, `estado_id`, `nome`) VALUES
(1, 1, 'Barbalha'),
(2, 3, 'Osasco'),
(3, 2, 'Rio de Janeiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_prop`
--

CREATE TABLE `endereco_prop` (
  `id` int(10) UNSIGNED NOT NULL,
  `proprietario_id` int(10) UNSIGNED NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `endereco` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complemento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `endereco_prop`
--

INSERT INTO `endereco_prop` (`id`, `proprietario_id`, `cidade_id`, `endereco`, `numero`, `complemento`) VALUES
(1, 1, 1, 'Rua 1', '12', 'Proximo ao centro'),
(2, 2, 2, 'Rua 2', '34', ''),
(3, 3, 3, 'Rua 3', '56', 'Próximo a delegacia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id`, `nome`) VALUES
(1, 'CE'),
(2, 'RJ'),
(3, 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

CREATE TABLE `fabricante` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `fabricante`
--

INSERT INTO `fabricante` (`id`, `nome`) VALUES
(1, 'Fiat'),
(2, 'Chevrolet'),
(3, 'Volkswagen');

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `id` int(10) UNSIGNED NOT NULL,
  `motor_id` int(10) UNSIGNED NOT NULL,
  `fabricante_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `modelo`
--

INSERT INTO `modelo` (`id`, `motor_id`, `fabricante_id`, `nome`) VALUES
(1, 1, 1, 'Punto'),
(2, 2, 2, 'Prisma'),
(3, 3, 3, 'Saveiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_versao`
--

CREATE TABLE `modelo_versao` (
  `id` int(10) UNSIGNED NOT NULL,
  `versao_id` int(10) UNSIGNED NOT NULL,
  `modelo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `modelo_versao`
--

INSERT INTO `modelo_versao` (`id`, `versao_id`, `modelo_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `motor`
--

CREATE TABLE `motor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tamanho` double DEFAULT NULL,
  `qtd_cilindros` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `motor`
--

INSERT INTO `motor` (`id`, `nome`, `tamanho`, `qtd_cilindros`) VALUES
(1, 'Fire', 1.4, 4),
(2, 'Econoflex', 1.4, 4),
(3, 'EA111', 1.6, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `opicional`
--

CREATE TABLE `opicional` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `opicional`
--

INSERT INTO `opicional` (`id`, `nome`) VALUES
(1, 'Computador de Bordo'),
(2, 'ABS'),
(3, 'Partida Remota');

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf_cnpj` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `senha` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `proprietario`
--

INSERT INTO `proprietario` (`id`, `nome`, `cpf_cnpj`, `email`, `senha`) VALUES
(1, 'José', '000.444.000-55', 'jose@gmail.com', '12345678'),
(2, 'Bianca', '222.444.999-44', 'bianca@gmail.com', '87654321'),
(3, 'Sophia', '999.444.222-33', 'sophia@gmail.com', '87654321');

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_prop`
--

CREATE TABLE `telefone_prop` (
  `id` int(10) UNSIGNED NOT NULL,
  `proprietario_id` int(10) UNSIGNED NOT NULL,
  `telefone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `telefone_prop`
--

INSERT INTO `telefone_prop` (`id`, `proprietario_id`, `telefone`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `id` int(10) UNSIGNED NOT NULL,
  `proprietario_id` int(10) UNSIGNED NOT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `categoria_veiculo_id` int(10) UNSIGNED NOT NULL,
  `modelo_versao_id` int(10) UNSIGNED NOT NULL,
  `ano` int(10) UNSIGNED DEFAULT NULL,
  `preco` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `km` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`id`, `proprietario_id`, `cidade_id`, `categoria_veiculo_id`, `modelo_versao_id`, `ano`, `preco`, `km`) VALUES
(1, 1, 1, 1, 1, 2008, 'R$ 28.000,00', 93000),
(2, 2, 2, 2, 2, 2010, 'R$ 25.000,00', 16000),
(3, 3, 3, 3, 3, 2019, 'R$ 70.800,00', 70000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo_opcional`
--

CREATE TABLE `veiculo_opcional` (
  `id` int(10) UNSIGNED NOT NULL,
  `opicional_id` int(10) UNSIGNED NOT NULL,
  `veiculo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `veiculo_opcional`
--

INSERT INTO `veiculo_opcional` (`id`, `opicional_id`, `veiculo_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `versao`
--

CREATE TABLE `versao` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `versao`
--

INSERT INTO `versao` (`id`, `nome`) VALUES
(1, 'ELX'),
(2, 'MAXX'),
(3, 'CROSS');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_modelo`
-- (See below for the actual view)
--
CREATE TABLE `v_modelo` (
`id` int(10) unsigned
,`modelo` varchar(50)
,`versao` varchar(20)
,`fabricante` varchar(20)
,`motor` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_veiculo`
-- (See below for the actual view)
--
CREATE TABLE `v_veiculo` (
`id` int(10) unsigned
,`proprietario` varchar(250)
,`cidade` varchar(150)
,`estado` varchar(30)
,`categoria` varchar(20)
,`modelo` varchar(50)
,`versao` varchar(20)
,`fabricante` varchar(20)
,`motor` varchar(20)
,`ano` int(10) unsigned
,`preco` varchar(20)
,`km` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Structure for view `v_modelo`
--
DROP TABLE IF EXISTS `v_modelo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_modelo`  AS  select `a`.`id` AS `id`,`b`.`nome` AS `modelo`,`c`.`nome` AS `versao`,`d`.`nome` AS `fabricante`,`e`.`nome` AS `motor` from ((((`modelo_versao` `a` join `modelo` `b`) join `versao` `c`) join `fabricante` `d`) join `motor` `e`) where ((`a`.`modelo_id` = `b`.`id`) and (`a`.`versao_id` = `c`.`id`) and (`b`.`motor_id` = `e`.`id`) and (`b`.`fabricante_id` = `d`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_veiculo`
--
DROP TABLE IF EXISTS `v_veiculo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_veiculo`  AS  select `a`.`id` AS `id`,`b`.`nome` AS `proprietario`,`c`.`nome` AS `cidade`,`d`.`nome` AS `estado`,`e`.`nome` AS `categoria`,`g`.`nome` AS `modelo`,`h`.`nome` AS `versao`,`i`.`nome` AS `fabricante`,`j`.`nome` AS `motor`,`a`.`ano` AS `ano`,`a`.`preco` AS `preco`,`a`.`km` AS `km` from (((((((((`veiculo` `a` join `proprietario` `b`) join `cidade` `c`) join `estado` `d`) join `categoria_veiculo` `e`) join `modelo_versao` `f`) join `modelo` `g`) join `versao` `h`) join `fabricante` `i`) join `motor` `j`) where ((`a`.`proprietario_id` = `b`.`id`) and (`a`.`cidade_id` = `c`.`id`) and (`c`.`estado_id` = `d`.`id`) and (`a`.`categoria_veiculo_id` = `e`.`id`) and (`a`.`modelo_versao_id` = `f`.`id`) and (`f`.`versao_id` = `h`.`id`) and (`f`.`modelo_id` = `g`.`id`) and (`g`.`motor_id` = `j`.`id`) and (`g`.`fabricante_id` = `i`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anuncio`
--
ALTER TABLE `anuncio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anuncio_FKIndex1` (`veiculo_id`);

--
-- Indexes for table `categoria_veiculo`
--
ALTER TABLE `categoria_veiculo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cidade_FKIndex1` (`estado_id`);

--
-- Indexes for table `endereco_prop`
--
ALTER TABLE `endereco_prop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `endereco_prop_FKIndex1` (`cidade_id`),
  ADD KEY `endereco_prop_FKIndex2` (`proprietario_id`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modelo_FKIndex1` (`fabricante_id`),
  ADD KEY `modelo_FKIndex2` (`motor_id`);

--
-- Indexes for table `modelo_versao`
--
ALTER TABLE `modelo_versao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modelo_versao_FKIndex1` (`modelo_id`),
  ADD KEY `modelo_versao_FKIndex2` (`versao_id`);

--
-- Indexes for table `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opicional`
--
ALTER TABLE `opicional`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telefone_prop`
--
ALTER TABLE `telefone_prop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `telefone_prop_FKIndex1` (`proprietario_id`);

--
-- Indexes for table `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `veiculo_FKIndex1` (`modelo_versao_id`),
  ADD KEY `veiculo_FKIndex2` (`categoria_veiculo_id`),
  ADD KEY `veiculo_FKIndex3` (`cidade_id`),
  ADD KEY `veiculo_FKIndex4` (`proprietario_id`);

--
-- Indexes for table `veiculo_opcional`
--
ALTER TABLE `veiculo_opcional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `veiculo_opcional_FKIndex1` (`veiculo_id`),
  ADD KEY `veiculo_opcional_FKIndex2` (`opicional_id`);

--
-- Indexes for table `versao`
--
ALTER TABLE `versao`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anuncio`
--
ALTER TABLE `anuncio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categoria_veiculo`
--
ALTER TABLE `categoria_veiculo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `endereco_prop`
--
ALTER TABLE `endereco_prop`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modelo_versao`
--
ALTER TABLE `modelo_versao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `motor`
--
ALTER TABLE `motor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `opicional`
--
ALTER TABLE `opicional`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `telefone_prop`
--
ALTER TABLE `telefone_prop`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `veiculo_opcional`
--
ALTER TABLE `veiculo_opcional`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `versao`
--
ALTER TABLE `versao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
