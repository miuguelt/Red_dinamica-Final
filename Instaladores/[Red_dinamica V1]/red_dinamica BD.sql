SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `AdministrarEventos` (
  `admin_usr_id` int(11) NOT NULL,
  `admin_evento_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_usr_id`,`admin_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Eventos2_idx` (`admin_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Usuarios2_idx` (`admin_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS `Asistentes` (
  `asistente_usr_id` int(11) NOT NULL,
  `asistente_evento_id` int(11) NOT NULL,
  PRIMARY KEY (`asistente_usr_id`,`asistente_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Eventos3_idx` (`asistente_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Usuarios3_idx` (`asistente_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `BibliografiaColectivo` (
  `biblio_colect_id` int(11) NOT NULL,
  `biblio_archivo_id` int(11) NOT NULL,
  PRIMARY KEY (`biblio_colect_id`,`biblio_archivo_id`),
  KEY `fk_Colectivos_has_ArchivosPublicos_ArchivosPublicos1_idx` (`biblio_archivo_id`),
  KEY `fk_Colectivos_has_ArchivosPublicos_Colectivos1_idx` (`biblio_colect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Ciudad` (
  `ciudad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad_nombre` varchar(45) NOT NULL,
  `ciudad_codigo_postal` varchar(45) DEFAULT NULL,
  `ciudad_departamento` int(11) NOT NULL,
  PRIMARY KEY (`ciudad_id`),
  KEY `fk_Ciudad_Departamentos1_idx` (`ciudad_departamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `Conferencias` (
  `conferencia_usr_id` int(11) NOT NULL,
  `conferencia_evento_id` int(11) NOT NULL,
  `conferencia_titulo` varchar(200) DEFAULT NULL,
  `conferencia_aceptada` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`conferencia_usr_id`,`conferencia_evento_id`),
  KEY `fk_Usuarios_has_Eventos1_Eventos1_idx` (`conferencia_evento_id`),
  KEY `fk_Usuarios_has_Eventos1_Usuarios1_idx` (`conferencia_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Contactos` (
  `cont_usr_id` int(11) NOT NULL,
  `cont_contacto_id` int(11) NOT NULL,
  PRIMARY KEY (`cont_usr_id`,`cont_contacto_id`),
  KEY `fk_Usuarios_has_Usuarios_Usuarios2_idx` (`cont_contacto_id`),
  KEY `fk_Usuarios_has_Usuarios_Usuarios1_idx` (`cont_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS `Departamentos` (
  `departamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`departamento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

CREATE TABLE IF NOT EXISTS `Evaluadores` (
  `evaluador_usr_id` int(11) NOT NULL,
  `evaluador_evento_id` int(11) NOT NULL,
  PRIMARY KEY (`evaluador_usr_id`,`evaluador_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Eventos4_idx` (`evaluador_evento_id`),
  KEY `fk_Usuarios_has_Eventos_Usuarios4_idx` (`evaluador_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS `Forma_parte` (
  `forma_usr_id` int(11) NOT NULL,
  `forma_colect_id` int(11) NOT NULL,
  `forma_estado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'inactivo(0), activo(1).',
  PRIMARY KEY (`forma_usr_id`,`forma_colect_id`),
  KEY `fk_Usuarios_has_Colectivos_Colectivos1_idx` (`forma_colect_id`),
  KEY `fk_Usuarios_has_Colectivos_Usuarios1_idx` (`forma_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS `HistorialArchivosPublicos` (
  `historial_usr_id` int(11) NOT NULL,
  `historial_archivo_id` int(11) NOT NULL,
  `historial_fecha` date DEFAULT NULL,
  `historial_visitas` int(11) DEFAULT NULL,
  PRIMARY KEY (`historial_usr_id`,`historial_archivo_id`),
  KEY `fk_Usuarios_has_ArchivosPublicos_ArchivosPublicos1_idx` (`historial_archivo_id`),
  KEY `fk_Usuarios_has_ArchivosPublicos_Usuarios1_idx` (`historial_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS `Novedades` (
  `novedad_id` int(11) NOT NULL AUTO_INCREMENT,
  `novedad_evento_id` int(11) NOT NULL,
  `novedad_titulo` varchar(120) DEFAULT NULL,
  `novedad_contenido` varchar(300) NOT NULL,
  PRIMARY KEY (`novedad_id`),
  KEY `fk_Novedades_Eventos1_idx` (`novedad_evento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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

CREATE TABLE IF NOT EXISTS `Solicitudes` (
  `solicitud_id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitud_fecha` date DEFAULT NULL,
  `solicitud_estado` tinyint(1) DEFAULT NULL,
  `solicitud_usr_id` int(11) NOT NULL,
  PRIMARY KEY (`solicitud_id`),
  KEY `fk_Solicitudes_Usuarios1_idx` (`solicitud_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `Universidades` (
  `universidad_id` int(11) NOT NULL AUTO_INCREMENT,
  `universidad_nombre` varchar(70) DEFAULT NULL,
  `universidad_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`universidad_id`),
  KEY `fk_Universidades_Ciudad1_idx` (`universidad_ciudad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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


ALTER TABLE `AdministrarEventos`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Eventos2` FOREIGN KEY (`admin_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios2` FOREIGN KEY (`admin_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Agenda`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Eventos1` FOREIGN KEY (`agenda_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios1` FOREIGN KEY (`agenda_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Archivos`
  ADD CONSTRAINT `fk_Archivos_Colectivos1` FOREIGN KEY (`archivo_colectivo_id`) REFERENCES `Colectivos` (`colect_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Archivos_Usuarios1` FOREIGN KEY (`archivo_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `ArchivosPublicos`
  ADD CONSTRAINT `fk_ArchivosPublicos_Usuarios2` FOREIGN KEY (`archivo_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Asistentes`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Eventos3` FOREIGN KEY (`asistente_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios3` FOREIGN KEY (`asistente_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `BibliografiaColectivo`
  ADD CONSTRAINT `fk_Colectivos_has_ArchivosPublicos_ArchivosPublicos1` FOREIGN KEY (`biblio_archivo_id`) REFERENCES `ArchivosPublicos` (`archivo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Colectivos_has_ArchivosPublicos_Colectivos1` FOREIGN KEY (`biblio_colect_id`) REFERENCES `Colectivos` (`colect_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Ciudad`
  ADD CONSTRAINT `fk_Ciudad_Departamentos1` FOREIGN KEY (`ciudad_departamento`) REFERENCES `Departamentos` (`departamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Colectivos`
  ADD CONSTRAINT `fk_Colectivos_Usuarios1` FOREIGN KEY (`colect_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Comentarios`
  ADD CONSTRAINT `fk_Comentarios_Foros1` FOREIGN KEY (`coment_foro_id`) REFERENCES `Foros` (`foro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Comentarios_Usuarios1` FOREIGN KEY (`coment_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Conferencias`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos1_Eventos1` FOREIGN KEY (`conferencia_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos1_Usuarios1` FOREIGN KEY (`conferencia_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Contactos`
  ADD CONSTRAINT `fk_Usuarios_has_Usuarios_Usuarios1` FOREIGN KEY (`cont_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Usuarios_Usuarios2` FOREIGN KEY (`cont_contacto_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Conversacion`
  ADD CONSTRAINT `fk_Conversacion_Usuarios1` FOREIGN KEY (`conv_usr2_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Conversacion_Usuarios2` FOREIGN KEY (`conv_usr1_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Evaluadores`
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Eventos4` FOREIGN KEY (`evaluador_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios4` FOREIGN KEY (`evaluador_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Eventos`
  ADD CONSTRAINT `fk_Eventos_Universidades1` FOREIGN KEY (`evento_universidad_id`) REFERENCES `Universidades` (`universidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Forma_parte`
  ADD CONSTRAINT `fk_Usuarios_has_Colectivos_Colectivos1` FOREIGN KEY (`forma_colect_id`) REFERENCES `Colectivos` (`colect_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Colectivos_Usuarios1` FOREIGN KEY (`forma_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Foros`
  ADD CONSTRAINT `fk_Foros_Colectivos1` FOREIGN KEY (`foro_colect_id`) REFERENCES `Colectivos` (`colect_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Foros_Usuarios1` FOREIGN KEY (`foro_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `HistorialArchivosPublicos`
  ADD CONSTRAINT `fk_Usuarios_has_ArchivosPublicos_ArchivosPublicos1` FOREIGN KEY (`historial_archivo_id`) REFERENCES `ArchivosPublicos` (`archivo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_ArchivosPublicos_Usuarios1` FOREIGN KEY (`historial_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Mensaje`
  ADD CONSTRAINT `fk_Mensaje_Conversacion1` FOREIGN KEY (`msj_conversacion`) REFERENCES `Conversacion` (`conv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Mensaje_Usuarios1` FOREIGN KEY (`msj_remitente`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Mensaje_Usuarios2` FOREIGN KEY (`msj_destinatario`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Noticias`
  ADD CONSTRAINT `fk_Noticias_Usuarios1` FOREIGN KEY (`noticia_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Novedades`
  ADD CONSTRAINT `fk_Novedades_Eventos1` FOREIGN KEY (`novedad_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Ponencias`
  ADD CONSTRAINT `fk_Ponencias_Usuarios1` FOREIGN KEY (`ponencias_evaluador_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ponencias_Usuarios2` FOREIGN KEY (`ponencias_evaluador1_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos2_Eventos1` FOREIGN KEY (`ponencias_evento_id`) REFERENCES `Eventos` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Eventos2_Usuarios1` FOREIGN KEY (`ponencias_ponente_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Solicitudes`
  ADD CONSTRAINT `fk_Solicitudes_Usuarios1` FOREIGN KEY (`solicitud_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Universidades`
  ADD CONSTRAINT `fk_Universidades_Ciudad1` FOREIGN KEY (`universidad_ciudad`) REFERENCES `Ciudad` (`ciudad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Usuarios`
  ADD CONSTRAINT `fk_Usuarios_Ciudad1` FOREIGN KEY (`usr_ciudad`) REFERENCES `Ciudad` (`ciudad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_Departamentos1` FOREIGN KEY (`usr_departamento`) REFERENCES `Departamentos` (`departamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_Universidades1` FOREIGN KEY (`usr_universidad`) REFERENCES `Universidades` (`universidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Version`
  ADD CONSTRAINT `fk_Version_Archivos1` FOREIGN KEY (`version_archivo_id`) REFERENCES `Archivos` (`archivo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Version_Usuarios1` FOREIGN KEY (`version_usr_id`) REFERENCES `Usuarios` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
