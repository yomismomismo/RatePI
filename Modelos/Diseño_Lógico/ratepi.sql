-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2020 a las 00:31:08
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ratepi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnosxproyecto`
--

CREATE TABLE `alumnosxproyecto` (
  `ID` int(11) NOT NULL,
  `ID_Alumno` int(11) NOT NULL,
  `ID_Proyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistentes`
--

CREATE TABLE `asistentes` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistentexvotocategoria`
--

CREATE TABLE `asistentexvotocategoria` (
  `ID` int(11) NOT NULL,
  `ID_Asistente` int(11) NOT NULL,
  `ID_CategoriaXProyecto` int(11) NOT NULL,
  `Puntuacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriavotos`
--

CREATE TABLE `categoriavotos` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaxproyecto`
--

CREATE TABLE `categoriaxproyecto` (
  `ID` int(11) NOT NULL,
  `ID_Categoria` int(11) NOT NULL,
  `ID_Proyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `ID` int(11) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Descripcion` text NOT NULL,
  `CicloFormativo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `alumnosxproyecto`
--
ALTER TABLE `alumnosxproyecto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Proyecto` (`ID_Proyecto`) USING BTREE,
  ADD KEY `ID_Alumno` (`ID_Alumno`) USING BTREE;

--
-- Indices de la tabla `asistentes`
--
ALTER TABLE `asistentes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `asistentexvotocategoria`
--
ALTER TABLE `asistentexvotocategoria`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Asistente` (`ID_Asistente`),
  ADD KEY `ID_CategoriaXProyecto` (`ID_CategoriaXProyecto`);

--
-- Indices de la tabla `categoriavotos`
--
ALTER TABLE `categoriavotos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `categoriaxproyecto`
--
ALTER TABLE `categoriaxproyecto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Categoria` (`ID_Categoria`),
  ADD KEY `ID_Proyecto` (`ID_Proyecto`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `alumnosxproyecto`
--
ALTER TABLE `alumnosxproyecto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `asistentes`
--
ALTER TABLE `asistentes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `asistentexvotocategoria`
--
ALTER TABLE `asistentexvotocategoria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoriavotos`
--
ALTER TABLE `categoriavotos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoriaxproyecto`
--
ALTER TABLE `categoriaxproyecto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnosxproyecto`
--
ALTER TABLE `alumnosxproyecto`
  ADD CONSTRAINT `alumnosxproyecto_ibfk_1` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumnos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumnosxproyecto_ibfk_2` FOREIGN KEY (`ID_Proyecto`) REFERENCES `proyectos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `asistentexvotocategoria`
--
ALTER TABLE `asistentexvotocategoria`
  ADD CONSTRAINT `asistentexvotocategoria_ibfk_1` FOREIGN KEY (`ID_Asistente`) REFERENCES `asistentes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistentexvotocategoria_ibfk_2` FOREIGN KEY (`ID_CategoriaXProyecto`) REFERENCES `categoriaxproyecto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `categoriaxproyecto`
--
ALTER TABLE `categoriaxproyecto`
  ADD CONSTRAINT `categoriaxproyecto_ibfk_1` FOREIGN KEY (`ID_Proyecto`) REFERENCES `proyectos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categoriaxproyecto_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoriavotos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
