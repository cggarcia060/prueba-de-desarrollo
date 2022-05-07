-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-05-2022 a las 22:13:24
-- Versión del servidor: 8.0.18
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_transaccional`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE IF NOT EXISTS `cuenta` (
  `cuen_id` int(11) NOT NULL AUTO_INCREMENT,
  `cue_nombre` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `cue_saldo` int(11) NOT NULL,
  PRIMARY KEY (`cuen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`cuen_id`, `cue_nombre`, `cue_saldo`) VALUES
(1, 'cuenta ahorro 123457', 4407);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE IF NOT EXISTS `movimientos` (
  `mov_id` int(11) NOT NULL AUTO_INCREMENT,
  `mov_fecha` date NOT NULL,
  `mov_hora` time NOT NULL,
  `mov_valor` int(11) NOT NULL,
  `mov_descripcion` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  PRIMARY KEY (`mov_id`),
  KEY `cuenta_id` (`cuenta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`mov_id`, `mov_fecha`, `mov_hora`, `mov_valor`, `mov_descripcion`, `cuenta_id`) VALUES
(43, '2022-05-06', '16:45:11', 100, 'Tranferencia, abono a la cuenta de ahorro 123457 por valor de $', 1),
(44, '2022-05-06', '16:46:47', 100, 'Tranferencia, retiro de dinero de la cuenta ahorro 123457 por valor de $', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `usuario`, `nombre`, `apellido`, `password`) VALUES
(1, 1049536060, 'Carlos', 'Garcia', '81dc9bdb52d04dc20036dbd8313ed055');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`cuenta_id`) REFERENCES `cuenta` (`cuen_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
