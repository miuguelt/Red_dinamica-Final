SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


INSERT INTO `AdministrarEventos` VALUES
(1, 1),
(3, 1);

INSERT INTO `Agenda` VALUES
(7, 1, '2014-11-05', '09:00:00', '10:00:00', 'Dinámica de sistemas y economía', 'Agora', 0),
(11, 1, '2014-11-05', '08:00:00', '09:00:00', 'Límites de crecimiento poblacional', 'Agora', 1);

INSERT INTO `Archivos` VALUES
(1, 0, 'Archivo de trabajo 1', 'Fernando Soto ', 'Agricola', 'Descripción de la producción agrícola del tomate', 0, 3, 3, '/home/stip/Escritorio/17-web/red_dinamica/web/Usuarios/privado/1/', 'jpg', '2014-10-15', 'tomate, cultivos, agricultura'),
(2, 1, 'Producción de tomate', 'Stip Suaréz', 'Producción de tomate en invernadero', 'Cultivo del tomate en invernadero', 1, 3, 3, NULL, NULL, '2014-10-15', 'tomate, cultivo, producción, problemática'),
(3, 1, 'Otras variables del cultivo', 'JUan Carrazco', 'Cultivo', 'Resumen del cultivo', 0, 3, 1, NULL, NULL, '2014-10-20', 'cultivo, ds, producción'),
(4, 0, 'archivo de trabajo 1', 'Pedro ', 'Producción de caucho', 'Descripción de la producción de caucho.', 1, 4, 5, '/opt/glassfish4/glassfish/domains/domain1/web/Usuarios/privado/4/', 'jpg', '2014-11-05', 'caucho, producción'),
(5, 1, 'Archivo de Bibliografía', 'Luna', 'Principales causas de muerte de caucho', 'Este documento describe las principales causas de la muerte de caucho', 0, 4, 8, NULL, NULL, '2014-11-05', 'muerte, caucho, ds, proyecto');

INSERT INTO `ArchivosPublicos` VALUES
(1, 3, 'Dinámica de sistemas', 'Forrester', 1, 'dinámica de sistemas, realimentación, ciclos', 0),
(2, 3, 'Pensamiento Sistemico', 'Maturana', 0, 'geomorfología, dinámica', 0),
(6, 5, 'archivo comunidad 1', 'lñk', 0, 'lkj', 1);

INSERT INTO `Asistentes` VALUES
(8, 1);

INSERT INTO `BibliografiaColectivo` VALUES
(3, 1),
(3, 2);

INSERT INTO `Ciudad` VALUES
(1, 'Bogotá', '18987', 1),
(2, 'Bucaramanga', '68887', 2);

INSERT INTO `Colectivos` VALUES
(1, 'Producción agropecuaria', 'Investigaciones sobre los problemas agrícolas', '2014-10-15', 1, 0),
(2, 'Sistemas de producción', 'Investigaciones sobre los sistemas de producción de alimentos', '2014-10-15', 1, 0),
(3, 'Transporte', 'Investigaciones sobre la mejora en los medios de transporte.', '2014-10-15', 3, 1),
(4, 'Producción agrícula', 'Trabajo de DS relacionados con la producción de alimentos.', '2014-11-05', 8, 0),
(7, 't', 't', '2014-11-05', 8, 0),
(8, 'otro', 'kj', '2014-11-05', 8, 0);

INSERT INTO `Comentarios` VALUES
(1, '<span style="font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 20.0200004577637px; text-align: justify; background-color: rgb(255, 255, 255);">Los problemas de salud y seguridad en las instalaciones de fabricación de neumáticos siempre han sido y siguen siendo de la mayor importancia. A menudo, el impacto de los accidentes graves puede encubrir enfermedades asociadas a las exposiciones en el puesto de trabajo. A causa de los prolongados períodos de latencia, algunas enfermedades no son evidentes hasta despué s de que el trabajador ha abandonado su trabajo. Ocurre que muchas enfermedades ocasionadas por exposiciones laborales en plantas de fabricació n de neumá ticos no llegan a relacionarse jamá s con el trabajo realizado.&nbsp;</span>', '2014-11-05', 5, 2);

INSERT INTO `Conferencias` VALUES
(7, 1, 'Dinámica de sistemas y economía', 1);

INSERT INTO `Contactos` VALUES
(1, 3),
(5, 3),
(1, 5),
(1, 7),
(7, 8);

INSERT INTO `Conversacion` VALUES
(5, 1, 3, 'entre1 y 3', '2014-10-15 21:24:47', 0),
(6, 1, 4, 'entre1 y 4', '2014-10-15 21:25:52', 0),
(7, 1, 5, 'entre1 y 5', '2014-10-15 21:26:14', 0),
(8, 5, 3, 'entre5 y 3', '2014-10-15 21:42:15', 0),
(9, 4, 3, 'entre4 y 3', '2014-10-15 21:52:00', 0),
(10, 7, 8, 'entre7 y 8', '2014-11-06 01:17:24', 0);

INSERT INTO `Departamentos` VALUES
(1, 'Cundinamarca'),
(2, 'Santander');

INSERT INTO `Evaluadores` VALUES
(4, 1),
(5, 1);

INSERT INTO `Eventos` VALUES
(1, '10° Encuentro Colombiano de Dinámica de Sistemas', 'Este año se desarrollará la décima versión del Encuentro Colombiano de dinámica de Sistemas, evento que tendrá como temática central “La dinámica de Sistemas: Un enfoque de gestión y soluciones de problemas”, ello con el objetivo de resaltar el papel de la dinámica de Sistemas en el diagnostico y solución de problemáticas organizacionales.  El encuentro se desarrollará del 26 al 28 de septiembre en la ciudad de Cali, bajo la organización de la Universidad ICESI y la Universidad del Valle, ambas instituciones miembros de CLADEA.  Entre los conferencistas invitados, destacan: David Wheat, prof.  Titular de Dinámica de Sistemas – Universidad de Bergen (Noruega); Martin Kunc, prof. Asociado de ciencias administrativas – Universidad de Warwick (Reino Unido); y Birgit Kopainsky, Investigadora Senior, Grupo de Dinámica de Sistemas (Noruega).  La fecha límite para el envío de resúmenes y tentar una ponencia culmina el próximo 6 de julio.', NULL, 2, '2014-10-13', '2014-10-15', NULL, '<h1 class="title" style="padding-bottom: 5px; margin: 0px 0px 10px; font-size: 19px; color: rgb(153, 153, 153); font-weight: normal; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(188, 188, 188); font-family: sans-serif, Arial, Verdana, Helvetica; background-color: rgb(255, 255, 255);">Décimo Primer Encuentro Colombiano de Dinámica de Sistemas</h1><div id="node-3730" class="node odd full-node node-type-event" style="margin: 0.5em 0px 2em; color: rgb(83, 83, 83); font-family: sans-serif, Arial, Verdana, Helvetica; line-height: 16.6000003814697px; background-color: rgb(255, 255, 255);"><div class="meta"></div><div class="content clearfix" style="margin: 0.5em 0px; padding: 1em; background: url(http://www.colciencias.gov.co/sites/all/themes/zeropoint/images/nodeBg.gif) 0px 100% repeat-x;"><div class="field field-type-filefield field-field-imagen" style="float: left; padding: 0px 10px 0px 0px;"><div class="field-items"><div class="field-item odd"><div class="sb-image sb-gallery sb-gallery-nid-3730"><a href="http://www.colciencias.gov.co/sites/default/files/images/eventos/dinamica_de_sistemas.jpg" rel="shadowbox[gallery]" title="Décimo Primer Encuentro Colombiano de Dinámica de Sistemas" style="color: rgb(51, 51, 51); font-weight: bold;"><img src="http://www.colciencias.gov.co/sites/default/files/imagecache/thumb_180x/images/eventos/dinamica_de_sistemas.jpg" alt="" title="Décimo Primer Encuentro Colombiano de Dinámica de Sistemas" class="imagecache imagecache-thumb_180x" width="180" height="46" style="border: 0px;"></a></div></div></div></div><div class="field field-type-datetime field-field-fecha-inicio"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Fecha de Inicio: </div> <span class="date-display-single">11 Septiembre 2013 - 8:00am</span></div></div></div><div class="field field-type-datetime field-field-fecha-final"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Fecha Final: </div> <span class="date-display-single">13 Septiembre 2013 (Todo el día)</span></div></div></div><div class="field field-type-link field-field-more-info"><div class="field-label" style="font-weight: bold;">Mayor información: </div><div class="field-items"><div class="field-item odd"><a href="http://simon.uis.edu.co/11encuentrods/" target="_blank" style="color: rgb(51, 51, 51); font-weight: bold;">UIS</a></div></div></div><p class="rtejustify" style="margin-top: 0px; margin-bottom: 0.9em; text-align: justify;">El Décimo Primer Encuentro Colombiano de Dinámica de Sistemas convoca a la comunidad en general (profesores, estudiantes, profesionales, entre otros), a compartir experiencias conceptuales, metodológicas y aplicaciones en Ecología y ambiente, Planeación, Energía, Aplicaciones industriales, Logística y productividad, Educación, Economía y sociedad, Innovaciones tecnológicas, entre otros, relacionadas con el modelamiento y la simulación con Dinámica de Sistemas (DS). En el marco del sexto encuentro se desarrollará la escuela de verano: La complejidad en la Dinámica de sistemas.</p><div class="field field-type-text field-field-lugar"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Lugar: </div> Universidad Industrial de Santander Sede Principal - Bucaramanga</div></div></div><div class="field field-type-text field-field-telefono"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Teléfono: </div> Telefax : 6343377 Teléfono: 6 34 4000 Ext 2681</div></div></div><div class="field field-type-text field-field-dirigido"><div class="field-items"><div class="field-item odd"><div class="field-label-inline-first" style="font-weight: bold; display: inline;">Dirigido a: </div> Estudiantes de pregrado, estudiantes de post grado, investigadores, profesionales y profesores quienes trabajen o estén interesados en fortalecer los conocimientos en dinámica de sistemas y sus aplicaciones.</div></div></div></div></div>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `Forma_parte` VALUES
(1, 3, 1),
(5, 1, 1),
(5, 4, 1);

INSERT INTO `Foros` VALUES
(1, 'Producción de tomate', '2014-10-15', 'Problemática del tomate', 3, 3),
(2, 'Producción de caucho', '2014-11-05', 'Cultivo de caucho y sus problemas más comunes.', 8, 4);

INSERT INTO `HistorialArchivosPublicos` VALUES
(5, 1, '2014-11-05', 1);

INSERT INTO `Mensaje` VALUES
(5, 'Hola Miguel', '2014-10-15 21:58:00', 1, 5, 1, 3),
(6, 'Hola lorena', '2014-10-15 21:58:30', 1, 6, 1, 4),
(7, 'Hola Juan', '2014-10-15 21:26:23', 0, 7, 1, 5),
(8, 'Hola Miguel. Soy Juan.', '2014-11-06 03:05:07', 1, 8, 5, 3),
(9, 'HOla miguel. Soy lorena', '2014-11-06 03:05:25', 1, 9, 4, 3),
(10, 'Hola Stip', '2014-10-15 21:59:19', 1, 5, 3, 1),
(11, 'Hola Stip', '2014-10-20 14:46:13', 1, 6, 4, 1),
(12, 'Hola luna', '2014-11-06 01:19:15', 1, 10, 7, 8);

INSERT INTO `Noticias` VALUES
(1, '10° Encuentro Colombiano de Dinámica de Sistemas', '2014-10-02', 'i', 'Este año se desarrollará la décima versión del Encuentro Colombiano de dinámica de Sistemas, evento que tendrá como temática central “La dinámica de Sistemas: Un enfoque de gestión y soluciones de problemas”, ello con el objetivo de resaltar el papel de la dinámica de Sistemas en el diagnostico y solución de problemáticas organizacionales.\r\n\r\nEl encuentro se desarrollará del 26 al 28 de septiembre en la ciudad de Cali, bajo la organización de la Universidad ICESI y la Universidad del Valle, ambas instituciones miembros de CLADEA.\r\n\r\nEntre los conferencistas invitados, destacan: David Wheat, prof.  Titular de Dinámica de Sistemas – Universidad de Bergen (Noruega); Martin Kunc, prof. Asociado de ciencias administrativas – Universidad de Warwick (Reino Unido); y Birgit Kopainsky, Investigadora Senior, Grupo de Dinámica de Sistemas (Noruega).\r\n\r\nLa fecha límite para el envío de resúmenes y tentar una ponencia culmina el próximo 6 de julio.', 'www.10encuentrods.org', 1),
(2, 'Encuentro latinoamericano de dinámica de sistemas', '2014-11-04', 'i', '\n\nLa Universidad Pontifica Bolivariana ofrecerá entre el 17 y el 19 de noviembre el octavo Congreso Latinoamericano y Encuentro Colombiano de Dinámica de Sistemas.\n\nLa dinámica de sistemas es una metodología que permite el análisis sistémico de problemas complejos, para encontrar soluciones que se adapten mejor a la realidad. Este congreso latinoamericano se convertirá en una oportunidad para descubrir en la dinámica de sistemas una herramienta útil para abordar problemas socioeconómicos, empresariales, ambientales, de planteamiento, tecnológicos, educativos, entre otros.\n\nAl congreso, que es organizado por la UPB, con el apoyo y participación de otras instituciones de educación superior del país, asistirán en calidad de asistentes y ponentes personas de México, Brasil, Argentina, Panamá, Perú, Venezuela y Colombia.\n\nComo ponentes centrales de este congreso, estarán David Wheat (Noruega); Martin Kunc (Inglaterra); y Silvia Ulli-Beer (Suiza), conferencistas de reconocida trayectoria en el área de dinámica de sistemas y que han trabajado en organizaciones públicas y privadas en el mundo como investigadores, asesores y consultores.\n\nEste congreso latinoamericano se realizará en la UPB entre el 17 y el 19 de noviembre en el auditorio Juan Pablo II, de la Escuela de Arquitectura y Diseño (Bloque 10) y en el auditorio Félix Henao Botero de la Escuela de Ingenierías (Bloque 11).\n\nLas inscripciones están abiertas en convena.upb.edu.co/8encuentrods\n', '', 1);

INSERT INTO `Novedades` VALUES
(1, 1, 'Cambio de fechas', 'Próximamente estarán cambiando las fechas del evento. Espere más información.<br>');

INSERT INTO `Ponencias` VALUES
(11, 1, 4, 5, 'Límites de crecimiento poblacional', 4, 5, 'muy bien', 'bien');

INSERT INTO `Universidades` VALUES
(1, 'Universidad Nacional', 1),
(2, 'Universidad Industrial de Santander', 2);

INSERT INTO `Usuarios` VALUES
(1, 'Administrador', '', 'administrador@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, NULL, NULL, NULL, 1, 1, NULL),
(3, 'Juan', 'adminEvento', 'juan.adminevento@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, 2, 2, 2, 0, 1, NULL),
(4, 'Carlos', 'evaluador', 'carlos.evaluador@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, 1, 1, 1, 0, 1, NULL),
(5, 'Pedro', 'evaluador', 'pedro.evaluador@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, NULL, NULL, NULL, 0, 1, NULL),
(7, 'Milena', 'conferencista', 'milena.conferencista@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 0, NULL, NULL, NULL, 0, 1, NULL),
(8, 'Luna', 'asistente', 'luna.asistente@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 0, NULL, NULL, NULL, 0, 1, NULL),
(11, 'Luis', 'Ponente', 'luis.ponente@gmail.com', 'QL0AFWMIX8NRZTKeof9cXsvbvu8=', 1, NULL, NULL, NULL, 0, 1, NULL);

INSERT INTO `Version` VALUES
(1, '2014-10-15', 1, 1, 3, NULL),
(2, '2014-10-15', 2, 1, 3, NULL),
(3, '2014-10-15', 1, 2, 3, NULL),
(4, '2014-10-20', 1, 3, 1, NULL),
(5, '2014-11-05', 1, 4, 5, NULL),
(6, '2014-11-05', 2, 4, 5, NULL),
(7, '2014-11-05', 3, 4, 5, NULL),
(8, '2014-11-05', 4, 4, 5, NULL),
(9, '2014-11-05', 1, 5, 8, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
