-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Out-2021 às 13:30
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome`, `descricao`) VALUES
(1, 'Informática', 'Produtos informático em geral'),
(2, 'Escritório', 'Produtos de escritório em geral'),
(3, 'Instrumentos Musicais', 'Instrumentos musicais diversos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nif` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `morada` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nif`, `nome`, `morada`, `telefone`) VALUES
(1, 29000001, 'Maria João', 'Rua da Maria 10', '99999999'),
(2, 29000002, 'Pedro Miguel', 'Rua do Pedro 10', '99999999'),
(3, 29000003, 'Nuno Joaquim', 'Rua do João 10', '99999999');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `nif` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `morada` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `nif`, `nome`, `morada`, `telefone`) VALUES
(1, 25000001, 'InfoStore LDA', 'Rua da Informática 101', '99999999'),
(2, 25000002, 'OfficeStore LDA', 'Rua do Escritório 101', '99999999'),
(3, 25000003, 'MusicStore LDA', 'Rua da Música 101', '99999999');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itenspedidos`
--

CREATE TABLE `itenspedidos` (
  `id_pedido` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `preco_unitario` float DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itenspedidos`
--

INSERT INTO `itenspedidos` (`id_pedido`, `id_produto`, `preco_unitario`, `quantidade`) VALUES
(1, 1, 49.9, 1),
(2, 2, 149.9, 2),
(3, 3, 249.9, 1),
(1, 2, 149.9, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `data_pedido` varchar(10) DEFAULT NULL,
  `data_envio` varchar(10) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nome_destinatario` varchar(50) DEFAULT NULL,
  `morada_destinatario` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `data_pedido`, `data_envio`, `id_cliente`, `nome_destinatario`, `morada_destinatario`) VALUES
(1, '12/10/2021', '20/10/2021', 1, 'Maria', 'A de sempre'),
(2, '11/10/2021', '19/10/2021', 2, 'Pedro', 'A de sempre'),
(3, '10/10/2021', '18/10/2021', 3, 'Nuno', 'A de sempre');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome`, `quantidade`, `preco`, `id_fornecedor`, `id_categoria`) VALUES
(1, 'Rato Gamer', 100, 49.9, 1, 1),
(2, 'Cadeira Gamer', 100, 149.9, 2, 2),
(3, 'Guitarra Fender', 100, 249.9, 3, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices para tabela `itenspedidos`
--
ALTER TABLE `itenspedidos`
  ADD KEY `fk_itenspedidos_pedidos` (`id_pedido`),
  ADD KEY `fk_itenspedidos_produtos` (`id_produto`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedidos_clientes` (`id_cliente`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `fk_produtos_fornecedor` (`id_fornecedor`),
  ADD KEY `fk_produtos_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itenspedidos`
--
ALTER TABLE `itenspedidos`
  ADD CONSTRAINT `fk_itenspedidos_pedidos` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `fk_itenspedidos_produtos` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_produtos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `fk_produtos_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
