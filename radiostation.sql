-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-02-2025 a las 02:28:01
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `radiostation`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locutor`
--

CREATE TABLE `locutor` (
  `CodigoLocutor` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Experiencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `musica`
--

CREATE TABLE `musica` (
  `CodigoMusica` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `CodigoTipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programacion`
--

CREATE TABLE `programacion` (
  `CodigoProgramacion` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `HoraInicio` time NOT NULL,
  `HoraFin` time NOT NULL,
  `CodigoTipo` varchar(25) NOT NULL,
  `Frecuencia` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_locutor`
--

CREATE TABLE `programa_locutor` (
  `CodigoProgramacion` int(11) NOT NULL,
  `CodigoLocutor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `Codigo` varchar(25) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`Codigo`, `Nombre`) VALUES
('EVE', 'Evento'),
('MUS', 'Musical'),
('NOT', 'Noticiero'),
('POD', 'Podcast');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `locutor`
--
ALTER TABLE `locutor`
  ADD PRIMARY KEY (`CodigoLocutor`);

--
-- Indices de la tabla `musica`
--
ALTER TABLE `musica`
  ADD PRIMARY KEY (`CodigoMusica`),
  ADD KEY `CodigoTipo` (`CodigoTipo`);

--
-- Indices de la tabla `programacion`
--
ALTER TABLE `programacion`
  ADD PRIMARY KEY (`CodigoProgramacion`),
  ADD KEY `CodigoTipo` (`CodigoTipo`);

--
-- Indices de la tabla `programa_locutor`
--
ALTER TABLE `programa_locutor`
  ADD PRIMARY KEY (`CodigoProgramacion`,`CodigoLocutor`),
  ADD KEY `CodigoLocutor` (`CodigoLocutor`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`Codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `locutor`
--
ALTER TABLE `locutor`
  MODIFY `CodigoLocutor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `musica`
--
ALTER TABLE `musica`
  MODIFY `CodigoMusica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programacion`
--
ALTER TABLE `programacion`
  MODIFY `CodigoProgramacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `musica`
--
ALTER TABLE `musica`
  ADD CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`CodigoTipo`) REFERENCES `tipo` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `programacion`
--
ALTER TABLE `programacion`
  ADD CONSTRAINT `programacion_ibfk_1` FOREIGN KEY (`CodigoTipo`) REFERENCES `tipo` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `programa_locutor`
--
ALTER TABLE `programa_locutor`
  ADD CONSTRAINT `programa_locutor_ibfk_1` FOREIGN KEY (`CodigoProgramacion`) REFERENCES `programacion` (`CodigoProgramacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `programa_locutor_ibfk_2` FOREIGN KEY (`CodigoLocutor`) REFERENCES `locutor` (`CodigoLocutor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
