-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Out-2021 às 10:57
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
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id_autor`, `nome`) VALUES
(1, 'MARIA JOÃO'),
(2, 'JOÃO MARIA'),
(3, 'PEDRO MIGUEL'),
(4, 'MIGUEL PEDRO'),
(5, 'JOÃO PEDRO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`id_curso`, `nome`) VALUES
(1, 'Redes'),
(2, 'Informática'),
(3, 'Redes Sociais');

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE `editora` (
  `id_editora` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`id_editora`, `nome`) VALUES
(1, 'NOVA'),
(2, 'VELHA'),
(3, 'ATUAL'),
(4, 'MODERNA'),
(5, 'ELLA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `id_emprestimo` int(11) NOT NULL,
  `id_utilizador` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `data` char(8) DEFAULT NULL,
  `hora` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo_livro`
--

CREATE TABLE `emprestimo_livro` (
  `id_livro` int(10) NOT NULL,
  `id_emprestimo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `nome`, `email`) VALUES
(101, 'Joana Kane', 'joanakane@gmail.com'),
(102, 'Nicolas Sparks', 'nicolassparks@gmail.com'),
(103, 'Linda Burn', 'lindaburn@gmail.com'),
(104, 'Joshua King', 'joshuaking@gmail.com'),
(105, 'Wilian Jones', 'wilianjones@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `id_livro` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `ano_publicacao` char(4) DEFAULT NULL,
  `edicao` varchar(80) DEFAULT NULL,
  `isbn` char(8) DEFAULT NULL,
  `id_autor` int(11) NOT NULL,
  `id_editora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`id_livro`, `titulo`, `ano_publicacao`, `edicao`, `isbn`, `id_autor`, `id_editora`) VALUES
(1, 'A presa', '1898', '2ª', '123456', 1, 1),
(2, 'Rapadura é doce', '200', '1ª', '123457', 2, 2),
(3, 'Mas não é mole', '2010', '1ª', '123458', 3, 3),
(4, 'Água mole pedra dura', '2017', '3ª', '1234569', 4, 4),
(5, 'Quem avisa amigo é', '2005', '2ª', '123469', 5, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

CREATE TABLE `utilizador` (
  `id_utilizador` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` char(8) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`id_utilizador`, `nome`, `email`, `senha`, `id_curso`) VALUES
(2021001, 'Juininho Pereira', 'juininhopereira@gmail.com', '123456', 1),
(2021002, 'Maria Joaquina', 'mariajoaquinaa@gmail.com', '123456', 1),
(2021003, 'Pedro Álvares', 'pedroalvares@gmail.com', '123456', 2),
(2021004, 'Dom Pedro I', 'dompedroi@gmail.com', '123456', 3),
(2021005, 'Princesa Isabel', 'princesaisabel@gmail.com', '123456', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Índices para tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`id_editora`);

--
-- Índices para tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`id_emprestimo`),
  ADD KEY `fk_emprestimo_utilizador` (`id_utilizador`),
  ADD KEY `fk_emprestimo_funcionario` (`id_funcionario`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices para tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `fk_livro_autor` (`id_autor`),
  ADD KEY `fk_livro_editora` (`id_editora`);

--
-- Índices para tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`id_utilizador`),
  ADD KEY `id_curso` (`id_curso`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `id_editora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  MODIFY `id_emprestimo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `fk_emprestimo_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  ADD CONSTRAINT `fk_emprestimo_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`);

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `fk_livro_autor` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`),
  ADD CONSTRAINT `fk_livro_editora` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id_editora`);

--
-- Limitadores para a tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD CONSTRAINT `utilizador_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
