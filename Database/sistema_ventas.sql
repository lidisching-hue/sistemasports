-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2026 a las 02:23:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id`, `nombre`, `estado`) VALUES
(1, 'Caja Principal', 1),
(2, 'Caja Secundaria', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL DEFAULT '',
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Polos', 'Polos y camisetas deportivas', 1),
(2, 'Camisas', 'Camisas deportivas', 1),
(3, 'Shorts', 'Shorts y bermudas', 1),
(4, 'Buzos', 'Buzos deportivos', 1),
(5, 'Casacas', 'Casacas deportivas', 1),
(6, 'Ropa Deportiva', 'Ropa deportiva general', 1),
(7, 'Gorras Natación', 'Gorras para natación', 1),
(8, 'Lentes Natación', 'Lentes y googles de natación', 1),
(9, 'Tablas Natación', 'Tablas kickboard', 1),
(10, 'Pull Buoy', 'Pull buoy y flotadores', 1),
(11, 'Aletas', 'Aletas de natación', 1),
(12, 'Trajes de Baño', 'Trajes de baño y bikinis', 1),
(13, 'Toallas', 'Toallas deportivas', 1),
(14, 'Flotadores', 'Flotadores y accesorios', 1),
(15, 'Accesorios Buceo', 'Equipos y accesorios de buceo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL DEFAULT '',
  `telefono` varchar(15) NOT NULL DEFAULT '',
  `correo` varchar(100) NOT NULL DEFAULT '',
  `direccion` text NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `dni`, `nombre`, `apellidos`, `telefono`, `correo`, `direccion`, `estado`) VALUES
(1, '00000000', 'Cliente', 'General', '', '', '-', 1),
(2, '71026358', 'Isabelita', 'Nima', '903032661', '', 'Piura - Tambogrande', 1),
(3, '42825337', 'Socorro', 'Nima', '959655695', '', 'Piura - Lima', 1),
(4, '10100892', 'Juan', 'Gomez', '990532456', '', 'Lima - Callao', 1),
(5, '45678901', 'María', 'García Pérez', '987654321', 'maria.g@gmail.com', 'Piura - Castilla', 1),
(6, '56789012', 'Pedro', 'López Torres', '976543210', 'p.lopez@hotmail.com', 'Piura - El Chipe', 1),
(7, '67890123', 'Ana', 'Ramírez Silva', '965432109', '', 'Piura - Miraflores', 1),
(8, '78901234', 'Luis', 'Huanca Quispe', '954321098', 'luis.hq@gmail.com', 'Piura - Los Algarrobos', 1),
(9, '89012345', 'Carmen', 'Villanueva Cruz', '943210987', '', 'Sullana - Centro', 1),
(10, '90123456', 'Roberto', 'Flores Medina', '932109876', 'r.flores@outlook.com', 'Sullana - Urb. Belén', 1),
(11, '01234567', 'Gabriela', 'Castillo Reyes', '921098765', 'gaby.cr@gmail.com', 'Piura - Urb. Miraflores', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `id_proveedor` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL DEFAULT 1,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `igv` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('activa','anulada') NOT NULL DEFAULT 'activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `numero`, `id_proveedor`, `id_usuario`, `subtotal`, `igv`, `total`, `fecha`, `estado`) VALUES
(1, 'C-20260110-0001', 1, 1, 317.80, 57.20, 375.00, '2026-01-10 09:00:00', 'activa'),
(2, 'C-20260115-0002', 2, 1, 893.19, 160.81, 1054.00, '2026-01-15 10:30:00', 'activa'),
(3, 'C-20260120-0003', 3, 1, 427.97, 77.03, 505.00, '2026-01-20 11:00:00', 'activa'),
(4, 'C-20260128-0004', 4, 1, 1016.95, 183.05, 1200.00, '2026-01-28 09:30:00', 'activa'),
(5, 'C-20260130-0005', 5, 1, 813.56, 146.44, 960.00, '2026-01-30 10:00:00', 'activa'),
(6, 'C-20260210-0006', 6, 1, 241.53, 43.47, 285.00, '2026-02-10 08:00:00', 'activa'),
(7, 'C-20260218-0007', 8, 1, 432.19, 77.81, 510.00, '2026-02-18 09:00:00', 'activa'),
(8, 'C-20260305-0008', 2, 1, 355.93, 64.07, 420.00, '2026-03-05 08:30:00', 'activa'),
(9, 'C-20260312-0009', 3, 1, 237.29, 42.71, 280.00, '2026-03-12 09:00:00', 'activa'),
(10, 'C-20260415-0010', 1, 1, 228.81, 41.19, 270.00, '2026-04-15 09:00:00', 'activa'),
(11, 'C-20260616-0011', 3, 1, 834.75, 150.25, 985.00, '2026-06-16 01:15:25', 'activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL DEFAULT 'Mi Tienda',
  `ruc` varchar(11) NOT NULL DEFAULT '',
  `direccion` varchar(250) NOT NULL DEFAULT '',
  `telefono` varchar(20) NOT NULL DEFAULT '',
  `correo` varchar(100) NOT NULL DEFAULT '',
  `logo` varchar(150) NOT NULL DEFAULT 'default_logo.png',
  `moneda` varchar(5) NOT NULL DEFAULT 'S/',
  `igv` decimal(5,2) NOT NULL DEFAULT 18.00,
  `serie_boleta` varchar(4) NOT NULL DEFAULT 'B001',
  `serie_factura` varchar(4) NOT NULL DEFAULT 'F001',
  `correlativo_boleta` int(11) NOT NULL DEFAULT 1,
  `correlativo_factura` int(11) NOT NULL DEFAULT 1,
  `correlativo_ticket` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre_empresa`, `ruc`, `direccion`, `telefono`, `correo`, `logo`, `moneda`, `igv`, `serie_boleta`, `serie_factura`, `correlativo_boleta`, `correlativo_factura`, `correlativo_ticket`) VALUES
(1, 'Oceanika Sports', '20100000001', 'Av. Principal 123, Piura', '073-123456', 'info@oceanikasports.com', 'default_logo.png', 'S/', 18.00, 'B001', 'F001', 5, 3, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`id`, `id_compra`, `id_producto`, `cantidad`, `precio`, `subtotal`) VALUES
(1, 1, 1, 20, 5.00, 100.00),
(2, 1, 2, 10, 20.00, 200.00),
(3, 1, 3, 15, 5.00, 75.00),
(4, 2, 4, 20, 8.00, 160.00),
(5, 2, 5, 8, 18.00, 144.00),
(6, 2, 7, 12, 25.00, 300.00),
(7, 2, 8, 15, 30.00, 450.00),
(8, 3, 6, 10, 15.00, 150.00),
(9, 3, 15, 10, 22.00, 220.00),
(10, 3, 16, 15, 9.00, 135.00),
(11, 4, 9, 25, 22.00, 550.00),
(12, 4, 11, 10, 65.00, 650.00),
(13, 5, 10, 20, 18.00, 360.00),
(14, 5, 12, 8, 75.00, 600.00),
(15, 6, 14, 12, 5.00, 60.00),
(16, 6, 20, 5, 45.00, 225.00),
(17, 7, 13, 20, 12.00, 240.00),
(18, 7, 18, 15, 18.00, 270.00),
(19, 8, 17, 12, 35.00, 420.00),
(20, 9, 19, 10, 28.00, 280.00),
(21, 10, 1, 5, 5.00, 25.00),
(22, 10, 3, 5, 5.00, 25.00),
(23, 10, 9, 10, 22.00, 220.00),
(24, 11, 12, 13, 75.00, 975.00),
(25, 11, 1, 2, 5.00, 10.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo` enum('compra','venta') NOT NULL DEFAULT 'venta',
  `precio` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_temp`
--

INSERT INTO `detalle_temp` (`id`, `id_producto`, `id_usuario`, `tipo`, `precio`, `descuento`, `cantidad`, `subtotal`) VALUES
(4, 12, 1, 'compra', 75.00, 0.00, 3, 225.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `id_venta`, `id_producto`, `cantidad`, `precio`, `descuento`, `subtotal`) VALUES
(1, 1, 1, 2, 15.00, 0.00, 30.00),
(2, 1, 3, 1, 15.00, 0.00, 15.00),
(3, 1, 4, 2, 18.00, 0.00, 36.00),
(4, 2, 9, 2, 45.00, 0.00, 90.00),
(5, 2, 10, 2, 38.00, 0.00, 76.00),
(6, 3, 4, 3, 18.00, 0.00, 54.00),
(7, 3, 6, 2, 28.00, 0.00, 56.00),
(8, 4, 7, 1, 55.00, 0.00, 55.00),
(9, 4, 8, 1, 65.00, 0.00, 65.00),
(10, 4, 16, 2, 20.00, 0.00, 40.00),
(11, 5, 13, 2, 25.00, 0.00, 50.00),
(12, 5, 14, 2, 12.00, 0.00, 24.00),
(13, 5, 15, 2, 48.00, 0.00, 96.00),
(14, 6, 11, 1, 130.00, 0.00, 130.00),
(15, 6, 12, 1, 150.00, 0.00, 150.00),
(16, 6, 9, 2, 45.00, 0.00, 90.00),
(17, 7, 15, 2, 48.00, 0.00, 96.00),
(18, 7, 16, 2, 20.00, 0.00, 40.00),
(19, 7, 17, 1, 72.00, 0.00, 72.00),
(20, 8, 1, 2, 15.00, 0.00, 30.00),
(21, 8, 4, 2, 18.00, 0.00, 36.00),
(22, 8, 13, 3, 25.00, 0.00, 75.00),
(23, 9, 18, 3, 36.00, 0.00, 108.00),
(24, 9, 10, 3, 38.00, 0.00, 114.00),
(25, 10, 2, 1, 30.00, 0.00, 30.00),
(26, 10, 19, 1, 58.00, 0.00, 58.00),
(27, 11, 9, 4, 45.00, 0.00, 180.00),
(28, 11, 10, 4, 38.00, 0.00, 152.00),
(29, 12, 5, 2, 35.00, 0.00, 70.00),
(30, 12, 6, 2, 28.00, 0.00, 56.00),
(31, 12, 16, 2, 20.00, 0.00, 40.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(100) NOT NULL,
  `accion` varchar(500) NOT NULL,
  `modulo` varchar(50) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `id_usuario`, `usuario`, `accion`, `modulo`, `ip`, `fecha`) VALUES
(1, 1, 'Administrador', 'Registró compra C-20260616-0011 por S/ 985', 'Compras', '::1', '2026-06-16 01:15:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario`
--

CREATE TABLE `movimientos_inventario` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `tipo` enum('entrada','salida','ajuste','devolucion','perdida') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `stock_anterior` int(11) NOT NULL DEFAULT 0,
  `stock_actual` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(50) NOT NULL DEFAULT '',
  `motivo` varchar(200) NOT NULL DEFAULT '',
  `id_usuario` int(11) NOT NULL DEFAULT 1,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos_inventario`
--

INSERT INTO `movimientos_inventario` (`id`, `id_producto`, `tipo`, `cantidad`, `stock_anterior`, `stock_actual`, `referencia`, `motivo`, `id_usuario`, `fecha`) VALUES
(1, 1, 'entrada', 20, 0, 20, 'C-20260110-0001', 'Compra #C-20260110-0001', 1, '2026-01-10 09:00:00'),
(2, 2, 'entrada', 10, 0, 10, 'C-20260110-0001', 'Compra #C-20260110-0001', 1, '2026-01-10 09:00:00'),
(3, 3, 'entrada', 15, 0, 15, 'C-20260110-0001', 'Compra #C-20260110-0001', 1, '2026-01-10 09:00:00'),
(4, 4, 'entrada', 20, 0, 20, 'C-20260115-0002', 'Compra #C-20260115-0002', 1, '2026-01-15 10:30:00'),
(5, 5, 'entrada', 8, 0, 8, 'C-20260115-0002', 'Compra #C-20260115-0002', 1, '2026-01-15 10:30:00'),
(6, 7, 'entrada', 12, 0, 12, 'C-20260115-0002', 'Compra #C-20260115-0002', 1, '2026-01-15 10:30:00'),
(7, 8, 'entrada', 15, 0, 15, 'C-20260115-0002', 'Compra #C-20260115-0002', 1, '2026-01-15 10:30:00'),
(8, 6, 'entrada', 10, 0, 10, 'C-20260120-0003', 'Compra #C-20260120-0003', 1, '2026-01-20 11:00:00'),
(9, 15, 'entrada', 10, 0, 10, 'C-20260120-0003', 'Compra #C-20260120-0003', 1, '2026-01-20 11:00:00'),
(10, 16, 'entrada', 15, 0, 15, 'C-20260120-0003', 'Compra #C-20260120-0003', 1, '2026-01-20 11:00:00'),
(11, 1, 'salida', 2, 20, 18, 'T-00000001', 'Venta #T-00000001', 3, '2026-01-25 10:30:00'),
(12, 3, 'salida', 1, 15, 14, 'T-00000001', 'Venta #T-00000001', 3, '2026-01-25 10:30:00'),
(13, 4, 'salida', 2, 20, 18, 'T-00000001', 'Venta #T-00000001', 3, '2026-01-25 10:30:00'),
(14, 9, 'entrada', 25, 0, 25, 'C-20260128-0004', 'Compra #C-20260128-0004', 1, '2026-01-28 09:30:00'),
(15, 11, 'entrada', 10, 0, 10, 'C-20260128-0004', 'Compra #C-20260128-0004', 1, '2026-01-28 09:30:00'),
(16, 10, 'entrada', 20, 0, 20, 'C-20260130-0005', 'Compra #C-20260130-0005', 1, '2026-01-30 10:00:00'),
(17, 12, 'entrada', 8, 0, 8, 'C-20260130-0005', 'Compra #C-20260130-0005', 1, '2026-01-30 10:00:00'),
(18, 9, 'salida', 2, 25, 23, 'B001-00000001', 'Venta #B001-00000001', 2, '2026-02-03 11:15:00'),
(19, 10, 'salida', 2, 20, 18, 'B001-00000001', 'Venta #B001-00000001', 2, '2026-02-03 11:15:00'),
(20, 14, 'entrada', 12, 0, 12, 'C-20260210-0006', 'Compra #C-20260210-0006', 1, '2026-02-10 08:00:00'),
(21, 20, 'entrada', 5, 0, 5, 'C-20260210-0006', 'Compra #C-20260210-0006', 1, '2026-02-10 08:00:00'),
(22, 4, 'salida', 3, 18, 15, 'T-00000002', 'Venta #T-00000002', 3, '2026-02-10 09:45:00'),
(23, 6, 'salida', 2, 10, 8, 'T-00000002', 'Venta #T-00000002', 3, '2026-02-10 09:45:00'),
(24, 7, 'salida', 1, 12, 11, 'B001-00000002', 'Venta #B001-00000002', 2, '2026-02-14 16:20:00'),
(25, 8, 'salida', 1, 15, 14, 'B001-00000002', 'Venta #B001-00000002', 2, '2026-02-14 16:20:00'),
(26, 16, 'salida', 2, 15, 13, 'B001-00000002', 'Venta #B001-00000002', 2, '2026-02-14 16:20:00'),
(27, 13, 'entrada', 20, 0, 20, 'C-20260218-0007', 'Compra #C-20260218-0007', 1, '2026-02-18 09:00:00'),
(28, 18, 'entrada', 15, 0, 15, 'C-20260218-0007', 'Compra #C-20260218-0007', 1, '2026-02-18 09:00:00'),
(29, 13, 'salida', 2, 20, 18, 'T-00000003', 'Venta #T-00000003', 3, '2026-02-20 12:00:00'),
(30, 14, 'salida', 2, 12, 10, 'T-00000003', 'Venta #T-00000003', 3, '2026-02-20 12:00:00'),
(31, 15, 'salida', 2, 10, 8, 'T-00000003', 'Venta #T-00000003', 3, '2026-02-20 12:00:00'),
(32, 17, 'entrada', 12, 0, 12, 'C-20260305-0008', 'Compra #C-20260305-0008', 1, '2026-03-05 08:30:00'),
(33, 11, 'salida', 1, 10, 9, 'F001-00000001', 'Venta #F001-00000001', 2, '2026-03-05 10:00:00'),
(34, 12, 'salida', 1, 8, 7, 'F001-00000001', 'Venta #F001-00000001', 2, '2026-03-05 10:00:00'),
(35, 9, 'salida', 2, 23, 21, 'F001-00000001', 'Venta #F001-00000001', 2, '2026-03-05 10:00:00'),
(36, 15, 'salida', 2, 8, 6, 'B001-00000003', 'Venta #B001-00000003', 2, '2026-03-10 14:30:00'),
(37, 16, 'salida', 2, 13, 11, 'B001-00000003', 'Venta #B001-00000003', 2, '2026-03-10 14:30:00'),
(38, 17, 'salida', 1, 12, 11, 'B001-00000003', 'Venta #B001-00000003', 2, '2026-03-10 14:30:00'),
(39, 19, 'entrada', 10, 0, 10, 'C-20260312-0009', 'Compra #C-20260312-0009', 1, '2026-03-12 09:00:00'),
(40, 1, 'salida', 2, 18, 16, 'T-00000004', 'Venta #T-00000004', 3, '2026-03-20 11:00:00'),
(41, 4, 'salida', 2, 15, 13, 'T-00000004', 'Venta #T-00000004', 3, '2026-03-20 11:00:00'),
(42, 13, 'salida', 3, 18, 15, 'T-00000004', 'Venta #T-00000004', 3, '2026-03-20 11:00:00'),
(43, 18, 'salida', 3, 15, 12, 'B001-00000004', 'Venta #B001-00000004', 2, '2026-04-05 10:00:00'),
(44, 10, 'salida', 3, 18, 15, 'B001-00000004', 'Venta #B001-00000004', 2, '2026-04-05 10:00:00'),
(45, 2, 'salida', 1, 10, 9, 'T-00000005', 'Venta #T-00000005', 3, '2026-04-12 09:30:00'),
(46, 19, 'salida', 1, 10, 9, 'T-00000005', 'Venta #T-00000005', 3, '2026-04-12 09:30:00'),
(47, 1, 'entrada', 5, 16, 21, 'C-20260415-0010', 'Compra #C-20260415-0010', 1, '2026-04-15 09:00:00'),
(48, 3, 'entrada', 5, 14, 19, 'C-20260415-0010', 'Compra #C-20260415-0010', 1, '2026-04-15 09:00:00'),
(49, 9, 'entrada', 10, 21, 31, 'C-20260415-0010', 'Compra #C-20260415-0010', 1, '2026-04-15 09:00:00'),
(50, 9, 'salida', 4, 31, 27, 'F001-00000002', 'Venta #F001-00000002', 2, '2026-04-20 11:00:00'),
(51, 10, 'salida', 4, 15, 11, 'F001-00000002', 'Venta #F001-00000002', 2, '2026-04-20 11:00:00'),
(52, 5, 'salida', 2, 8, 6, 'T-00000006', 'Venta #T-00000006', 3, '2026-05-03 10:00:00'),
(53, 6, 'salida', 2, 8, 6, 'T-00000006', 'Venta #T-00000006', 3, '2026-05-03 10:00:00'),
(54, 16, 'salida', 2, 11, 9, 'T-00000006', 'Venta #T-00000006', 3, '2026-05-03 10:00:00'),
(55, 12, 'entrada', 13, 7, 20, 'C-20260616-0011', 'Compra #C-20260616-0011', 1, '2026-06-16 01:15:25'),
(56, 1, 'entrada', 2, 21, 23, 'C-20260616-0011', 'Compra #C-20260616-0011', 1, '2026-06-16 01:15:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `codigo_barras` varchar(50) NOT NULL DEFAULT '',
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `id_categoria` int(11) NOT NULL DEFAULT 1,
  `marca` varchar(50) NOT NULL DEFAULT '',
  `talla` varchar(20) NOT NULL DEFAULT '',
  `color` varchar(30) NOT NULL DEFAULT '',
  `genero` enum('Unisex','Masculino','Femenino','Niño','Niña') NOT NULL DEFAULT 'Unisex',
  `precio_compra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_venta` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `stock_minimo` int(11) NOT NULL DEFAULT 5,
  `foto` varchar(150) NOT NULL DEFAULT 'default.png',
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `codigo_barras`, `nombre`, `descripcion`, `id_categoria`, `marca`, `talla`, `color`, `genero`, `precio_compra`, `precio_venta`, `stock`, `stock_minimo`, `foto`, `estado`) VALUES
(1, 'P001', '7501000000001', 'Lentes Whale', 'Lentes de natación marca Whale', 8, 'Whale', 'Único', 'Negro', 'Unisex', 5.00, 15.00, 23, 5, '20260608062459.jpg', 1),
(2, 'P002', '7501000000002', 'Wetsuit Niña', 'Traje de buceo para niña', 15, 'Generic', 'S', 'Azul', 'Niña', 20.00, 30.00, 9, 3, '20260608062634.jpg', 1),
(3, 'P003', '7501000000003', 'Gafas de Natación', 'Gafas para natación transparentes', 8, 'Generic', 'Único', 'Transparente', 'Unisex', 5.00, 15.00, 19, 5, 'default.png', 1),
(4, 'P004', '7501000000004', 'Gorra de Natación Silicona', 'Gorra de natación silicona antideslizante', 7, 'Arena', 'Único', 'Azul', 'Unisex', 8.00, 18.00, 13, 5, 'default.png', 1),
(5, 'P005', '7501000000005', 'Tabla Kickboard Speedo', 'Tabla de natación kickboard Speedo', 9, 'Speedo', 'Único', 'Azul/Blanco', 'Unisex', 18.00, 35.00, 6, 3, 'default.png', 1),
(6, 'P006', '7501000000006', 'Pull Buoy Arena', 'Pull buoy de entrenamiento Arena', 10, 'Arena', 'Único', 'Rojo/Blanco', 'Unisex', 15.00, 28.00, 6, 3, 'default.png', 1),
(7, 'P007', '7501000000007', 'Aletas Cortas Speedo', 'Aletas cortas de entrenamiento Speedo', 11, 'Speedo', '38-42', 'Negro', 'Unisex', 25.00, 55.00, 11, 5, 'default.png', 1),
(8, 'P008', '7501000000008', 'Traje Baño Speedo Hombre', 'Traje de baño Speedo Endurance hombre', 12, 'Speedo', 'M', 'Negro', 'Masculino', 30.00, 65.00, 14, 5, 'default.png', 1),
(9, 'P009', '7501000000009', 'Polo Deportivo Nike', 'Polo dry-fit Nike Dri-FIT manga corta', 1, 'Nike', 'M', 'Celeste', 'Masculino', 22.00, 45.00, 27, 8, 'default.png', 1),
(10, 'P010', '7501000000010', 'Short Deportivo Adidas', 'Short deportivo Adidas 3 tiras', 3, 'Adidas', 'M', 'Negro', 'Masculino', 18.00, 38.00, 11, 8, 'default.png', 1),
(11, 'P011', '7501000000011', 'Casaca Nike Windrunner', 'Casaca deportiva Nike Windrunner cortaviento', 5, 'Nike', 'L', 'Azul Navy', 'Masculino', 65.00, 130.00, 9, 5, 'default.png', 1),
(12, 'P012', '7501000000012', 'Buzo Adidas Tiro', 'Buzo completo Adidas Tiro Training', 4, 'Adidas', 'M', 'Negro/Blanco', 'Unisex', 75.00, 150.00, 20, 8, 'default.png', 1),
(13, 'P013', '7501000000013', 'Toalla Microfibra Speedo', 'Toalla microfibra natación Speedo 70×140cm', 13, 'Speedo', 'Único', 'Azul', 'Unisex', 12.00, 25.00, 15, 5, 'default.png', 1),
(14, 'P014', '7501000000014', 'Flotadores Brazalete Niño', 'Flotadores de brazos para niños 3-6 años', 14, 'Generic', '3-6a', 'Naranja', 'Niño', 5.00, 12.00, 10, 5, 'default.png', 1),
(15, 'P015', '7501000000015', 'Lentes Arena Pro', 'Lentes profesionales Arena Pro Speed', 8, 'Arena', 'Único', 'Negro/Dorado', 'Unisex', 22.00, 48.00, 6, 5, 'default.png', 1),
(16, 'P016', '7501000000016', 'Gorra Natación Arena', 'Gorra silicona premium Arena Racing', 7, 'Arena', 'Único', 'Rojo', 'Unisex', 9.00, 20.00, 9, 5, 'default.png', 1),
(17, 'P017', '7501000000017', 'Traje Baño Speedo Mujer', 'Traje de baño Speedo Fit Pro mujer', 12, 'Speedo', 'S', 'Negro/Dorado', 'Femenino', 35.00, 72.00, 11, 5, 'default.png', 1),
(18, 'P018', '7501000000018', 'Camisa Polo Deportiva', 'Camisa polo deportiva piqué manga corta', 2, 'Generic', 'M', 'Blanco', 'Unisex', 18.00, 36.00, 12, 8, 'default.png', 1),
(19, 'P019', '7501000000019', 'Aletas Entrenamiento Arena', 'Aletas cortas de entrenamiento Arena Fin', 11, 'Arena', '38-40', 'Azul', 'Unisex', 28.00, 58.00, 9, 5, 'default.png', 1),
(20, 'P020', '7501000000020', 'Equipo Snorkel Básico', 'Kit snorkel+aleta básico para buceo recreativo', 15, 'Generic', 'Único', 'Azul/Negro', 'Unisex', 45.00, 95.00, 5, 5, 'default.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `ruc` varchar(11) NOT NULL DEFAULT '',
  `razon_social` varchar(150) NOT NULL,
  `contacto` varchar(100) NOT NULL DEFAULT '',
  `telefono` varchar(15) NOT NULL DEFAULT '',
  `correo` varchar(100) NOT NULL DEFAULT '',
  `direccion` text NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `ruc`, `razon_social`, `contacto`, `telefono`, `correo`, `direccion`, `estado`) VALUES
(1, '20601234567', 'Distribuidora Deportiva SAC', 'Carlos López', '01-4567890', 'ventas@distribuidora.com', 'Lima - Miraflores', 1),
(2, '20345678901', 'Speedo Peru SAC', 'Marco Rivera', '01-3456789', 'ventas@speedoperu.com', 'Lima - San Isidro', 1),
(3, '20456789012', 'Arena Sports SAC', 'Lucia Méndez', '01-5678901', 'pedidos@arenasports.pe', 'Lima - Surco', 1),
(4, '20567890123', 'Nike Peru SAC', 'Carlos Torres', '01-6789012', 'b2b@nike.pe', 'Lima - La Victoria', 1),
(5, '20678901234', 'Adidas Peru SAC', 'Ana Gutiérrez', '01-7890123', 'ventas@adidas.pe', 'Lima - Miraflores', 1),
(6, '20789012345', 'Importaciones Acuática SAC', 'Roberto Paz', '073-234567', 'info@acuatica.pe', 'Piura - Centro', 1),
(7, '20890123456', 'Deportes Olimpo SAC', 'Sandra Vega', '01-8901234', 'ventas@olimpo.pe', 'Lima - Ate', 1),
(8, '20901234567', 'Textiles Deportivos Peru SAC', 'Miguel Santos', '01-9012345', 'pedidos@textildeport.pe', 'Lima - San Juan', 1),
(9, '20012345678', 'Cosmos Sports SAC', 'Patricia Ruiz', '01-0123456', 'cosmos@sports.pe', 'Lima - Independencia', 1),
(10, '20123456789', 'Acuasport Distribuciones SAC', 'Jorge Medina', '073-345678', 'acuasport@distribuciones.pe', 'Piura - Urb. Miraflores', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones_caja`
--

CREATE TABLE `sesiones_caja` (
  `id` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `monto_inicial` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto_final` decimal(10,2) DEFAULT NULL,
  `ventas_efectivo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ventas_yape` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ventas_plin` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ventas_tarjeta` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ventas_transferencia` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_ventas` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha_apertura` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` enum('abierta','cerrada') NOT NULL DEFAULT 'abierta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sesiones_caja`
--

INSERT INTO `sesiones_caja` (`id`, `id_caja`, `id_usuario`, `monto_inicial`, `monto_final`, `ventas_efectivo`, `ventas_yape`, `ventas_plin`, `ventas_tarjeta`, `ventas_transferencia`, `total_ventas`, `fecha_apertura`, `fecha_cierre`, `estado`) VALUES
(1, 1, 2, 200.00, 200.00, 0.00, 374.00, 0.00, 160.00, 370.00, 904.00, '2026-01-10 08:00:00', '2026-03-31 18:00:00', 'cerrada'),
(2, 2, 3, 100.00, 432.00, 332.00, 0.00, 170.00, 0.00, 0.00, 502.00, '2026-01-15 08:00:00', '2026-03-31 18:00:00', 'cerrada'),
(3, 1, 2, 200.00, 422.00, 222.00, 0.00, 0.00, 0.00, 332.00, 554.00, '2026-04-01 08:00:00', '2026-05-31 18:00:00', 'cerrada'),
(4, 2, 3, 100.00, 266.00, 166.00, 88.00, 0.00, 0.00, 0.00, 254.00, '2026-04-01 08:00:00', '2026-05-31 18:00:00', 'cerrada'),
(5, 1, 2, 200.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-06-01 08:00:00', NULL, 'abierta'),
(6, 2, 3, 100.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2026-06-01 08:00:00', NULL, 'abierta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `rol` enum('admin','vendedor','almacen') NOT NULL DEFAULT 'vendedor',
  `id_caja` int(11) NOT NULL DEFAULT 1,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `nombre`, `clave`, `rol`, `id_caja`, `estado`) VALUES
(1, 'admin', 'Administrador', '$2y$12$5d8UXk.tdTL/aGrY9VRZgOue.FwXhzBkzQ6OpwJTcrxfgiDWy6C8q', 'admin', 1, 1),
(2, 'Jessy', 'Jessica Huertas', '3ed23197a0865b6d7eaec04eff603145ce6b09e9d4af8a438cc416cdbf9b7b95', 'admin', 1, 1),
(3, 'Isa', 'Isabel Nima Huertas', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'vendedor', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `tipo_doc` enum('ticket','boleta','factura') NOT NULL DEFAULT 'ticket',
  `id_cliente` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL DEFAULT 1,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `igv` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `metodo_pago` enum('efectivo','yape','plin','tarjeta','transferencia','mixto') NOT NULL DEFAULT 'efectivo',
  `monto_recibido` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vuelto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('completada','anulada') NOT NULL DEFAULT 'completada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `numero`, `tipo_doc`, `id_cliente`, `id_usuario`, `id_caja`, `subtotal`, `descuento`, `igv`, `total`, `metodo_pago`, `monto_recibido`, `vuelto`, `fecha`, `estado`) VALUES
(1, 'T-00000001', 'ticket', 1, 3, 2, 68.64, 0.00, 12.36, 81.00, 'efectivo', 100.00, 19.00, '2026-01-25 10:30:00', 'completada'),
(2, 'B001-00000001', 'boleta', 2, 2, 1, 140.68, 0.00, 25.32, 166.00, 'yape', 166.00, 0.00, '2026-02-03 11:15:00', 'completada'),
(3, 'T-00000002', 'ticket', 1, 3, 2, 93.22, 0.00, 16.78, 110.00, 'efectivo', 130.00, 20.00, '2026-02-10 09:45:00', 'completada'),
(4, 'B001-00000002', 'boleta', 3, 2, 1, 135.59, 0.00, 24.41, 160.00, 'tarjeta', 160.00, 0.00, '2026-02-14 16:20:00', 'completada'),
(5, 'T-00000003', 'ticket', 1, 3, 2, 144.07, 0.00, 25.93, 170.00, 'plin', 170.00, 0.00, '2026-02-20 12:00:00', 'completada'),
(6, 'F001-00000001', 'factura', 10, 2, 1, 313.56, 0.00, 56.44, 370.00, 'transferencia', 370.00, 0.00, '2026-03-05 10:00:00', 'completada'),
(7, 'B001-00000003', 'boleta', 4, 2, 1, 176.27, 0.00, 31.73, 208.00, 'yape', 208.00, 0.00, '2026-03-10 14:30:00', 'completada'),
(8, 'T-00000004', 'ticket', 1, 3, 2, 119.49, 0.00, 21.51, 141.00, 'efectivo', 150.00, 9.00, '2026-03-20 11:00:00', 'completada'),
(9, 'B001-00000004', 'boleta', 5, 2, 1, 188.14, 0.00, 33.86, 222.00, 'efectivo', 250.00, 28.00, '2026-04-05 10:00:00', 'completada'),
(10, 'T-00000005', 'ticket', 1, 3, 2, 74.58, 0.00, 13.42, 88.00, 'yape', 88.00, 0.00, '2026-04-12 09:30:00', 'completada'),
(11, 'F001-00000002', 'factura', 6, 2, 1, 281.36, 0.00, 50.64, 332.00, 'transferencia', 332.00, 0.00, '2026-04-20 11:00:00', 'completada'),
(12, 'T-00000006', 'ticket', 1, 3, 2, 140.68, 0.00, 25.32, 166.00, 'efectivo', 200.00, 34.00, '2026-05-03 10:00:00', 'completada');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `idx_clientes_nombre` (`nombre`,`apellidos`),
  ADD KEY `idx_clientes_telefono` (`telefono`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario_tipo` (`id_usuario`,`tipo`),
  ADD KEY `fk_temp_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `idx_detalle_producto` (`id_producto`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fecha` (`fecha`),
  ADD KEY `idx_modulo` (`modulo`);

--
-- Indices de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `fecha` (`fecha`),
  ADD KEY `fk_mov_usuario` (`id_usuario`),
  ADD KEY `idx_mov_producto_fecha` (`id_producto`,`fecha`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `idx_productos_nombre` (`nombre`),
  ADD KEY `idx_productos_stock` (`stock`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sesiones_caja`
--
ALTER TABLE `sesiones_caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_caja` (`id_caja`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `id_caja` (`id_caja`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_caja` (`id_caja`),
  ADD KEY `idx_ventas_fecha` (`fecha`),
  ADD KEY `idx_ventas_estado` (`estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sesiones_caja`
--
ALTER TABLE `sesiones_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `com_prov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `com_usr` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `dc_compra` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dc_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `fk_temp_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_temp_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `dv_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `dv_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD CONSTRAINT `fk_mov_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mov_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `pro_cat` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `sesiones_caja`
--
ALTER TABLE `sesiones_caja`
  ADD CONSTRAINT `sc_caja` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sc_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usr_caja` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ven_caja` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `ven_cli` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `ven_usr` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
