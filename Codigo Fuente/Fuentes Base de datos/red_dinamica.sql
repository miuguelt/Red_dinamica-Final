-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-11-2014 a las 20:09:17
-- Versión del servidor: 5.5.25a
-- Versión de PHP: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `red_dinamica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AdministrarEventos`
--

CREATE TABLE IF NOT EXISTS `AdministrarEventos` (
  `admin_usr_id` int(11) NOT NULL,
  `admin_evento_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_usr_id`,`admin_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Eventos2_idx` (`admin_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Usuarios2_idx` (`admin_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `AdministrarEventos`
--

INSERT INTO `AdministrarEventos` (`admin_usr_id`, `admin_evento_id`) VALUES
(1, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Agenda`
--

CREATE TABLE IF NOT EXISTS `Agenda` (
  `agenda_usr_id` int(11) NOT NULL,
  `agenda_evento_id` int(11) NOT NULL,
  `agenda_día` date DEFAULT NULL,
  `agenda_hora_inicio` time DEFAULT NULL,
  `agenda_hora_fin` time DEFAULT NULL,
  `agenda_actividad` varchar(200) DEFAULT NULL,
  `agenda_lugar` varchar(100) DEFAULT NULL,
  `agenda_tipo` tinyint(1) DEFAULT NULL COMMENT '1 Ponencia',
  PRIMARY KEY (`agenda_usr_id`,`agenda_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Eventos1_idx` (`agenda_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Usuarios1_idx` (`agenda_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Agenda`
--

INSERT INTO `Agenda` (`agenda_usr_id`, `agenda_evento_id`, `agenda_día`, `agenda_hora_inicio`, `agenda_hora_fin`, `agenda_actividad`, `agenda_lugar`, `agenda_tipo`) VALUES
(7, 1, '2014-11-05', '09:00:00', '10:00:00', 'Dinámica de sistemas y economía', 'Agora', 0),
(11, 1, '2014-11-05', '08:00:00', '09:00:00', 'Límites de crecimiento poblacional', 'Agora', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Archivos`
--

CREATE TABLE IF NOT EXISTS `Archivos` (
  `archivo_id` int(11) NOT NULL AUTO_INCREMENT,
  `archivo_tipo` int(11) NOT NULL COMMENT '(0)trabajo',
  `archivo_nombre` varchar(100) NOT NULL,
  `archivo_autor` varchar(100) NOT NULL,
  `archivo_tema` varchar(100) DEFAULT NULL,
  `archivo_resumen` mediumtext,
  `archivo_visitas` int(11) DEFAULT '0',
  `archivo_colectivo_id` int(11) DEFAULT NULL,
  `archivo_usr_id` int(11) NOT NULL,
  `archivo_direccion` varchar(300) DEFAULT NULL,
  `archivo_extencion` varchar(45) DEFAULT NULL,
  `archivo_fecha` date DEFAULT NULL,
  `archivo_palabrasClave` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`archivo_id`),
  KEY `fk_Archivos_Colectivos1_idx` (`archivo_colectivo_id`),
  KEY `fk_Archivos_Usuarios1_idx` (`archivo_usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `Archivos`
--

INSERT INTO `Archivos` (`archivo_id`, `archivo_tipo`, `archivo_nombre`, `archivo_autor`, `archivo_tema`, `archivo_resumen`, `archivo_visitas`, `archivo_colectivo_id`, `archivo_usr_id`, `archivo_direccion`, `archivo_extencion`, `archivo_fecha`, `archivo_palabrasClave`) VALUES
(1, 0, 'Archivo de trabajo 1', 'Fernando Soto ', 'Agricola', 'Descripción de la producción agrícola del tomate', 0, 3, 3, '/home/stip/Escritorio/17-web/red_dinamica/web/Usuarios/privado/1/', 'jpg', '2014-10-15', 'tomate, cultivos, agricultura'),
(2, 1, 'Producción de tomate', 'Stip Suaréz', 'Producción de tomate en invernadero', 'Cultivo del tomate en invernadero', 1, 3, 3, NULL, NULL, '2014-10-15', 'tomate, cultivo, producción, problemática'),
(3, 1, 'Otras variables del cultivo', 'JUan Carrazco', 'Cultivo', 'Resumen del cultivo', 0, 3, 1, NULL, NULL, '2014-10-20', 'cultivo, ds, producción'),
(4, 0, 'archivo de trabajo 1', 'Pedro ', 'Producción de caucho', 'Descripción de la producción de caucho.', 1, 4, 5, '/opt/glassfish4/glassfish/domains/domain1/web/Usuarios/privado/4/', 'jpg', '2014-11-05', 'caucho, producción'),
(5, 1, 'Archivo de Bibliografía', 'Luna', 'Principales causas de muerte de caucho', 'Este documento describe las principales causas de la muerte de caucho', 0, 4, 8, NULL, NULL, '2014-11-05', 'muerte, caucho, ds, proyecto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ArchivosPublicos`
--

CREATE TABLE IF NOT EXISTS `ArchivosPublicos` (
  `archivo_id` int(11) NOT NULL AUTO_INCREMENT,
  `archivo_usr_id` int(11) NOT NULL,
  `archivo_titulo` varchar(100) NOT NULL,
  `archivo_autor` varchar(100) DEFAULT NULL,
  `archivo_visitas` int(11) DEFAULT NULL,
  `archivo_palabrasClave` varchar(200) DEFAULT NULL,
  `archivo_tipo` int(11) DEFAULT '0' COMMENT '0 publico',
  PRIMARY KEY (`archivo_id`),
  KEY `fk_ArchivosPublicos_Usuarios2_idx` (`archivo_usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `ArchivosPublicos`
--

INSERT INTO `ArchivosPublicos` (`archivo_id`, `archivo_usr_id`, `archivo_titulo`, `archivo_autor`, `archivo_visitas`, `archivo_palabrasClave`, `archivo_tipo`) VALUES
(1, 3, 'Dinámica de sistemas', 'Forrester', 1, 'dinámica de sistemas, realimentación, ciclos', 0),
(2, 3, 'Pensamiento Sistemico', 'Maturana', 0, 'geomorfología, dinámica', 0),
(6, 5, 'archivo comunidad 1', 'lñk', 0, 'lkj', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Asistentes`
--

CREATE TABLE IF NOT EXISTS `Asistentes` (
  `asistente_usr_id` int(11) NOT NULL,
  `asistente_evento_id` int(11) NOT NULL,
  PRIMARY KEY (`asistente_usr_id`,`asistente_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Eventos3_idx` (`asistente_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Usuarios3_idx` (`asistente_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Asistentes`
--

INSERT INTO `Asistentes` (`asistente_usr_id`, `asistente_evento_id`) VALUES
(8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BibliografiaColectivo`
--

CREATE TABLE IF NOT EXISTS `BibliografiaColectivo` (
  `biblio_colect_id` int(11) NOT NULL,
  `biblio_archivo_id` int(11) NOT NULL,
  PRIMARY KEY (`biblio_colect_id`,`biblio_archivo_id`),
  KEY `fk_Colectivos_has_ArchivosPublicos_ArchivosPublicos1_idx` (`biblio_archivo_id`),
  KEY `fk_Colectivos_has_ArchivosPublicos_Colectivos1_idx` (`biblio_colect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `BibliografiaColectivo`
--

INSERT INTO `BibliografiaColectivo` (`biblio_colect_id`, `biblio_archivo_id`) VALUES
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudad`
--

CREATE TABLE IF NOT EXISTS `Ciudad` (
  `ciudad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad_nombre` varchar(45) NOT NULL,
  `ciudad_codigo_postal` varchar(45) DEFAULT NULL,
  `ciudad_departamento` int(11) NOT NULL,
  PRIMARY KEY (`ciudad_id`),
  KEY `fk_Ciudad_Departamentos1_idx` (`ciudad_departamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Ciudad`
--

INSERT INTO `Ciudad` (`ciudad_id`, `ciudad_nombre`, `ciudad_codigo_postal`, `ciudad_departamento`) VALUES
(1, 'Bogotá', '18987', 1),
(2, 'Bucaramanga', '68887', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Colectivos`
--

CREATE TABLE IF NOT EXISTS `Colectivos` (
  `colect_id` int(11) NOT NULL AUTO_INCREMENT,
  `colect_titulo` varchar(45) NOT NULL,
  `colect_descripcion` mediumtext NOT NULL,
  `colect_fecha` date NOT NULL,
  `colect_usr_id` int(11) NOT NULL,
  `colect_estado` tinyint(1) DEFAULT '0' COMMENT 'Haceparte(1).',
  PRIMARY KEY (`colect_id`),
  KEY `fk_Colectivos_Usuarios1_idx` (`colect_usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `Colectivos`
--

INSERT INTO `Colectivos` (`colect_id`, `colect_titulo`, `colect_descripcion`, `colect_fecha`, `colect_usr_id`, `colect_estado`) VALUES
(1, 'Producción agropecuaria', 'Investigaciones sobre los problemas agrícolas', '2014-10-15', 1, 0),
(2, 'Sistemas de producción', 'Investigaciones sobre los sistemas de producción de alimentos', '2014-10-15', 1, 0),
(3, 'Transporte', 'Investigaciones sobre la mejora en los medios de transporte.', '2014-10-15', 3, 1),
(4, 'Producción agrícula', 'Trabajo de DS relacionados con la producción de alimentos.', '2014-11-05', 8, 0),
(7, 't', 't', '2014-11-05', 8, 0),
(8, 'otro', 'kj', '2014-11-05', 8, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comentarios`
--

CREATE TABLE IF NOT EXISTS `Comentarios` (
  `coment_id` int(11) NOT NULL AUTO_INCREMENT,
  `coment_descripcion` longtext NOT NULL,
  `coment_fecha` date NOT NULL,
  `coment_usr_id` int(11) NOT NULL,
  `coment_foro_id` int(11) NOT NULL,
  PRIMARY KEY (`coment_id`),
  KEY `fk_Comentarios_Usuarios1_idx` (`coment_usr_id`),
  KEY `fk_Comentarios_Foros1_idx` (`coment_foro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `Comentarios`
--

INSERT INTO `Comentarios` (`coment_id`, `coment_descripcion`, `coment_fecha`, `coment_usr_id`, `coment_foro_id`) VALUES
(1, '<span style="font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 20.0200004577637px; text-align: justify; background-color: rgb(255, 255, 255);">Los problemas de salud y seguridad en las instalaciones de fabricación de neumáticos siempre han sido y siguen siendo de la mayor importancia. A menudo, el impacto de los accidentes graves puede encubrir enfermedades asociadas a las exposiciones en el puesto de trabajo. A causa de los prolongados períodos de latencia, algunas enfermedades no son evidentes hasta despué s de que el trabajador ha abandonado su trabajo. Ocurre que muchas enfermedades ocasionadas por exposiciones laborales en plantas de fabricació n de neumá ticos no llegan a relacionarse jamá s con el trabajo realizado.&nbsp;</span>', '2014-11-05', 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Conferencias`
--

CREATE TABLE IF NOT EXISTS `Conferencias` (
  `conferencia_usr_id` int(11) NOT NULL,
  `conferencia_evento_id` int(11) NOT NULL,
  `conferencia_titulo` varchar(200) DEFAULT NULL,
  `conferencia_aceptada` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`conferencia_usr_id`,`conferencia_evento_id`),
  KEY `fk_Usuarios_has_Eventos1_Eventos1_idx` (`conferencia_evento_id`),
  KEY `fk_Usuarios_has_Eventos1_Usuarios1_idx` (`conferencia_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Conferencias`
--

INSERT INTO `Conferencias` (`conferencia_usr_id`, `conferencia_evento_id`, `conferencia_titulo`, `conferencia_aceptada`) VALUES
(7, 1, 'Dinámica de sistemas y economía', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Contactos`
--

CREATE TABLE IF NOT EXISTS `Contactos` (
  `cont_usr_id` int(11) NOT NULL,
  `cont_contacto_id` int(11) NOT NULL,
  PRIMARY KEY (`cont_usr_id`,`cont_contacto_id`),
  KEY `fk_Usuarios_has_Usuarios_Usuarios2_idx` (`cont_contacto_id`),
  KEY `fk_Usuarios_has_Usuarios_Usuarios1_idx` (`cont_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Contactos`
--

INSERT INTO `Contactos` (`cont_usr_id`, `cont_contacto_id`) VALUES
(1, 3),
(5, 3),
(1, 5),
(1, 7),
(7, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Conversacion`
--

CREATE TABLE IF NOT EXISTS `Conversacion` (
  `conv_id` int(11) NOT NULL AUTO_INCREMENT,
  `conv_usr1_id` int(11) NOT NULL,
  `conv_usr2_id` int(11) NOT NULL,
  `conv_asunto` varchar(100) NOT NULL,
  `conv_ultimo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `conv_numero` int(11) NOT NULL,
  PRIMARY KEY (`conv_id`),
  KEY `fk_Conversacion_Usuarios2_idx` (`conv_usr1_id`),
  KEY `fk_Conversacion_Usuarios1_idx` (`conv_usr2_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `Conversacion`
--

INSERT INTO `Conversacion` (`conv_id`, `conv_usr1_id`, `conv_usr2_id`, `conv_asunto`, `conv_ultimo`, `conv_numero`) VALUES
(5, 1, 3, 'entre1 y 3', '2014-10-15 21:24:47', 0),
(6, 1, 4, 'entre1 y 4', '2014-10-15 21:25:52', 0),
(7, 1, 5, 'entre1 y 5', '2014-10-15 21:26:14', 0),
(8, 5, 3, 'entre5 y 3', '2014-10-15 21:42:15', 0),
(9, 4, 3, 'entre4 y 3', '2014-10-15 21:52:00', 0),
(10, 7, 8, 'entre7 y 8', '2014-11-06 01:17:24', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamentos`
--

CREATE TABLE IF NOT EXISTS `Departamentos` (
  `departamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`departamento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Departamentos`
--

INSERT INTO `Departamentos` (`departamento_id`, `departamento_nombre`) VALUES
(1, 'Cundinamarca'),
(2, 'Santander');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Evaluadores`
--

CREATE TABLE IF NOT EXISTS `Evaluadores` (
  `evaluador_usr_id` int(11) NOT NULL,
  `evaluador_evento_id` int(11) NOT NULL,
  PRIMARY KEY (`evaluador_usr_id`,`evaluador_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Eventos4_idx` (`evaluador_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Usuarios4_idx` (`evaluador_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Evaluadores`
--

INSERT INTO `Evaluadores` (`evaluador_usr_id`, `evaluador_evento_id`) VALUES
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Eventos`
--

CREATE TABLE IF NOT EXISTS `Eventos` (
  `evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `evento_titulo` varchar(100) NOT NULL,
  `evento_descripcion` varchar(1000) DEFAULT NULL,
  `evento_archivo` varchar(300) DEFAULT NULL,
  `evento_universidad_id` int(11) DEFAULT NULL,
  `evento_inicio` date DEFAULT NULL,
  `evento_fin` date DEFAULT NULL,
  `evento_objetivos` text,
  `evento_convocatoria` mediumtext,
  `evento_fa` date DEFAULT NULL,
  `evento_fb` date DEFAULT NULL,
  `evento_fc` date DEFAULT NULL,
  `evento_fd` date DEFAULT NULL,
  `evento_da` varchar(100) DEFAULT NULL,
  `evento_db` varchar(100) DEFAULT NULL,
  `evento_dc` varchar(100) DEFAULT NULL,
  `evento_dd` varchar(100) DEFAULT NULL,
  `evento_alojamiento` mediumtext,
  PRIMARY KEY (`evento_id`),
  KEY `fk_Eventos_Universidades1_idx` (`evento_universidad_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `Eventos`
--

INSERT INTO `Eventos` (`evento_id`, `evento_titulo`, `evento_descripcion`, `evento_archivo`, `evento_universidad_id`, `evento_inicio`, `evento_fin`, `evento_objetivos`, `evento_convocatoria`, `evento_fa`, `evento_fb`, `evento_fc`, `evento_fd`, `evento_da`, `evento_db`, `evento_dc`, `evento_dd`, `evento_alojamiento`) VALUES
(1, '10° Encuentro Colombiano de Dinámica de Sistemas', 'Este año se desarrollará la décima versión del Encuentro Colombiano de dinámica de Sistemas, evento que tendrá como temática central “La dinámica de Sistemas: Un enfoque de gestión y soluciones de problemas”, ello con el objetivo de resaltar el papel de la dinámica de Sistemas en el diagnostico y solución de problemáticas organizacionales.  El encuentro se desarrollará del 26 al 28 de septiembre en la ciudad de Cali, bajo la organización de la Universidad ICESI y la Universidad del Valle, ambas instituciones miembros de CLADEA.  Entre los conferencistas invitados, destacan: David Wheat, prof.  Titular de Dinámica de Sistemas – Universidad de Bergen (Noruega); Martin Kunc, prof. Asociado de ciencias administrativas – Universidad de Warwick (Reino Unido); y Birgit Kopainsky, Investigadora Senior, Grupo de Dinámica de Sistemas (Noruega).  La fecha límite para el envío de resúmenes y tentar una ponencia culmina el próximo 6 de julio.', NULL, 2, '2014-10-13', '2014-10-15', NULL, '<h1 class="title" style="padding-bottom: 5px; margin: 0px 0px 10px; font-size: 19px; color: rgb(153, 153, 153); font-weight: normal; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(188, 188, 188); font-family: sans-serif, Arial, Verdana, Helvetica; background-color: rgb(255, 255, 255);">Décimo Primer Encuentro Colombiano de Dinámica de Sistemas</h1><div id="node-3730" class="node odd full-node node-type-event" style="margin: 0.5em 0px 2em; color: rgb(83, 83, 83); font-family: sans-serif, Arial, Verdana, Helvetica; line-height: 16.6000003814697px; background-color: rgb(255, 255, 255);"><div class="meta"></div><div class="content clearfix" style="margin: 0.5em 0px; padding: 1em; background: url(http://www.colciencias.gov.co/sites/all/themes/zeropoint/images/nodeBg.gif) 0px 100% repeat-x;"><div class="field field-type-filefield field-field-imagen" style="float: left; padding: 0px 10px 0px 0px;"><div class="field-items"><div class="field-item odd"><div class="sb-image sb-gallery sb-gallery-nid-3730"><a href="http://www.colciencias.gov.co/sites/default/files/images/eventos/dinamica_de_sistemas.jpg" rel="shadowbox[gallery]" title="Décimo Primer Encuentro Colombiano de Dinámica de Sistemas" style="color: rgb(51, 51, 51); font-weight: bold;"><img src="http://www.colciencias.gov.co/sites/default/files/imagecache/thumb_180x/images/eventos/dinamica_de_sistemas.jpg" alt="" title="Décimo Primer Encuentro Colombiano de Dinámica de Sistemas" class="imagecache imagecache-thumb_180x" width="180" height="46" style="border: 0px;"></a></div></div></div></div><div class="field field-type-datetime field-field-fecha-inicio"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Fecha de Inicio: </div> <span class="date-display-single">11 Septiembre 2013 - 8:00am</span></div></div></div><div class="field field-type-datetime field-field-fecha-final"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Fecha Final: </div> <span class="date-display-single">13 Septiembre 2013 (Todo el día)</span></div></div></div><div class="field field-type-link field-field-more-info"><div class="field-label" style="font-weight: bold;">Mayor información: </div><div class="field-items"><div class="field-item odd"><a href="http://simon.uis.edu.co/11encuentrods/" target="_blank" style="color: rgb(51, 51, 51); font-weight: bold;">UIS</a></div></div></div><p class="rtejustify" style="margin-top: 0px; margin-bottom: 0.9em; text-align: justify;">El Décimo Primer Encuentro Colombiano de Dinámica de Sistemas convoca a la comunidad en general (profesores, estudiantes, profesionales, entre otros), a compartir experiencias conceptuales, metodológicas y aplicaciones en Ecología y ambiente, Planeación, Energía, Aplicaciones industriales, Logística y productividad, Educación, Economía y sociedad, Innovaciones tecnológicas, entre otros, relacionadas con el modelamiento y la simulación con Dinámica de Sistemas (DS). En el marco del sexto encuentro se desarrollará la escuela de verano: La complejidad en la Dinámica de sistemas.</p><div class="field field-type-text field-field-lugar"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Lugar: </div> Universidad Industrial de Santander Sede Principal - Bucaramanga</div></div></div><div class="field field-type-text field-field-telefono"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Teléfono: </div> Telefax : 6343377 Teléfono: 6 34 4000 Ext 2681</div></div></div><div class="field field-type-text field-field-dirigido"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Dirigido a: </div> Estudiantes de pregrado, estudiantes de post grado, investigadores, profesionales y profesores quienes trabajen o estén interesados en fortalecer los conocimientos en dinámica de sistemas y sus aplicaciones.</div></div></div></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Forma_parte`
--

CREATE TABLE IF NOT EXISTS `Forma_parte` (
  `forma_usr_id` int(11) NOT NULL,
  `forma_colect_id` int(11) NOT NULL,
  `forma_estado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'inactivo(0), activo(1).',
  PRIMARY KEY (`forma_usr_id`,`forma_colect_id`),
  KEY `fk_Usuarios_has_Colectivos_Colectivos1_idx` (`forma_colect_id`),
  KEY `fk_Usuarios_has_Colectivos_Usuarios1_idx` (`forma_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Forma_parte`
--

INSERT INTO `Forma_parte` (`forma_usr_id`, `forma_colect_id`, `forma_estado`) VALUES
(1, 3, 1),
(5, 1, 1),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Foros`
--

CREATE TABLE IF NOT EXISTS `Foros` (
  `foro_id` int(11) NOT NULL AUTO_INCREMENT,
  `foro_tema` varchar(45) NOT NULL,
  `foro_fecha` date NOT NULL,
  `foro_descripcion` varchar(700) NOT NULL,
  `foro_usr_id` int(11) NOT NULL,
  `foro_colect_id` int(11) NOT NULL,
  PRIMARY KEY (`foro_id`),
  KEY `fk_Foros_Usuarios1_idx` (`foro_usr_id`),
  KEY `fk_Foros_Colectivos1_idx` (`foro_colect_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Foros`
--

INSERT INTO `Foros` (`foro_id`, `foro_tema`, `foro_fecha`, `foro_descripcion`, `foro_usr_id`, `foro_colect_id`) VALUES
(1, 'Producción de tomate', '2014-10-15', 'Problemática del tomate', 3, 3),
(2, 'Producción de caucho', '2014-11-05', 'Cultivo de caucho y sus problemas más comunes.', 8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `HistorialArchivosPublicos`
--

CREATE TABLE IF NOT EXISTS `HistorialArchivosPublicos` (
  `historial_usr_id` int(11) NOT NULL,
  `historial_archivo_id` int(11) NOT NULL,
  `historial_fecha` date DEFAULT NULL,
  `historial_visitas` int(11) DEFAULT NULL,
  PRIMARY KEY (`historial_usr_id`,`historial_archivo_id`),
  KEY `fk_Usuarios_has_ArchivosPublicos_ArchivosPublicos1_idx` (`historial_archivo_id`),
  KEY `fk_Usuarios_has_ArchivosPublicos_Usuarios1_idx` (`historial_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `HistorialArchivosPublicos`
--

INSERT INTO `HistorialArchivosPublicos` (`historial_usr_id`, `historial_archivo_id`, `historial_fecha`, `historial_visitas`) VALUES
(5, 1, '2014-11-05', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mensaje`
--

CREATE TABLE IF NOT EXISTS `Mensaje` (
  `msj_id` int(11) NOT NULL AUTO_INCREMENT,
  `msj_texto` longtext,
  `msj_fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msj_leido` tinyint(1) NOT NULL DEFAULT '0',
  `msj_conversacion` int(11) NOT NULL,
  `msj_remitente` int(11) NOT NULL,
  `msj_destinatario` int(11) NOT NULL,
  PRIMARY KEY (`msj_id`),
  KEY `fk_Mensaje_Conversacion1_idx` (`msj_conversacion`),
  KEY `fk_Mensaje_Usuarios1_idx` (`msj_remitente`),
  KEY `fk_Mensaje_Usuarios2_idx` (`msj_destinatario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `Mensaje`
--

INSERT INTO `Mensaje` (`msj_id`, `msj_texto`, `msj_fecha`, `msj_leido`, `msj_conversacion`, `msj_remitente`, `msj_destinatario`) VALUES
(5, 'Hola Miguel', '2014-10-15 21:58:00', 1, 5, 1, 3),
(6, 'Hola lorena', '2014-10-15 21:58:30', 1, 6, 1, 4),
(7, 'Hola Juan', '2014-10-15 21:26:23', 0, 7, 1, 5),
(8, 'Hola Miguel. Soy Juan.', '2014-11-06 03:05:07', 1, 8, 5, 3),
(9, 'HOla miguel. Soy lorena', '2014-11-06 03:05:25', 1, 9, 4, 3),
(10, 'Hola Stip', '2014-10-15 21:59:19', 1, 5, 3, 1),
(11, 'Hola Stip', '2014-10-20 14:46:13', 1, 6, 4, 1),
(12, 'Hola luna', '2014-11-06 01:19:15', 1, 10, 7, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Noticias`
--

CREATE TABLE IF NOT EXISTS `Noticias` (
  `noticia_id` int(11) NOT NULL AUTO_INCREMENT,
  `noticia_titulo` varchar(100) NOT NULL,
  `noticia_fecha` date NOT NULL,
  `noticia_imagen` varchar(45) NOT NULL COMMENT 'url de la imagen',
  `noticia_descripcion` longtext NOT NULL,
  `noticia_fuente` varchar(45) DEFAULT NULL,
  `noticia_usr_id` int(11) NOT NULL,
  PRIMARY KEY (`noticia_id`),
  KEY `fk_Noticias_Usuarios1_idx` (`noticia_usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Noticias`
--

INSERT INTO `Noticias` (`noticia_id`, `noticia_titulo`, `noticia_fecha`, `noticia_imagen`, `noticia_descripcion`, `noticia_fuente`, `noticia_usr_id`) VALUES
(1, '10° Encuentro Colombiano de Dinámica de Sistemas', '2014-10-02', 'i', 'Este año se desarrollará la décima versión del Encuentro Colombiano de dinámica de Sistemas, evento que tendrá como temática central “La dinámica de Sistemas: Un enfoque de gestión y soluciones de problemas”, ello con el objetivo de resaltar el papel de la dinámica de Sistemas en el diagnostico y solución de problemáticas organizacionales.\r\n\r\nEl encuentro se desarrollará del 26 al 28 de septiembre en la ciudad de Cali, bajo la organización de la Universidad ICESI y la Universidad del Valle, ambas instituciones miembros de CLADEA.\r\n\r\nEntre los conferencistas invitados, destacan: David Wheat, prof.  Titular de Dinámica de Sistemas – Universidad de Bergen (Noruega); Martin Kunc, prof. Asociado de ciencias administrativas – Universidad de Warwick (Reino Unido); y Birgit Kopainsky, Investigadora Senior, Grupo de Dinámica de Sistemas (Noruega).\r\n\r\nLa fecha límite para el envío de resúmenes y tentar una ponencia culmina el próximo 6 de julio.', 'www.10encuentrods.org', 1),
(2, 'Encuentro latinoamericano de dinámica de sistemas', '2014-11-04', 'i', '\n\nLa Universidad Pontifica Bolivariana ofrecerá entre el 17 y el 19 de noviembre el octavo Congreso Latinoamericano y Encuentro Colombiano de Dinámica de Sistemas.\n\nLa dinámica de sistemas es una metodología que permite el análisis sistémico de problemas complejos, para encontrar soluciones que se adapten mejor a la realidad. Este congreso latinoamericano se convertirá en una oportunidad para descubrir en la dinámica de sistemas una herramienta útil para abordar problemas socioeconómicos, empresariales, ambientales, de planteamiento, tecnológicos, educativos, entre otros.\n\nAl congreso, que es organizado por la UPB, con el apoyo y participación de otras instituciones de educación superior del país, asistirán en calidad de asistentes y ponentes personas de México, Brasil, Argentina, Panamá, Perú, Venezuela y Colombia.\n\nComo ponentes centrales de este congreso, estarán David Wheat (Noruega); Martin Kunc (Inglaterra); y Silvia Ulli-Beer (Suiza), conferencistas de reconocida trayectoria en el área de dinámica de sistemas y que han trabajado en organizaciones públicas y privadas en el mundo como investigadores, asesores y consultores.\n\nEste congreso latinoamericano se realizará en la UPB entre el 17 y el 19 de noviembre en el auditorio Juan Pablo II, de la Escuela de Arquitectura y Diseño (Bloque 10) y en el auditorio Félix Henao Botero de la Escuela de Ingenierías (Bloque 11).\n\nLas inscripciones están abiertas en convena.upb.edu.co/8encuentrods\n', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Novedades`
--

CREATE TABLE IF NOT EXISTS `Novedades` (
  `novedad_id` int(11) NOT NULL AUTO_INCREMENT,
  `novedad_evento_id` int(11) NOT NULL,
  `novedad_titulo` varchar(120) DEFAULT NULL,
  `novedad_contenido` varchar(300) NOT NULL,
  PRIMARY KEY (`novedad_id`),
  KEY `fk_Novedades_Eventos1_idx` (`novedad_evento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `Novedades`
--

INSERT INTO `Novedades` (`novedad_id`, `novedad_evento_id`, `novedad_titulo`, `novedad_contenido`) VALUES
(1, 1, 'Cambio de fechas', 'Próximamente estarán cambiando las fechas del evento. Espere más información.<br>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ponencias`
--

CREATE TABLE IF NOT EXISTS `Ponencias` (
  `ponencias_ponente_id` int(11) NOT NULL,
  `ponencias_evento_id` int(11) NOT NULL,
  `ponencias_evaluador_id` int(11) DEFAULT NULL,
  `ponencias_evaluador1_id` int(11) DEFAULT NULL,
  `ponencia_titulo` varchar(200) DEFAULT NULL,
  `ponencias_concepto` int(11) DEFAULT NULL,
  `ponencias_concepto1` int(11) DEFAULT NULL,
  `ponencia_correcciones` mediumtext,
  `ponencia_correcciones1` mediumtext,
  PRIMARY KEY (`ponencias_ponente_id`,`ponencias_evento_id`),
  KEY `fk_Usuarios_has_Eventos2_Eventos1_idx` (`ponencias_evento_id`),
  KEY `fk_Usuarios_has_Eventos2_Usuarios1_idx` (`ponencias_ponente_id`),
  KEY `fk_Ponencias_Usuarios1_idx` (`ponencias_evaluador_id`),
  KEY `fk_Ponencias_Usuarios2_idx` (`ponencias_evaluador1_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Ponencias`
--

INSERT INTO `Ponencias` (`ponencias_ponente_id`, `ponencias_evento_id`, `ponencias_evaluador_id`, `ponencias_evaluador1_id`, `ponencia_titulo`, `ponencias_concepto`, `ponencias_concepto1`, `ponencia_correcciones`, `ponencia_correcciones1`) VALUES
(11, 1, 4, 5, 'Límites de crecimiento poblacional', 4, 5, 'muy bien', 'bien');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Solicitudes`
--

CREATE TABLE IF NOT EXISTS `Solicitudes` (
  `solicitud_id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitud_fecha` date DEFAULT NULL,
  `solicitud_estado` tinyint(1) DEFAULT NULL,
  `solicitud_usr_id` int(11) NOT NULL,
  PRIMARY KEY (`solicitud_id`),
  KEY `fk_Solicitudes_Usuarios1_idx` (`solicitud_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Universidades`
--

CREATE TABLE IF NOT EXISTS `Universidades` (
  `universidad_id` int(11) NOT NULL AUTO_INCREMENT,
  `universidad_nombre` varchar(70) DEFAULT NULL,
  `universidad_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`universidad_id`),
  KEY `fk_Universidades_Ciudad1_idx` (`universidad_ciudad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Universidades`
--

INSERT INTO `Universidades` (`universidad_id`, `universidad_nombre`, `universidad_ciudad`) VALUES
(1, 'Universidad Nacional', 1),
(2, 'Universidad Industrial de Santander', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE IF NOT EXISTS `Usuarios` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_nombres` varchar(45) NOT NULL,
  `usr_apellidos` varchar(45) NOT NULL,
  `usr_email` varchar(50) NOT NULL,
  `usr_pass` varchar(30) NOT NULL,
  `usr_sexo` tinyint(1) DEFAULT NULL COMMENT 'H(1) M(0)',
  `usr_departamento` int(11) DEFAULT NULL,
  `usr_universidad` int(11) DEFAULT NULL,
  `usr_ciudad` int(11) DEFAULT NULL,
  `usr_tipo` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Tipo= admin(1), general(0)',
  `usr_estado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Activo(1) o inactivo(0)',
  `usr_foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usr_id`),
  KEY `fk_Usuarios_Departamentos1_idx` (`usr_departamento`),
  KEY `fk_Usuarios_Universidades1_idx` (`usr_universidad`),
  KEY `fk_Usuarios_Ciudad1_idx` (`usr_ciudad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`usr_id`, `usr_nombres`, `usr_apellidos`, `usr_email`, `usr_pass`, `usr_sexo`, `usr_departamento`, `usr_universidad`, `usr_ciudad`, `usr_tipo`, `usr_estado`, `usr_foto`) VALUES
(1, 'Administrador', '', 'administrador@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, NULL, NULL, NULL, 1, 1, NULL),
(3, 'Juan', 'adminEvento', 'juan.adminevento@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, 2, 2, 2, 0, 1, NULL),
(4, 'Carlos', 'evaluador', 'carlos.evaluador@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, 1, 1, 1, 0, 1, NULL),
(5, 'Pedro', 'evaluador', 'pedro.evaluador@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, NULL, NULL, NULL, 0, 1, NULL),
(7, 'Milena', 'conferencista', 'milena.conferencista@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 0, NULL, NULL, NULL, 0, 1, NULL),
(8, 'Luna', 'asistente', 'luna.asistente@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 0, NULL, NULL, NULL, 0, 1, NULL),
(11, 'Luis', 'Ponente', 'luis.ponente@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, NULL, NULL, NULL, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Version`
--

CREATE TABLE IF NOT EXISTS `Version` (
  `version_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_fecha` date NOT NULL,
  `version_numero` int(11) NOT NULL,
  `version_archivo_id` int(11) NOT NULL,
  `version_usr_id` int(11) NOT NULL,
  `version_descargas` int(11) DEFAULT NULL,
  PRIMARY KEY (`version_id`),
  KEY `fk_Version_Archivos1_idx` (`version_archivo_id`),
  KEY `fk_Version_Usuarios1_idx` (`version_usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `Version`
--

INSERT INTO `Version` (`version_id`, `version_fecha`, `version_numero`, `version_archivo_id`, `version_usr_id`, `version_descargas`) VALUES
(1, '2014-10-15', 1, 1, 3, NULL),
(2, '2014-10-15', 2, 1, 3, NULL),
(3, '2014-10-15', 1, 2, 3, NULL),
(4, '2014-10-20', 1, 3, 1, NULL),
(5, '2014-11-05', 1, 4, 5, NULL),
(6, '2014-11-05', 2, 4, 5, NULL),
(7, '2014-11-05', 3, 4, 5, NULL),
(8, '2014-11-05', 4, 4, 5, NULL),
(9, '2014-11-05', 1, 5, 8, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `AdministrarEventos`
--
ALTER TABLE `AdministrarEventos`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Eventos2` FOREIGN KEY (`admin_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios2` FOREIGN KEY (`admin_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Agenda`
--
ALTER TABLE `Agenda`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Eventos1` FOREIGN KEY (`agenda_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios1` FOREIGN KEY (`agenda_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Archivos`
--
ALTER TABLE `Archivos`
  ADD CONSTRAINT `fk_Archivos_Colectivos1` FOREIGN KEY (`archivo_colectivo_id`) REFERENCES `Colectivos` (`colect_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Archivos_Usuarios1` FOREIGN KEY (`archivo_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ArchivosPublicos`
--
ALTER TABLE `ArchivosPublicos`
  ADD CONSTRAINT `fk_ArchivosPublicos_Usuarios2` FOREIGN KEY (`archivo_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Asistentes`
--
ALTER TABLE `Asistentes`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Eventos3` FOREIGN KEY (`asistente_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios3` FOREIGN KEY (`asistente_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `BibliografiaColectivo`
--
ALTER TABLE `BibliografiaColectivo`
  ADD CONSTRAINT `fk_Colectivos_has_ArchivosPublicos_ArchivosPublicos1` FOREIGN KEY (`biblio_archivo_id`) REFERENCES `ArchivosPublicos` (`archivo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Colectivos_has_ArchivosPublicos_Colectivos1` FOREIGN KEY (`biblio_colect_id`) REFERENCES `Colectivos` (`colect_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Ciudad`
--
ALTER TABLE `Ciudad`
  ADD CONSTRAINT `fk_Ciudad_Departamentos1` FOREIGN KEY (`ciudad_departamento`) REFERENCES `Departamentos` (`departamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Colectivos`
--
ALTER TABLE `Colectivos`
  ADD CONSTRAINT `fk_Colectivos_Usuarios1` FOREIGN KEY (`colect_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Comentarios`
--
ALTER TABLE `Comentarios`
  ADD CONSTRAINT `fk_Comentarios_Foros1` FOREIGN KEY (`coment_foro_id`) REFERENCES `Foros` (`foro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Comentarios_Usuarios1` FOREIGN KEY (`coment_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Conferencias`
--
ALTER TABLE `Conferencias`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos1_Eventos1` FOREIGN KEY (`conferencia_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos1_Usuarios1` FOREIGN KEY (`conferencia_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Contactos`
--
ALTER TABLE `Contactos`
  ADD CONSTRAINT `fk_Usuarios_has_Usuarios_Usuarios1` FOREIGN KEY (`cont_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Usuarios_Usuarios2` FOREIGN KEY (`cont_contacto_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Conversacion`
--
ALTER TABLE `Conversacion`
  ADD CONSTRAINT `fk_Conversacion_Usuarios1` FOREIGN KEY (`conv_usr2_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Conversacion_Usuarios2` FOREIGN KEY (`conv_usr1_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Evaluadores`
--
ALTER TABLE `Evaluadores`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Eventos4` FOREIGN KEY (`evaluador_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios4` FOREIGN KEY (`evaluador_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Eventos`
--
ALTER TABLE `Eventos`
  ADD CONSTRAINT `fk_Eventos_Universidades1` FOREIGN KEY (`evento_universidad_id`) REFERENCES `Universidades` (`universidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Forma_parte`
--
ALTER TABLE `Forma_parte`
  ADD CONSTRAINT `fk_Usuarios_has_Colectivos_Colectivos1` FOREIGN KEY (`forma_colect_id`) REFERENCES `Colectivos` (`colect_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Colectivos_Usuarios1` FOREIGN KEY (`forma_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Foros`
--
ALTER TABLE `Foros`
  ADD CONSTRAINT `fk_Foros_Colectivos1` FOREIGN KEY (`foro_colect_id`) REFERENCES `Colectivos` (`colect_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Foros_Usuarios1` FOREIGN KEY (`foro_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `HistorialArchivosPublicos`
--
ALTER TABLE `HistorialArchivosPublicos`
  ADD CONSTRAINT `fk_Usuarios_has_ArchivosPublicos_ArchivosPublicos1` FOREIGN KEY (`historial_archivo_id`) REFERENCES `ArchivosPublicos` (`archivo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_ArchivosPublicos_Usuarios1` FOREIGN KEY (`historial_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Mensaje`
--
ALTER TABLE `Mensaje`
  ADD CONSTRAINT `fk_Mensaje_Conversacion1` FOREIGN KEY (`msj_conversacion`) REFERENCES `Conversacion` (`conv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Mensaje_Usuarios1` FOREIGN KEY (`msj_remitente`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Mensaje_Usuarios2` FOREIGN KEY (`msj_destinatario`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Noticias`
--
ALTER TABLE `Noticias`
  ADD CONSTRAINT `fk_Noticias_Usuarios1` FOREIGN KEY (`noticia_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Novedades`
--
ALTER TABLE `Novedades`
  ADD CONSTRAINT `fk_Novedades_Eventos1` FOREIGN KEY (`novedad_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Ponencias`
--
ALTER TABLE `Ponencias`
  ADD CONSTRAINT `fk_Ponencias_Usuarios1` FOREIGN KEY (`ponencias_evaluador_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ponencias_Usuarios2` FOREIGN KEY (`ponencias_evaluador1_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos2_Eventos1` FOREIGN KEY (`ponencias_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos2_Usuarios1` FOREIGN KEY (`ponencias_ponente_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Solicitudes`
--
ALTER TABLE `Solicitudes`
  ADD CONSTRAINT `fk_Solicitudes_Usuarios1` FOREIGN KEY (`solicitud_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Universidades`
--
ALTER TABLE `Universidades`
  ADD CONSTRAINT `fk_Universidades_Ciudad1` FOREIGN KEY (`universidad_ciudad`) REFERENCES `Ciudad` (`ciudad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `fk_Usuarios_Ciudad1` FOREIGN KEY (`usr_ciudad`) REFERENCES `Ciudad` (`ciudad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_Departamentos1` FOREIGN KEY (`usr_departamento`) REFERENCES `Departamentos` (`departamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_Universidades1` FOREIGN KEY (`usr_universidad`) REFERENCES `Universidades` (`universidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Version`
--
ALTER TABLE `Version`
  ADD CONSTRAINT `fk_Version_Archivos1` FOREIGN KEY (`version_archivo_id`) REFERENCES `Archivos` (`archivo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Version_Usuarios1` FOREIGN KEY (`version_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
