-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2016 at 04:58 PM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alexanderflower`
--

-- --------------------------------------------------------

--
-- Table structure for table `anticipos`
--

CREATE TABLE IF NOT EXISTS `anticipos` (
  `cod_anticipo` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_anticipo` date DEFAULT NULL,
  `cod_empleado` varchar(10) DEFAULT NULL,
  `valor_anticipo` double(10,2) DEFAULT NULL,
  `concepto_anticipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_anticipo`),
  KEY `empleadoanti_idx` (`cod_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=big5 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asistencias`
--

CREATE TABLE IF NOT EXISTS `asistencias` (
  `codigo_emple` varchar(10) NOT NULL,
  `fecha_actual` date NOT NULL,
  `hora_entrada` time DEFAULT '00:00:00',
  `hora_salida` time DEFAULT '00:00:00',
  `horas_tra` double(10,5) DEFAULT '0.00000',
  `horas_ext` double(10,5) DEFAULT '0.00000',
  `observacion_asis` varchar(45) DEFAULT NULL,
  `horasalidaa` time DEFAULT '00:00:00',
  `horaentradaa` time DEFAULT '00:00:00',
  `minutosr` int(11) DEFAULT '0',
  PRIMARY KEY (`codigo_emple`,`fecha_actual`),
  KEY `codigo_emplea` (`codigo_emple`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- --------------------------------------------------------

--
-- Table structure for table `bancos`
--

CREATE TABLE IF NOT EXISTS `bancos` (
  `cod_banco` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_banco` varchar(45) NOT NULL,
  `sucursal_banco` varchar(45) DEFAULT NULL,
  `ciudad_banco` int(4) NOT NULL,
  `direccion_banco` varchar(45) NOT NULL,
  `telefono_banco` varchar(10) DEFAULT NULL,
  `email_banco` varchar(45) DEFAULT NULL,
  `estado_banco` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_banco`),
  UNIQUE KEY `nombre_banco_UNIQUE` (`nombre_banco`),
  KEY `ciudadba_idx` (`ciudad_banco`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `bancos`
--

INSERT INTO `bancos` (`cod_banco`, `nombre_banco`, `sucursal_banco`, `ciudad_banco`, `direccion_banco`, `telefono_banco`, `email_banco`, `estado_banco`) VALUES
(8, 'bcp', 'Lima', 4, 'en la calle', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bodega`
--

CREATE TABLE IF NOT EXISTS `bodega` (
  `cod_bodega` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_bodega` varchar(25) NOT NULL,
  `estado_bodega` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_bodega`),
  UNIQUE KEY `nombre_bodega_UNIQUE` (`nombre_bodega`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `bodega`
--

INSERT INTO `bodega` (`cod_bodega`, `nombre_bodega`, `estado_bodega`) VALUES
(4, 'Bodeguita', 1),
(5, 'Intel', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cargos`
--

CREATE TABLE IF NOT EXISTS `cargos` (
  `cod_cargo` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(20) NOT NULL,
  `estado_cargo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_cargo`),
  UNIQUE KEY `nombre_cargo_UNIQUE` (`nombre_cargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cargos`
--

INSERT INTO `cargos` (`cod_cargo`, `nombre_cargo`, `estado_cargo`) VALUES
(5, 'vendedor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `cod_categoria` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(25) NOT NULL,
  `estado_categoria` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_categoria`),
  UNIQUE KEY `nombre_categoria_UNIQUE` (`nombre_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`cod_categoria`, `nombre_categoria`, `estado_categoria`) VALUES
(4, 'computadoras', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cheques`
--

CREATE TABLE IF NOT EXISTS `cheques` (
  `num_cuenta` varchar(45) NOT NULL,
  `num_cheque` varchar(20) NOT NULL,
  `monto_cheque` double(10,2) DEFAULT NULL,
  `fecha_cheque` date DEFAULT NULL,
  `paguese_cheque` varchar(13) DEFAULT NULL,
  `tipo_cheque` int(1) DEFAULT NULL,
  `referencia_cheque` varchar(45) DEFAULT NULL,
  `firma_cheque` varchar(45) DEFAULT NULL,
  `estado_cheque` tinyint(1) DEFAULT NULL,
  `pago_cheque` varchar(10) DEFAULT 'No Cobrado',
  PRIMARY KEY (`num_cheque`,`num_cuenta`),
  KEY `cuentach_idx` (`num_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `cheques`
--

INSERT INTO `cheques` (`num_cuenta`, `num_cheque`, `monto_cheque`, `fecha_cheque`, `paguese_cheque`, `tipo_cheque`, `referencia_cheque`, `firma_cheque`, `estado_cheque`, `pago_cheque`) VALUES
('123', '12', 500.00, '2016-08-03', '1234444444', 1, 'ningunoi', NULL, 1, 'Cobrado H');

-- --------------------------------------------------------

--
-- Table structure for table `cieres`
--

CREATE TABLE IF NOT EXISTS `cieres` (
  `codigo_cierre` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_cierre` date NOT NULL,
  `ganancias` double(10,2) NOT NULL,
  `perdidas` double(10,2) NOT NULL,
  PRIMARY KEY (`codigo_cierre`)
) ENGINE=InnoDB DEFAULT CHARSET=big5 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ciudades`
--

CREATE TABLE IF NOT EXISTS `ciudades` (
  `cod_ciudad` int(4) NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(20) NOT NULL,
  `cod_provincia` int(3) DEFAULT NULL,
  `estado_ciudad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_ciudad`),
  UNIQUE KEY `nombre_ciudad_UNIQUE` (`nombre_ciudad`),
  KEY `ciudadpro` (`cod_provincia`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ciudades`
--

INSERT INTO `ciudades` (`cod_ciudad`, `nombre_ciudad`, `cod_provincia`, `estado_ciudad`) VALUES
(4, 'Arequipa', 3, '1');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `cedula_cliente` varchar(10) NOT NULL,
  `nombres_cliente` varchar(25) NOT NULL,
  `apellidos_cliente` varchar(25) NOT NULL,
  `direccion_cliente` varchar(45) NOT NULL,
  `telefono_cliente` int(7) DEFAULT NULL,
  `ciudad_cliente` int(3) NOT NULL,
  `movil_cliente` varchar(10) DEFAULT NULL,
  `ruc_cliente` varchar(13) DEFAULT NULL,
  `estado_cliente` tinyint(1) NOT NULL,
  `email_cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedula_cliente`),
  KEY `clientesciu` (`ciudad_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`cedula_cliente`, `nombres_cliente`, `apellidos_cliente`, `direccion_cliente`, `telefono_cliente`, `ciudad_cliente`, `movil_cliente`, `ruc_cliente`, `estado_cliente`, `email_cliente`) VALUES
('1234444444', 'kid', 'valeriano', '', 6787888, 4, '', '1234567890', 1, ''),
('1234567311', 'roycer', 'cordova', 'pedregal', 9887878, 4, '', '998877665544', 1, ''),
('1234567891', 'pepito', 'suarez', 'calle', 121212, 4, '', '1234567891234', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `cparametros`
--

CREATE TABLE IF NOT EXISTS `cparametros` (
  `cod_cparamentro` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `cod_cuenta` varchar(10) DEFAULT NULL,
  `nombre_cuenta` varchar(45) DEFAULT NULL,
  `debe` varchar(1) DEFAULT NULL,
  `haber` varchar(1) DEFAULT NULL,
  `cod_pcontabilidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_cparamentro`),
  KEY `pcontabilidad` (`cod_pcontabilidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `cparametros`
--

INSERT INTO `cparametros` (`cod_cparamentro`, `descripcion`, `cod_cuenta`, `nombre_cuenta`, `debe`, `haber`, `cod_pcontabilidad`) VALUES
(11, 'Ventas', '10.1.1', 'Caja', '', 'X', 18),
(12, 'Iva Ventas', '10.1.1.1', 'Caja Chica', '', 'X', 18),
(13, 'Efectivo', '10.1.1.1.1', 'Caja Chica Moneda Nacional', 'X', '', 18),
(14, 'Credito', '16.1', 'Personal', 'X', '', 18),
(15, 'Cheque', '10.1.1', 'Caja', 'X', '', 18),
(16, 'Compras', '11.1', 'Efectos y Cuentas a Pagar', 'X', '', 19),
(17, 'Iva Compras', '10.1.1', 'Caja', 'X', '', 19),
(18, 'Efectivo', '11.1', 'Efectos y Cuentas a Pagar', '', '', 19),
(19, 'Credito', '11.1.1', 'Cuentas a Pagar', '', 'X', 19),
(20, 'Cheque', '10.1.1.1.1', 'Caja Chica Moneda Nacional', '', 'X', 19),
(21, 'Documento por pagar', '10.1', 'Efectivo y equivalentes de efectivo', 'X', '', 20),
(22, 'Bancos', '10.1.1.1', 'Caja Chica', '', 'X', 20),
(23, 'Cuentas por pagar', '10.1', 'Efectivo y equivalentes de efectivo', 'X', '', 21),
(24, 'Efectivo', '10.1.1.1.1', 'Caja Chica Moneda Nacional', '', 'X', 21),
(25, 'Cheque', '15.1', 'Costos de Oper', '', 'X', 21),
(26, 'Cuentas por Cobrar', '10.1.1', 'Caja', '', 'X', 22),
(27, 'Efectivo', '15.1', 'Costos de Oper', 'X', '', 22),
(28, 'Cheque', '8.2', 'efectivo y equivalentes', 'X', '', 22),
(29, 'Gasto Sueldo', '11.1.1.1', 'Proveedores', 'X', '', 23),
(30, 'Gasto Aporte Patronal', '11.1', 'Efectos y Cuentas a Pagar', 'X', '', 23),
(31, 'Aporte Patronal por Pagar', '15.1', 'Costos de Oper', '', 'X', 23),
(32, 'Retencion Aporte Personal', '16.1', 'Personal', '', 'X', 23),
(33, 'Anticipo Quincena', '12.1', 'Reserva Legal', '', 'X', 23),
(34, 'Cheque', '16.1', 'Personal', '', 'X', 23),
(35, 'Anticipos', '10.1', 'Efectivo y equivalentes de efectivo', 'X', '', 24),
(36, 'Bancos', '10.1.1', 'Caja', '', 'X', 24),
(37, 'Documentos por cobrar', '10.1', 'Efectivo y equivalentes de efectivo', '', 'X', 25),
(38, 'Bancos', '11.1.1', 'Cuentas a Pagar', 'X', '', 25);

-- --------------------------------------------------------

--
-- Table structure for table `cuentas`
--

CREATE TABLE IF NOT EXISTS `cuentas` (
  `cod_cuenta` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_cuenta` varchar(75) NOT NULL,
  `estado_cuenta` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_cuenta`),
  UNIQUE KEY `nombre_cuenta_UNIQUE` (`nombre_cuenta`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `cuentas`
--

INSERT INTO `cuentas` (`cod_cuenta`, `nombre_cuenta`, `estado_cuenta`) VALUES
(8, 'activos', 1),
(10, 'activo corriente', 1),
(11, 'Pasivo Corriente', 1),
(12, 'Capital Social', 1),
(15, 'Costos', 1),
(16, 'Personal', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cuentascorr`
--

CREATE TABLE IF NOT EXISTS `cuentascorr` (
  `num_cuentacorr` varchar(45) NOT NULL,
  `cod_banco` int(3) NOT NULL,
  `des_cuentacorr` varchar(45) DEFAULT NULL,
  `saldo_cuentacorr` double(10,2) DEFAULT NULL,
  `estado_cuenta` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`num_cuentacorr`),
  KEY `bancocue_idx` (`cod_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `cuentascorr`
--

INSERT INTO `cuentascorr` (`num_cuentacorr`, `cod_banco`, `des_cuentacorr`, `saldo_cuentacorr`, `estado_cuenta`) VALUES
('123', 8, 'mi cuenta', 6513.00, 1),
('124', 8, 'cuenta de pepipo', 8000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cuentas_cobrar`
--

CREATE TABLE IF NOT EXISTS `cuentas_cobrar` (
  `codigo_cobrar` int(30) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(10) NOT NULL,
  `numero_cuota` varchar(10) NOT NULL,
  `interes` double(10,2) NOT NULL,
  `monto amortizacion` double(10,2) DEFAULT NULL,
  `monto_cuota` double(10,2) NOT NULL,
  `estado_cuota` tinyint(1) NOT NULL,
  `fecha_cobrar` date DEFAULT NULL,
  PRIMARY KEY (`codigo_cobrar`),
  KEY `facturavecod_idx` (`numero_factura`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `cuentas_cobrar`
--

INSERT INTO `cuentas_cobrar` (`codigo_cobrar`, `numero_factura`, `numero_cuota`, `interes`, `monto amortizacion`, `monto_cuota`, `estado_cuota`, `fecha_cobrar`) VALUES
(11, 9, '2', 2.00, 0.00, 1.00, 0, '2016-08-03');

-- --------------------------------------------------------

--
-- Table structure for table `cuentas_pagar`
--

CREATE TABLE IF NOT EXISTS `cuentas_pagar` (
  `codigo_pagar` int(30) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(10) NOT NULL,
  `numero_cuota` varchar(10) NOT NULL,
  `interes` double(10,2) NOT NULL,
  `monto_amortizacion` double(10,2) DEFAULT NULL,
  `monto_cuota` double(10,2) NOT NULL,
  `estado_cuota` tinyint(1) NOT NULL,
  `fecha_pagar` date DEFAULT NULL,
  PRIMARY KEY (`codigo_pagar`),
  KEY `facturacocod_idx` (`numero_factura`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `cuentas_pagar`
--

INSERT INTO `cuentas_pagar` (`codigo_pagar`, `numero_factura`, `numero_cuota`, `interes`, `monto_amortizacion`, `monto_cuota`, `estado_cuota`, `fecha_pagar`) VALUES
(12, 38, '1', 0.00, 0.00, 0.00, 1, '2016-08-01'),
(13, 54, 'Cuota: 1', 19.67, 1175.10, 1194.77, 1, '2016-09-06'),
(14, 54, 'Cuota: 2', 9.87, 1184.90, 1194.77, 1, '2016-10-06');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE IF NOT EXISTS `departamentos` (
  `cod_dep` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_dep` varchar(20) NOT NULL,
  `estado_dep` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_dep`),
  UNIQUE KEY `nombre_dep_UNIQUE` (`nombre_dep`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`cod_dep`, `nombre_dep`, `estado_dep`) VALUES
(14, 'Ventas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `deporeti`
--

CREATE TABLE IF NOT EXISTS `deporeti` (
  `num_cuentacorr` varchar(45) NOT NULL,
  `cod_deporeti` int(11) NOT NULL AUTO_INCREMENT,
  `emision` date DEFAULT NULL,
  `tipo_deporeti` varchar(10) DEFAULT NULL,
  `monto_depo` double(10,2) DEFAULT NULL,
  `referencia_deporeti` varchar(45) DEFAULT NULL,
  `estado_deporeti` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_deporeti`,`num_cuentacorr`),
  KEY `cuentadprt_idx` (`num_cuentacorr`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `deporeti`
--

INSERT INTO `deporeti` (`num_cuentacorr`, `cod_deporeti`, `emision`, `tipo_deporeti`, `monto_depo`, `referencia_deporeti`, `estado_deporeti`) VALUES
('123', 2, '2016-07-31', 'DEPOSITO', 7000.00, 'herencia', 1),
('123', 3, '2016-08-03', 'DEPOSITO', 13.00, 'iji', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_facturaco`
--

CREATE TABLE IF NOT EXISTS `detalle_facturaco` (
  `cod_detallefaco` int(20) NOT NULL AUTO_INCREMENT,
  `cantidad_detalle` int(11) NOT NULL,
  `cod_producto` int(3) NOT NULL,
  `producto_detalle` varchar(45) NOT NULL,
  `valor_unitario` double(10,2) NOT NULL,
  `valor_total` double(10,2) NOT NULL,
  `cod_facturaco` int(10) NOT NULL,
  PRIMARY KEY (`cod_detallefaco`),
  KEY `detallefaco_idx` (`cod_facturaco`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `detalle_facturaco`
--

INSERT INTO `detalle_facturaco` (`cod_detallefaco`, `cantidad_detalle`, `cod_producto`, `producto_detalle`, `valor_unitario`, `valor_total`, `cod_facturaco`) VALUES
(44, 1, 6, 'compu', 2000.00, 2000.00, 38),
(45, 2, 8, 'CPU', 5000.00, 10000.00, 39),
(46, 1, 6, 'compu', 2000.00, 2000.00, 40),
(47, 1, 6, 'compu', 2000.00, 2000.00, 41),
(48, 1, 6, 'compu', 2000.00, 2000.00, 42),
(49, 1, 6, 'compu', 2000.00, 2000.00, 43),
(50, 1, 6, 'compu', 2000.00, 2000.00, 44),
(51, 1, 6, 'compu', 2000.00, 2000.00, 45),
(52, 1, 6, 'compu', 2000.00, 2000.00, 46),
(53, 1, 6, 'compu', 2000.00, 2000.00, 47),
(54, 1, 6, 'compu', 2000.00, 2000.00, 48),
(55, 1, 6, 'compu', 2000.00, 2000.00, 49),
(56, 1, 6, 'compu', 2000.00, 2000.00, 50),
(57, 1, 6, 'compu', 2000.00, 2000.00, 51),
(58, 1, 6, 'compu', 2000.00, 2000.00, 52),
(59, 1, 6, 'compu', 2000.00, 2000.00, 53),
(60, 1, 6, 'compu', 2000.00, 2000.00, 54);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_facturave`
--

CREATE TABLE IF NOT EXISTS `detalle_facturave` (
  `cod_detallefave` int(20) NOT NULL AUTO_INCREMENT,
  `cantidad_detalle` int(5) DEFAULT NULL,
  `cod_producto` int(3) DEFAULT NULL,
  `producto_detalle` varchar(25) DEFAULT NULL,
  `valor_unitario` double(10,2) DEFAULT NULL,
  `valor_total` double(10,2) DEFAULT NULL,
  `cod_facturave` int(10) DEFAULT NULL,
  PRIMARY KEY (`cod_detallefave`),
  KEY `productodefave` (`cod_producto`),
  KEY `facturave` (`cod_facturave`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `detalle_facturave`
--

INSERT INTO `detalle_facturave` (`cod_detallefave`, `cantidad_detalle`, `cod_producto`, `producto_detalle`, `valor_unitario`, `valor_total`, `cod_facturave`) VALUES
(9, 1, 6, 'compu', 2000.00, 2000.00, 9),
(10, 1, 8, 'CPU', 5000.00, 5000.00, 10),
(11, 1, 6, 'compu', 2000.00, 2000.00, 11);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_rol`
--

CREATE TABLE IF NOT EXISTS `detalle_rol` (
  `codigo_det` int(11) NOT NULL AUTO_INCREMENT,
  `numero_rol` int(3) DEFAULT NULL,
  `empleado_rol` varchar(45) DEFAULT NULL,
  `codigo_emprol` varchar(10) DEFAULT NULL,
  `sueldo` double DEFAULT NULL,
  `freserva` double DEFAULT NULL,
  `hextras` int(3) DEFAULT NULL,
  `vextras` double DEFAULT NULL,
  `hsuplementarias` int(3) DEFAULT NULL,
  `vsuplementarias` double DEFAULT NULL,
  `bono` double DEFAULT NULL,
  `tingresos` double DEFAULT NULL,
  `aiess` double DEFAULT NULL,
  `anticipos` double DEFAULT NULL,
  `multas` double DEFAULT NULL,
  `retenciones` double DEFAULT NULL,
  `otros` double DEFAULT NULL,
  `irenta` double DEFAULT NULL,
  `tegresos` double DEFAULT NULL,
  `nrecibir` double DEFAULT NULL,
  `ccorrientes` varchar(20) DEFAULT NULL,
  `ncheques` varchar(20) DEFAULT NULL,
  `codigo_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_det`),
  KEY `empleadorol_idx` (`codigo_emprol`),
  KEY `codrol_idx` (`codigo_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=big5 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `cedula_empleado` varchar(10) NOT NULL,
  `nombres_empleado` varchar(25) NOT NULL,
  `apellidos_empleado` varchar(25) NOT NULL,
  `direccion_empleado` varchar(45) NOT NULL,
  `telefono_empleado` varchar(7) DEFAULT NULL,
  `ciudad_empleado` int(4) DEFAULT NULL,
  `movil_empleado` varchar(10) DEFAULT NULL,
  `estado_empleado` tinyint(4) NOT NULL,
  `email_empleado` varchar(45) DEFAULT NULL,
  `sueldo_empleado` double(10,2) DEFAULT NULL,
  `cod_departamento` int(2) DEFAULT NULL,
  `cod_cargo` int(2) DEFAULT NULL,
  `horali` time DEFAULT NULL,
  `horalf` time DEFAULT NULL,
  `usuario_empleado` varchar(25) DEFAULT NULL,
  `contra_empleado` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`cedula_empleado`),
  KEY `ciuedademple` (`ciudad_empleado`),
  KEY `coddep_idx` (`cod_departamento`),
  KEY `codcargo_idx` (`cod_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`cedula_empleado`, `nombres_empleado`, `apellidos_empleado`, `direccion_empleado`, `telefono_empleado`, `ciudad_empleado`, `movil_empleado`, `estado_empleado`, `email_empleado`, `sueldo_empleado`, `cod_departamento`, `cod_cargo`, `horali`, `horalf`, `usuario_empleado`, `contra_empleado`) VALUES
('00000001', 'empleado', 'emp', '', '', 4, '', 1, '', 800.00, 14, 5, '07:00:00', '01:00:00', 'emp', 'emp'),
('00000002', 'fiorella', 'ramos', 'huitiya', '', 4, '', 1, '', 700.00, 14, 5, '07:00:00', '01:00:00', 'fio', 'fio'),
('00000003', 'Josue', 'guitierres', '', '', 4, '', 1, '', 700.00, 14, 5, '08:00:00', '04:00:00', 'josue', 'josue'),
('00000004', 'alexia', 'alexia', '', '', 4, '', 1, '', 800.00, 14, 5, '07:00:00', '01:00:00', 'alexia', 'alexia'),
('00000005', 'roycer', 'roycer', '', '', 4, '', 1, '', 800.00, 14, 5, '07:00:00', '01:00:00', 'roycer', 'royce'),
('00000006', 'jorge', 'jorge', '', '', 4, '', 1, '', 800.00, 14, 5, '07:00:00', '01:00:00', 'jorge', 'jorge'),
('00000007', 'jhon', 'jhon', '', '', 4, '', 1, '', 800.00, 14, 5, '07:00:00', '01:00:00', 'jhon', 'jhon'),
('00000008', 'kid', 'kid', '', '', 4, '', 1, '', 800.00, 14, 5, '07:00:00', '01:00:00', 'kid', 'kid'),
('00000009', 'david', 'david', '', '', 4, '', 1, '', 800.00, 14, 5, '07:00:00', '01:00:00', 'david', 'david'),
('00000010', 'alejandro', 'alejandro', '', '', 4, '', 1, '', 800.00, 14, 5, '07:00:00', '01:00:00', 'alejandro', 'alejandro');

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `cod_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(25) NOT NULL,
  `direccion_empresa` varchar(45) NOT NULL,
  `ciudad_empresa` int(4) NOT NULL,
  `telefono_empresa` varchar(7) NOT NULL,
  `email_empresa` varchar(45) NOT NULL,
  `codigoms_empresa` varchar(7) DEFAULT NULL,
  `autorizacionsri_empresa` varchar(13) DEFAULT NULL,
  `facturacioni_empresa` int(9) DEFAULT NULL,
  `facturacionf_empresa` int(9) DEFAULT NULL,
  `fechacaducidadf_empresa` date DEFAULT NULL,
  `encargado_empresa` varchar(45) DEFAULT NULL,
  `ruc_empresa` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`cod_empresa`),
  KEY `ciudadempre_idx` (`ciudad_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`cod_empresa`, `nombre_empresa`, `direccion_empresa`, `ciudad_empresa`, `telefono_empresa`, `email_empresa`, `codigoms_empresa`, `autorizacionsri_empresa`, `facturacioni_empresa`, `facturacionf_empresa`, `fechacaducidadf_empresa`, `encargado_empresa`, `ruc_empresa`) VALUES
(4, 'UNSA', '', 4, '', '', NULL, NULL, NULL, NULL, '2017-12-12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facturasco`
--

CREATE TABLE IF NOT EXISTS `facturasco` (
  `cod_facturaco` varchar(7) NOT NULL,
  `numero_facturaco` varchar(9) NOT NULL,
  `ruc_proveedor` varchar(13) NOT NULL,
  `fecha_emision` date NOT NULL,
  `observacion_facturaco` varchar(100) NOT NULL,
  `subtotal_facturaco` double(10,2) NOT NULL,
  `iva_facturaco` double(10,2) NOT NULL,
  `descuento_facturaco` double(10,2) NOT NULL,
  `total_facturaco` double(10,2) NOT NULL,
  `estado_facturaco` tinyint(1) NOT NULL,
  `codigo_fact` int(10) NOT NULL AUTO_INCREMENT,
  `termino_pago` int(2) DEFAULT NULL,
  PRIMARY KEY (`codigo_fact`),
  KEY `proveedorfacturaco_idx` (`ruc_proveedor`),
  KEY `terminocod_idx` (`termino_pago`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `facturasco`
--

INSERT INTO `facturasco` (`cod_facturaco`, `numero_facturaco`, `ruc_proveedor`, `fecha_emision`, `observacion_facturaco`, `subtotal_facturaco`, `iva_facturaco`, `descuento_facturaco`, `total_facturaco`, `estado_facturaco`, `codigo_fact`, `termino_pago`) VALUES
('1234567', '1', '1112345678911', '2016-07-30', 'Observaciones:', 2000.00, 0.00, 0.00, 2000.00, 1, 38, 0),
('7654321', '5', '1234567895511', '2016-07-31', 'Observaciones:', 10000.00, 1800.00, 0.00, 11800.00, 1, 39, 0),
('1234567', '', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 40, 0),
('1234567', '', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 41, 0),
('1234567', '2', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 42, 0),
('1234567', '213', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 43, 0),
('1234567', '213', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 44, 0),
('1234567', '123', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 45, 0),
('1234567', '21', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 46, 0),
('1234567', '123', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 47, 0),
('1234567', '', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 48, 0),
('1234567', '2', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 49, 0),
('1234567', '2', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 50, 0),
('1234567', '12', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 51, 0),
('1234567', '2', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 52, 0),
('1234567', '12', '1112345678911', '2016-08-03', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 53, 0),
('1234567', '2235', '1112345678911', '2016-08-04', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 54, 2);

-- --------------------------------------------------------

--
-- Table structure for table `facturasve`
--

CREATE TABLE IF NOT EXISTS `facturasve` (
  `cod_facturave` varchar(7) NOT NULL,
  `numero_facturave` varchar(9) NOT NULL,
  `numero_cliente` varchar(10) NOT NULL,
  `fecha_emision` date NOT NULL,
  `observacion_facturave` varchar(100) NOT NULL,
  `subtotal_facturave` double(10,2) NOT NULL,
  `iva_facturave` double(10,2) NOT NULL,
  `descuento_facturave` double(10,2) NOT NULL,
  `total_facturave` double(10,2) NOT NULL,
  `estado_facturave` tinyint(1) NOT NULL,
  `codigo_fact` int(10) NOT NULL AUTO_INCREMENT,
  `termino_pago` int(2) DEFAULT NULL,
  PRIMARY KEY (`codigo_fact`),
  KEY `clientefave` (`numero_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `facturasve`
--

INSERT INTO `facturasve` (`cod_facturave`, `numero_facturave`, `numero_cliente`, `fecha_emision`, `observacion_facturave`, `subtotal_facturave`, `iva_facturave`, `descuento_facturave`, `total_facturave`, `estado_facturave`, `codigo_fact`, `termino_pago`) VALUES
('null', '', '1234444444', '2016-07-31', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 9, 0),
('null', '5', '1234567891', '2016-07-31', 'Observaciones:', 5000.00, 900.00, 0.00, 5900.00, 1, 10, 0),
('null', '33', '1234567891', '2016-08-01', 'Observaciones:', 2000.00, 360.00, 0.00, 2360.00, 1, 11, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `facturasventasemitidasmes`
--
CREATE TABLE IF NOT EXISTS `facturasventasemitidasmes` (
`Punto_de_Venta` varchar(7)
,`Cod_Factura` int(10)
,`Numero_Cliente` varchar(10)
,`Fecha_Emision` date
,`total_facturas_ventas` double(10,2)
);
-- --------------------------------------------------------

--
-- Table structure for table `paises`
--

CREATE TABLE IF NOT EXISTS `paises` (
  `cod_pais` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(25) NOT NULL,
  `estado_pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_pais`),
  UNIQUE KEY `nombre_pais_UNIQUE` (`nombre_pais`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `paises`
--

INSERT INTO `paises` (`cod_pais`, `nombre_pais`, `estado_pais`) VALUES
(2, 'Peru', '1');

-- --------------------------------------------------------

--
-- Table structure for table `parametros`
--

CREATE TABLE IF NOT EXISTS `parametros` (
  `cod_parametro` int(4) NOT NULL AUTO_INCREMENT,
  `iva` varchar(5) DEFAULT NULL,
  `iess` varchar(5) DEFAULT NULL,
  `decimotercero` varchar(5) DEFAULT NULL,
  `decimocuarto` varchar(5) DEFAULT NULL,
  `sueldobasico` varchar(5) DEFAULT NULL,
  `fondo_reserva` varchar(5) DEFAULT NULL,
  `bonos` varchar(5) DEFAULT NULL,
  `impuesto_renta` varchar(5) DEFAULT NULL,
  `hora_cierre` time DEFAULT NULL,
  `iesspersonal` varchar(5) DEFAULT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  PRIMARY KEY (`cod_parametro`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `parametros`
--

INSERT INTO `parametros` (`cod_parametro`, `iva`, `iess`, `decimotercero`, `decimocuarto`, `sueldobasico`, `fondo_reserva`, `bonos`, `impuesto_renta`, `hora_cierre`, `iesspersonal`, `hora_ingreso`, `hora_salida`) VALUES
(3, '18', '20', '100', '100', '800', '2000', '100', '5', '20:00:00', '9', '07:00:00', '16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pcontabiidad`
--

CREATE TABLE IF NOT EXISTS `pcontabiidad` (
  `cod_pcontabiidad` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pcontabiidad` varchar(45) NOT NULL,
  `estado_pcontabilidad` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_pcontabiidad`),
  UNIQUE KEY `nom_pcontabiidad_UNIQUE` (`nom_pcontabiidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `pcontabiidad`
--

INSERT INTO `pcontabiidad` (`cod_pcontabiidad`, `nom_pcontabiidad`, `estado_pcontabilidad`) VALUES
(18, 'Factura venta', 1),
(19, 'Factura compra', 1),
(20, 'Cheques por pagar', 1),
(21, 'Cuentas por pagar', 1),
(22, 'Cuentas por cobrar', 1),
(23, 'Rol de Pagos', 1),
(24, 'Anticipos', 1),
(25, 'Cheques por Cobrar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `privilegios`
--

CREATE TABLE IF NOT EXISTS `privilegios` (
  `codigo_usuario` varchar(10) NOT NULL,
  `nombre_usuario` varchar(15) NOT NULL,
  `facturacion` tinyint(1) DEFAULT NULL,
  `iventarios` tinyint(1) DEFAULT NULL,
  `clipro` tinyint(1) DEFAULT NULL,
  `parametros` tinyint(1) DEFAULT NULL,
  `cuentasxcobrar` tinyint(1) DEFAULT NULL,
  `cuentasxpagar` tinyint(1) DEFAULT NULL,
  `contabilidad` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `privilegios`
--

INSERT INTO `privilegios` (`codigo_usuario`, `nombre_usuario`, `facturacion`, `iventarios`, `clipro`, `parametros`, `cuentasxcobrar`, `cuentasxpagar`, `contabilidad`) VALUES
('0000000000', 'root', 1, 1, 1, 1, 1, 1, 1),
('00000001', 'emp', 1, 0, 1, 1, 1, 1, 1),
('00000002', 'fio', 1, 1, 1, 1, 1, 0, 0),
('00000003', 'josue', 1, 1, 1, 1, 1, 0, 0),
('00000004', 'alexia', 1, 1, 1, 1, 1, 0, 0),
('00000005', 'roycer', 1, 1, 1, 1, 1, 0, 0),
('00000006', 'roycer', 1, 1, 1, 1, 1, 0, 0),
('00000007', 'jhon', 1, 1, 1, 1, 1, 0, 0),
('00000008', 'kid', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('00000009', 'david', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('00000010', 'alejandro', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `cod_producto` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(25) NOT NULL,
  `unidad_productoc` int(2) DEFAULT NULL,
  `cantidadi_producto` int(4) DEFAULT NULL,
  `cantidadmi_producto` int(3) DEFAULT NULL,
  `cantidadma_producto` int(11) DEFAULT NULL,
  `proveedor_producto` varchar(13) DEFAULT NULL,
  `subcategoria_producto` int(3) DEFAULT NULL,
  `bodega_producto` int(2) DEFAULT NULL,
  `unidad_productov` int(2) DEFAULT NULL,
  `cantidadauni_producto` int(4) DEFAULT NULL,
  `precio_producto` double(10,2) DEFAULT NULL,
  `estado_producto` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_producto`),
  UNIQUE KEY `nombre_producto_UNIQUE` (`nombre_producto`),
  KEY `proveedorpro` (`proveedor_producto`),
  KEY `subcategoriapro` (`subcategoria_producto`),
  KEY `bodegapro` (`bodega_producto`),
  KEY `unidadpro` (`unidad_productov`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`cod_producto`, `nombre_producto`, `unidad_productoc`, `cantidadi_producto`, `cantidadmi_producto`, `cantidadma_producto`, `proveedor_producto`, `subcategoria_producto`, `bodega_producto`, `unidad_productov`, `cantidadauni_producto`, `precio_producto`, `estado_producto`) VALUES
(6, 'compu', 5, 24, 1, 20, '1112345678911', 6, 4, 5, 20, 2000.00, 1),
(7, 'Laptop', 5, 1, 1, 5, '1112345678911', 6, 4, 5, 8, 1200.00, 1),
(8, 'CPU', 5, 3, 2, 20, '1112345678911', 6, 5, 5, 12, 5000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
  `ruc_proveedor` varchar(13) NOT NULL,
  `nombre_eproveedor` varchar(30) DEFAULT NULL,
  `nombres_proveedor` varchar(20) NOT NULL,
  `apellidos_proveedor` varchar(20) NOT NULL,
  `direccion_proveedor` varchar(45) NOT NULL,
  `ciudad_proveedir` int(4) NOT NULL,
  `telefono_proveedor` varchar(7) DEFAULT NULL,
  `email_proveedor` varchar(30) DEFAULT NULL,
  `codigofms_proveedor` varchar(7) DEFAULT NULL,
  `autorizacionsri_proveedor` varchar(13) DEFAULT NULL,
  `iniciof_proveedor` int(9) DEFAULT NULL,
  `finalizacionf_proveedor` int(9) DEFAULT NULL,
  `fechacf_proveedor` date DEFAULT NULL,
  `estado_proveedor` tinyint(4) NOT NULL,
  PRIMARY KEY (`ruc_proveedor`),
  KEY `ciudadprove_idx` (`ciudad_proveedir`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`ruc_proveedor`, `nombre_eproveedor`, `nombres_proveedor`, `apellidos_proveedor`, `direccion_proveedor`, `ciudad_proveedir`, `telefono_proveedor`, `email_proveedor`, `codigofms_proveedor`, `autorizacionsri_proveedor`, `iniciof_proveedor`, `finalizacionf_proveedor`, `fechacf_proveedor`, `estado_proveedor`) VALUES
('1112345678911', 'nova', 'jhon', 'valdivia', 'calle', 4, '1234567', '', '1234567', '1', 2, 5, '2016-08-18', 1),
('1234567895511', 'intelo', 'Raul', 'Panibra', 'avelino', 4, '7654321', '', '7654321', '2', 2, 29, '2017-07-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--

CREATE TABLE IF NOT EXISTS `provincias` (
  `cod_provincia` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_provincia` varchar(20) NOT NULL,
  `cod_pais` int(2) DEFAULT NULL,
  `estado_provincia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_provincia`),
  UNIQUE KEY `nombre_provincia_UNIQUE` (`nombre_provincia`),
  KEY `provinciapa` (`cod_pais`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`cod_provincia`, `nombre_provincia`, `cod_pais`, `estado_provincia`) VALUES
(3, 'Cayma', 2, '1');

-- --------------------------------------------------------

--
-- Table structure for table `recibos`
--

CREATE TABLE IF NOT EXISTS `recibos` (
  `cod_recibo` int(10) NOT NULL,
  `fecha_emitido` date DEFAULT NULL,
  `doc_cliente` varchar(10) DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `monto` varchar(13) DEFAULT NULL,
  `pagoen` varchar(20) DEFAULT NULL,
  `estado_recibo` tinyint(1) DEFAULT NULL,
  `tipo_recibo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_recibo`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `recibos`
--

INSERT INTO `recibos` (`cod_recibo`, `fecha_emitido`, `doc_cliente`, `observaciones`, `descripcion`, `monto`, `pagoen`, `estado_recibo`, `tipo_recibo`) VALUES
(1, '2016-08-01', '1234', 'Ninguna', 'Cuentas por cobrar', '1.0', 'Efectivo', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `codigo_rol` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_rol` date DEFAULT NULL,
  `periodo_rol` varchar(45) DEFAULT NULL,
  `contador_rol` varchar(10) DEFAULT NULL,
  `autorizacion_rol` varchar(10) DEFAULT NULL,
  `estado_rol` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_rol`),
  KEY `empleadorolc_idx` (`contador_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`codigo_rol`, `fecha_rol`, `periodo_rol`, `contador_rol`, `autorizacion_rol`, `estado_rol`) VALUES
(4, '2016-07-31', 'Periodo', '00000001', '1212121212', 1),
(5, '2016-08-02', 'Periodo', '00000001', '46978503', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcategoria`
--

CREATE TABLE IF NOT EXISTS `subcategoria` (
  `cod_subcategoria` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_subcategoria` varchar(25) NOT NULL,
  `cod_categoria` int(2) DEFAULT NULL,
  `estado_subcategoria` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_subcategoria`),
  UNIQUE KEY `nombre_subcategoria_UNIQUE` (`nombre_subcategoria`),
  KEY `codcategoria_idx` (`cod_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `subcategoria`
--

INSERT INTO `subcategoria` (`cod_subcategoria`, `nombre_subcategoria`, `cod_categoria`, `estado_subcategoria`) VALUES
(6, 'laptop', 4, 1),
(8, 'compu', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subcuenta1`
--

CREATE TABLE IF NOT EXISTS `subcuenta1` (
  `cod_subcuenta1` varchar(10) NOT NULL,
  `nombre_subcuenta1` varchar(75) DEFAULT NULL,
  `cod_subcuenta` varchar(10) DEFAULT NULL,
  `estado_subcuenta1` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_subcuenta1`),
  KEY `subcuentas_idx` (`cod_subcuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `subcuenta1`
--

INSERT INTO `subcuenta1` (`cod_subcuenta1`, `nombre_subcuenta1`, `cod_subcuenta`, `estado_subcuenta1`) VALUES
('10.1.1', 'Caja', '10.1', 1),
('11.1.1', 'Cuentas a Pagar', '11.1', 1),
('15.1.1', 'Compras', '15.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcuenta2`
--

CREATE TABLE IF NOT EXISTS `subcuenta2` (
  `cod_subcuenta2` varchar(10) NOT NULL,
  `nombre_subcuenta2` varchar(75) DEFAULT NULL,
  `cod_subcuenta1` varchar(10) DEFAULT NULL,
  `estado_subcuenta2` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_subcuenta2`),
  KEY `subcuenta1_idx` (`cod_subcuenta1`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `subcuenta2`
--

INSERT INTO `subcuenta2` (`cod_subcuenta2`, `nombre_subcuenta2`, `cod_subcuenta1`, `estado_subcuenta2`) VALUES
('10.1.1.1', 'Caja Chica', '10.1.1', 1),
('11.1.1.1', 'Proveedores', '11.1.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcuenta3`
--

CREATE TABLE IF NOT EXISTS `subcuenta3` (
  `cod_subcuenta3` varchar(10) NOT NULL,
  `nombre_subcuenta3` varchar(75) DEFAULT NULL,
  `cod_subcuenta2` varchar(10) DEFAULT NULL,
  `estado_subcuenta3` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_subcuenta3`),
  KEY `subcuenta2_idx` (`cod_subcuenta2`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `subcuenta3`
--

INSERT INTO `subcuenta3` (`cod_subcuenta3`, `nombre_subcuenta3`, `cod_subcuenta2`, `estado_subcuenta3`) VALUES
('10.1.1.1.1', 'Caja Chica Moneda Nacional', '10.1.1.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcuentas`
--

CREATE TABLE IF NOT EXISTS `subcuentas` (
  `cod_subcuenta` varchar(10) NOT NULL,
  `nombre_subcuenta` varchar(75) NOT NULL,
  `cod_cuenta` int(2) NOT NULL,
  `estado_subcuenta` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_subcuenta`),
  KEY `cod_cuenta1_idx` (`cod_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `subcuentas`
--

INSERT INTO `subcuentas` (`cod_subcuenta`, `nombre_subcuenta`, `cod_cuenta`, `estado_subcuenta`) VALUES
('10.1', 'Efectivo y equivalentes de efectivo', 10, 1),
('11.1', 'Efectos y Cuentas a Pagar', 11, 1),
('12.1', 'Reserva Legal', 12, 1),
('15.1', 'Costos de Oper', 15, 1),
('16.1', 'Personal', 16, 1),
('8.2', 'efectivo y equivalentes', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `terminos_pagos`
--

CREATE TABLE IF NOT EXISTS `terminos_pagos` (
  `cod_pago` int(2) NOT NULL AUTO_INCREMENT,
  `descripcion_termino` varchar(45) NOT NULL,
  `nombre_termino` varchar(45) DEFAULT NULL,
  `pago_inicial` int(3) DEFAULT NULL,
  `pago_dias` int(5) DEFAULT NULL,
  `numero_cuotas` int(5) DEFAULT NULL,
  `tasa_nominal` int(3) DEFAULT NULL,
  `estado_termino` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cod_pago`),
  UNIQUE KEY `descripcion_termino_UNIQUE` (`descripcion_termino`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `terminos_pagos`
--

INSERT INTO `terminos_pagos` (`cod_pago`, `descripcion_termino`, `nombre_termino`, `pago_inicial`, `pago_dias`, `numero_cuotas`, `tasa_nominal`, `estado_termino`) VALUES
(2, 'Credito', 'Monto Inicial', 10, 5, 2, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tipousuario`
--

CREATE TABLE IF NOT EXISTS `tipousuario` (
  `codigo_tipousuario` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_tipousuario` varchar(25) NOT NULL,
  `estado_tipousuario` tinyint(1) NOT NULL,
  PRIMARY KEY (`codigo_tipousuario`),
  UNIQUE KEY `nombre_tipousuario_UNIQUE` (`nombre_tipousuario`)
) ENGINE=InnoDB DEFAULT CHARSET=big5 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transacciones`
--

CREATE TABLE IF NOT EXISTS `transacciones` (
  `cod_trans` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_trans` date DEFAULT NULL,
  `cod_cuenta` varchar(20) DEFAULT NULL,
  `des_cuenta` varchar(45) DEFAULT NULL,
  `debe` double(10,2) DEFAULT '0.00',
  `haber` double(10,2) DEFAULT '0.00',
  `facturaco` int(9) DEFAULT NULL,
  `facturave` int(9) DEFAULT NULL,
  `transmanu` varchar(9) DEFAULT NULL,
  `reciboco` varchar(9) DEFAULT NULL,
  `recibove` varchar(9) DEFAULT NULL,
  `roles` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`cod_trans`),
  KEY `facturacotra` (`facturaco`),
  KEY `facturavetra` (`facturave`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=160 ;

--
-- Dumping data for table `transacciones`
--

INSERT INTO `transacciones` (`cod_trans`, `fecha_trans`, `cod_cuenta`, `des_cuenta`, `debe`, `haber`, `facturaco`, `facturave`, `transmanu`, `reciboco`, `recibove`, `roles`) VALUES
(137, '2016-08-01', '', 'CUENTAS X COBRAR', 0.00, 1.00, NULL, NULL, NULL, '1', NULL, NULL),
(138, '2016-08-01', '', 'CAJA', 1.00, 0.00, NULL, NULL, NULL, '1', NULL, NULL),
(139, '2016-08-01', '12', 'Capital Social', 1000.00, 0.00, NULL, NULL, '1', NULL, NULL, NULL),
(140, '2016-08-01', '16', 'Personal', 0.00, 1000.00, NULL, NULL, '2', NULL, NULL, NULL),
(141, '2016-08-03', '', 'BANCOS', 500.00, 0.00, NULL, NULL, NULL, '3', NULL, NULL),
(142, '2016-08-03', '', 'ANTICIPOS QUINCENA', 0.00, 500.00, NULL, NULL, NULL, '3', NULL, NULL),
(143, '2016-08-03', '11.1', 'Efectos y Cuentas a Pagar', 2000.00, 0.00, 49, NULL, NULL, NULL, NULL, NULL),
(144, '2016-08-03', '10.1.1', 'Caja', 360.00, 0.00, 49, NULL, NULL, NULL, NULL, NULL),
(145, '2016-08-03', '11.1.1', 'Cuentas a Pagar', 0.00, 2360.00, 49, NULL, NULL, NULL, NULL, NULL),
(146, '2016-08-03', '11.1', 'Efectos y Cuentas a Pagar', 2000.00, 0.00, 50, NULL, NULL, NULL, NULL, NULL),
(147, '2016-08-03', '10.1.1', 'Caja', 360.00, 0.00, 50, NULL, NULL, NULL, NULL, NULL),
(148, '2016-08-03', '11.1', 'Efectos y Cuentas a Pagar', 2000.00, 0.00, 51, NULL, NULL, NULL, NULL, NULL),
(149, '2016-08-03', '10.1.1', 'Caja', 360.00, 0.00, 51, NULL, NULL, NULL, NULL, NULL),
(150, '2016-08-03', '11.1.1', 'Cuentas a Pagar', 0.00, 2360.00, 51, NULL, NULL, NULL, NULL, NULL),
(151, '2016-08-03', '11.1', 'Efectos y Cuentas a Pagar', 2000.00, 0.00, 52, NULL, NULL, NULL, NULL, NULL),
(152, '2016-08-03', '10.1.1', 'Caja', 360.00, 0.00, 52, NULL, NULL, NULL, NULL, NULL),
(153, '2016-08-03', '11.1.1', 'Cuentas a Pagar', 0.00, 2360.00, 52, NULL, NULL, NULL, NULL, NULL),
(154, '2016-08-03', '11.1', 'Efectos y Cuentas a Pagar', 2000.00, 0.00, 53, NULL, NULL, NULL, NULL, NULL),
(155, '2016-08-03', '10.1.1', 'Caja', 360.00, 0.00, 53, NULL, NULL, NULL, NULL, NULL),
(156, '2016-08-03', '11.1.1', 'Cuentas a Pagar', 0.00, 2360.00, 53, NULL, NULL, NULL, NULL, NULL),
(157, '2016-08-04', '11.1', 'Efectos y Cuentas a Pagar', 2000.00, 0.00, 54, NULL, NULL, NULL, NULL, NULL),
(158, '2016-08-04', '10.1.1', 'Caja', 360.00, 0.00, 54, NULL, NULL, NULL, NULL, NULL),
(159, '2016-08-04', '11.1.1', 'Cuentas a Pagar', 0.00, 2360.00, 54, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unidades`
--

CREATE TABLE IF NOT EXISTS `unidades` (
  `cod_unidad` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_unidad` varchar(20) NOT NULL,
  `estado_unidad` tinyint(1) NOT NULL,
  PRIMARY KEY (`cod_unidad`),
  UNIQUE KEY `nombre_unidad_UNIQUE` (`nombre_unidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `unidades`
--

INSERT INTO `unidades` (`cod_unidad`, `nombre_unidad`, `estado_unidad`) VALUES
(5, 'Caja', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_estadoscuentalibrodiario`
--
CREATE TABLE IF NOT EXISTS `v_estadoscuentalibrodiario` (
`CUENTA` varchar(20)
,`DESCRIPCION` varchar(45)
,`DEBE` double(19,2)
,`HABER` double(19,2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_facturasemitidasmes`
--
CREATE TABLE IF NOT EXISTS `v_facturasemitidasmes` (
`Punto_de_Venta` varchar(7)
,`Cod_Factura` int(10)
,`Ruc` varchar(13)
,`Fecha_Emision` date
,`V_Total` double(10,2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_ingresos_egresos`
--
CREATE TABLE IF NOT EXISTS `v_ingresos_egresos` (
`Debe` double(19,2)
,`Haber` double(19,2)
,`Egreso` double(19,2)
,`Ingreso` double(19,2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_libro_caja_banco`
--
CREATE TABLE IF NOT EXISTS `v_libro_caja_banco` (
`BANCO` varchar(45)
,`CODIGO_CUENTA` varchar(45)
,`NOMBRE` varchar(45)
,`SALDO` double(10,2)
,`DEPOSITO` double(19,2)
,`RETIRO` double(19,2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_producto`
--
CREATE TABLE IF NOT EXISTS `v_producto` (
`CODIGO` int(3)
,`NOMBRE` varchar(25)
,`CANTIDAD` int(4)
,`VALOR_UNITARIO` double(10,2)
);
-- --------------------------------------------------------

--
-- Structure for view `facturasventasemitidasmes`
--
DROP TABLE IF EXISTS `facturasventasemitidasmes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `facturasventasemitidasmes` AS select `fc`.`cod_facturave` AS `Punto_de_Venta`,`fc`.`codigo_fact` AS `Cod_Factura`,`fc`.`numero_cliente` AS `Numero_Cliente`,`fc`.`fecha_emision` AS `Fecha_Emision`,`fc`.`total_facturave` AS `total_facturas_ventas` from `facturasve` `fc` where (`fc`.`fecha_emision` >= (curdate() - interval 30 day));

-- --------------------------------------------------------

--
-- Structure for view `v_estadoscuentalibrodiario`
--
DROP TABLE IF EXISTS `v_estadoscuentalibrodiario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_estadoscuentalibrodiario` AS select `t`.`cod_cuenta` AS `CUENTA`,`t`.`des_cuenta` AS `DESCRIPCION`,sum(`t`.`debe`) AS `DEBE`,sum(`t`.`haber`) AS `HABER` from `transacciones` `t` where (`t`.`fecha_trans` = curdate()) group by `t`.`cod_cuenta` order by sum(`t`.`debe`) desc;

-- --------------------------------------------------------

--
-- Structure for view `v_facturasemitidasmes`
--
DROP TABLE IF EXISTS `v_facturasemitidasmes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_facturasemitidasmes` AS select `fc`.`cod_facturaco` AS `Punto_de_Venta`,`fc`.`codigo_fact` AS `Cod_Factura`,`fc`.`ruc_proveedor` AS `Ruc`,`fc`.`fecha_emision` AS `Fecha_Emision`,`fc`.`total_facturaco` AS `V_Total` from `facturasco` `fc` where (`fc`.`fecha_emision` >= (curdate() - interval 30 day));

-- --------------------------------------------------------

--
-- Structure for view `v_ingresos_egresos`
--
DROP TABLE IF EXISTS `v_ingresos_egresos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ingresos_egresos` AS select sum(`transacciones`.`debe`) AS `Debe`,sum(`transacciones`.`haber`) AS `Haber`,(sum(`transacciones`.`haber`) - sum(`transacciones`.`debe`)) AS `Egreso`,(sum(`transacciones`.`haber`) - sum(`transacciones`.`debe`)) AS `Ingreso` from `transacciones`;

-- --------------------------------------------------------

--
-- Structure for view `v_libro_caja_banco`
--
DROP TABLE IF EXISTS `v_libro_caja_banco`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_libro_caja_banco` AS select `bancos`.`nombre_banco` AS `BANCO`,`cuentascorr`.`num_cuentacorr` AS `CODIGO_CUENTA`,`cuentascorr`.`des_cuentacorr` AS `NOMBRE`,`cuentascorr`.`saldo_cuentacorr` AS `SALDO`,(select sum(`deporeti`.`monto_depo`) from `deporeti` where ((`deporeti`.`tipo_deporeti` = 'DEPOSITO') and (`deporeti`.`estado_deporeti` = 1))) AS `DEPOSITO`,(select sum(`deporeti`.`monto_depo`) from `deporeti` where ((`deporeti`.`tipo_deporeti` = 'RETIRO') and (`deporeti`.`estado_deporeti` = 1))) AS `RETIRO` from (`cuentascorr` join `bancos` on((`bancos`.`cod_banco` = `cuentascorr`.`cod_banco`)));

-- --------------------------------------------------------

--
-- Structure for view `v_producto`
--
DROP TABLE IF EXISTS `v_producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_producto` AS select `p`.`cod_producto` AS `CODIGO`,`p`.`nombre_producto` AS `NOMBRE`,`p`.`cantidadi_producto` AS `CANTIDAD`,`p`.`precio_producto` AS `VALOR_UNITARIO` from `productos` `p` where (`p`.`estado_producto` = 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anticipos`
--
ALTER TABLE `anticipos`
  ADD CONSTRAINT `empleadoanti` FOREIGN KEY (`cod_empleado`) REFERENCES `empleados` (`cedula_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `codigo_emplea` FOREIGN KEY (`codigo_emple`) REFERENCES `empleados` (`cedula_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bancos`
--
ALTER TABLE `bancos`
  ADD CONSTRAINT `ciudadba` FOREIGN KEY (`ciudad_banco`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cheques`
--
ALTER TABLE `cheques`
  ADD CONSTRAINT `cuentach` FOREIGN KEY (`num_cuenta`) REFERENCES `cuentascorr` (`num_cuentacorr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudadpro` FOREIGN KEY (`cod_provincia`) REFERENCES `provincias` (`cod_provincia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientesciu` FOREIGN KEY (`ciudad_cliente`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cparametros`
--
ALTER TABLE `cparametros`
  ADD CONSTRAINT `pcontabilidad` FOREIGN KEY (`cod_pcontabilidad`) REFERENCES `pcontabiidad` (`cod_pcontabiidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cuentascorr`
--
ALTER TABLE `cuentascorr`
  ADD CONSTRAINT `bancocue` FOREIGN KEY (`cod_banco`) REFERENCES `bancos` (`cod_banco`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cuentas_cobrar`
--
ALTER TABLE `cuentas_cobrar`
  ADD CONSTRAINT `facturavecod` FOREIGN KEY (`numero_factura`) REFERENCES `facturasve` (`codigo_fact`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cuentas_pagar`
--
ALTER TABLE `cuentas_pagar`
  ADD CONSTRAINT `facturacocod` FOREIGN KEY (`numero_factura`) REFERENCES `facturasco` (`codigo_fact`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deporeti`
--
ALTER TABLE `deporeti`
  ADD CONSTRAINT `cuentadprt` FOREIGN KEY (`num_cuentacorr`) REFERENCES `cuentascorr` (`num_cuentacorr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detalle_facturaco`
--
ALTER TABLE `detalle_facturaco`
  ADD CONSTRAINT `facturacodigo` FOREIGN KEY (`cod_facturaco`) REFERENCES `facturasco` (`codigo_fact`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detalle_facturave`
--
ALTER TABLE `detalle_facturave`
  ADD CONSTRAINT `facturave` FOREIGN KEY (`cod_facturave`) REFERENCES `facturasve` (`codigo_fact`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productodefave` FOREIGN KEY (`cod_producto`) REFERENCES `productos` (`cod_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detalle_rol`
--
ALTER TABLE `detalle_rol`
  ADD CONSTRAINT `codrol` FOREIGN KEY (`codigo_rol`) REFERENCES `roles` (`codigo_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleadorol` FOREIGN KEY (`codigo_emprol`) REFERENCES `empleados` (`cedula_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `ciuedademple` FOREIGN KEY (`ciudad_empleado`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `codcargo` FOREIGN KEY (`cod_cargo`) REFERENCES `cargos` (`cod_cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coddep` FOREIGN KEY (`cod_departamento`) REFERENCES `departamentos` (`cod_dep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `ciudadempre` FOREIGN KEY (`ciudad_empresa`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `facturasco`
--
ALTER TABLE `facturasco`
  ADD CONSTRAINT `proveedorfacturaco` FOREIGN KEY (`ruc_proveedor`) REFERENCES `proveedores` (`ruc_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `facturasve`
--
ALTER TABLE `facturasve`
  ADD CONSTRAINT `clientefave` FOREIGN KEY (`numero_cliente`) REFERENCES `clientes` (`cedula_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `bodegapro` FOREIGN KEY (`bodega_producto`) REFERENCES `bodega` (`cod_bodega`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedorpro` FOREIGN KEY (`proveedor_producto`) REFERENCES `proveedores` (`ruc_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subcategoriapro` FOREIGN KEY (`subcategoria_producto`) REFERENCES `subcategoria` (`cod_subcategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `unidadpro` FOREIGN KEY (`unidad_productov`) REFERENCES `unidades` (`cod_unidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `ciudadprove` FOREIGN KEY (`ciudad_proveedir`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `provinciapa` FOREIGN KEY (`cod_pais`) REFERENCES `paises` (`cod_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `empleadorolc` FOREIGN KEY (`contador_rol`) REFERENCES `empleados` (`cedula_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `codcategoria` FOREIGN KEY (`cod_categoria`) REFERENCES `categorias` (`cod_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcuenta1`
--
ALTER TABLE `subcuenta1`
  ADD CONSTRAINT `subcuentas` FOREIGN KEY (`cod_subcuenta`) REFERENCES `subcuentas` (`cod_subcuenta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcuenta2`
--
ALTER TABLE `subcuenta2`
  ADD CONSTRAINT `subcuenta1` FOREIGN KEY (`cod_subcuenta1`) REFERENCES `subcuenta1` (`cod_subcuenta1`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcuenta3`
--
ALTER TABLE `subcuenta3`
  ADD CONSTRAINT `subcuenta2` FOREIGN KEY (`cod_subcuenta2`) REFERENCES `subcuenta2` (`cod_subcuenta2`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcuentas`
--
ALTER TABLE `subcuentas`
  ADD CONSTRAINT `cod_cuenta1` FOREIGN KEY (`cod_cuenta`) REFERENCES `cuentas` (`cod_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `facturacotra` FOREIGN KEY (`facturaco`) REFERENCES `facturasco` (`codigo_fact`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facturavetra` FOREIGN KEY (`facturave`) REFERENCES `facturasve` (`codigo_fact`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

