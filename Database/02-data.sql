--TRUNCATE TABLE actividades_estudiantes, actividades, salones, horario, apoyo_financiero, secciones, profesores, horas_beca, secciones_estudiantes, cursos, estudiantes RESTART IDENTITY;

INSERT INTO estudiantes (nombre, apellidos, fecha_nacimiento, correo, fecha_ingreso, fecha_egreso) VALUES
('Valeria', 'Núñez Ríos', '2002-10-01', 'valeria.nunez@example.com', '2021-08-15', NULL),
('Andrés', 'Torres Silva', '2001-05-17', 'andres.torres@example.com', '2020-08-15', '2024-06-20'),
('Paula', 'Castañeda Mora', '2000-03-08', 'paula.castaneda@example.com', '2019-08-15', '2023-06-10'),
('Diego', 'Vargas Soto', '1999-09-22', 'diego.vargas@example.com', '2018-08-15', '2022-06-10'),
('Camila', 'Reyes Cruz', '2003-12-30', 'camila.reyes@example.com', '2022-08-15', NULL),
('Mateo', 'Delgado Rojas', '2002-06-05', 'mateo.delgado@example.com', '2021-08-15', NULL),
('Isabela', 'Méndez Aguirre', '2001-08-14', 'isabela.mendez@example.com', '2020-08-15', NULL),
('Isabella', 'Aguirre Cotton', '2001-08-14', 'isabella.mendez@example.com', '2020-08-15', '2024-06-20'),
('Santiago', 'Pacheco León', '2000-02-19', 'santiago.pacheco@example.com', '2019-08-15', '2023-06-10'),
('Fernanda', 'Carrillo Peña', '1998-11-27', 'fernanda.carrillo@example.com', '2017-08-15', '2021-06-10'),
('Tomás', 'Gutiérrez Lozano', '2003-04-02', 'tomas.gutierrez@example.com', '2022-08-15', NULL),
('Marina', 'Salazar Méndez', '2001-01-15', 'marina.salazar@example.com', '2020-08-15', '2024-06-20'),
('Hugo', 'Navarro Palma', '2002-07-11', 'hugo.navarro@example.com', '2021-08-15', NULL),
('Sofía', 'Romero Estrada', '2000-05-06', 'sofia.romero@example.com', '2019-08-15', '2023-06-10'),
('Emilio', 'Campos Herrera', '1999-03-28', 'emilio.campos@example.com', '2018-08-15', '2022-06-10'),
('Diana', 'Bermúdez Lara', '2003-09-16', 'diana.bermudez@example.com', '2022-08-15', NULL),
('Gabriel', 'Luna Cortés', '2001-12-09', 'gabriel.luna@example.com', '2020-08-15', '2024-06-20'),
('Renata', 'Ibarra Cordero', '2002-03-31', 'renata.ibarra@example.com', '2021-08-15', NULL),
('Alonso', 'Acosta Villegas', '2000-10-25', 'alonso.acosta@example.com', '2019-08-15', '2023-06-10'),
('Daniela', 'Arriaga Bravo', '2001-06-13', 'daniela.arriaga@example.com', '2020-08-15', '2024-06-20'),
('Iván', 'Quiroz Tapia', '2003-01-04', 'ivan.quiroz@example.com', '2022-08-15', NULL),
('Natalia', 'Benítez Robles', '1999-07-07', 'natalia.benitez@example.com', '2018-08-15', '2022-06-10'),
('Marcos', 'Zamora Maldonado', '2002-02-22', 'marcos.zamora@example.com', '2021-08-15', NULL),
('Fátima', 'Ríos Navarro', '2000-08-29', 'fatima.rios@example.com', '2019-08-15', '2023-06-10'),
('Ricardo', 'Ojeda Gallardo', '2001-11-13', 'ricardo.ojeda@example.com', '2020-08-15', '2024-06-20'),
('Ángela', 'Montes Serrano', '2003-05-19', 'angela.montes@example.com', '2022-08-15', NULL);
INSERT INTO estudiantes (nombre, apellidos, fecha_nacimiento, correo, fecha_ingreso, fecha_egreso) VALUES
('Laura', 'Correa Benítez', '2002-08-17', 'laura.correa@example.com', '2021-08-15', NULL),
('Esteban', 'Arias Monroy', '2003-03-25', 'esteban.arias@example.com', '2022-08-15', NULL),
('Julieta', 'Rosales Pinto', '2001-11-11', 'julieta.rosales@example.com', '2020-08-15', NULL),
('Pedro', 'Salinas Ríos', '2002-05-03', 'pedro.salinas@example.com', '2021-08-15', NULL),
('Martina', 'Vidal Méndez', '2003-10-10', 'martina.vidal@example.com', '2022-08-15', NULL),
('Leonardo', 'Mejía Villalobos', '2001-01-27', 'leonardo.mejia@example.com', '2020-08-15', NULL),
('Clara', 'Ortega Zambrano', '2002-06-30', 'clara.ortega@example.com', '2021-08-15', NULL),
('Gonzalo', 'Muñoz Aranda', '2003-12-18', 'gonzalo.munoz@example.com', '2022-08-15', NULL),
('Margarita', 'Solís Duarte', '2001-08-06', 'margarita.solis@example.com', '2020-08-15', NULL),
('Ramiro', 'Camacho Barrios', '2002-04-12', 'ramiro.camacho@example.com', '2021-08-15', NULL),
('Tatiana', 'Escobar Molina', '2003-09-09', 'tatiana.escobar@example.com', '2022-08-15', NULL),
('Rodrigo', 'Carranza Peña', '2001-05-15', 'rodrigo.carranza@example.com', '2020-08-15', NULL),
('Jimena', 'Peña Lara', '2002-02-01', 'jimena.pena@example.com', '2021-08-15', NULL),
('Álvaro', 'Del Valle Rosas', '2003-06-21', 'alvaro.delvalle@example.com', '2022-08-15', NULL),
('Leticia', 'Galván Terán', '2001-09-28', 'leticia.galvan@example.com', '2020-08-15', NULL),
('Mauricio', 'Lara Zúñiga', '2002-12-03', 'mauricio.lara@example.com', '2021-08-15', NULL),
('Patricia', 'Varela Salgado', '2003-07-14', 'patricia.varela@example.com', '2022-08-15', NULL),
('Sebastián', 'Corona Alfaro', '2001-04-19', 'sebastian.corona@example.com', '2020-08-15', NULL),
('Rebeca', 'Cano Pineda', '2002-11-23', 'rebeca.cano@example.com', '2021-08-15', NULL),
('Enrique', 'Esquivel Olivares', '2003-03-04', 'enrique.esquivel@example.com', '2022-08-15', NULL),
('Adriana', 'Guajardo Castaño', '2001-06-10', 'adriana.guajardo@example.com', '2020-08-15', NULL),
('Ivonne', 'Lemus Huerta', '2002-01-16', 'ivonne.lemus@example.com', '2021-08-15', NULL),
('Erick', 'Aldana Bustamante', '2003-08-05', 'erick.aldana@example.com', '2022-08-15', NULL),
('Pamela', 'Dueñas Quiñones', '2001-10-22', 'pamela.duenas@example.com', '2020-08-15', NULL),
('Víctor', 'Gallegos Acevedo', '2002-07-03', 'victor.gallegos@example.com', '2021-08-15', NULL),
('Bianca', 'Roldán Castañón', '2003-05-30', 'bianca.roldan@example.com', '2022-08-15', NULL),
('Francisco', 'Téllez Luna', '2001-02-13', 'francisco.tellez@example.com', '2020-08-15', NULL),
('Cecilia', 'Paz Nieves', '2002-10-20', 'cecilia.paz@example.com', '2021-08-15', NULL),
('Omar', 'Ramos Cedillo', '2003-12-08', 'omar.ramos@example.com', '2022-08-15', NULL),
('Nataly', 'Barragán Mejía', '2001-03-09', 'nataly.barragan@example.com', '2020-08-15', NULL),
('Axel', 'Villanueva Tapia', '2002-08-01', 'axel.villanueva@example.com', '2021-08-15', NULL),
('Melany', 'Alarcón Esparza', '2003-01-31', 'melany.alarcon@example.com', '2022-08-15', NULL),
('Cristian', 'Hernández Avilés', '2001-07-29', 'cristian.hernandez@example.com', '2020-08-15', NULL),
('Noelia', 'Carrizales Montes', '2002-05-08', 'noelia.carrizales@example.com', '2021-08-15', NULL),
('Jonathan', 'Ochoa Garza', '2003-09-24', 'jonathan.ochoa@example.com', '2022-08-15', NULL),
('Karla', 'Escamilla Mota', '2001-10-16', 'karla.escamilla@example.com', '2020-08-15', NULL),
('Joel', 'Sierra Beltrán', '2002-03-13', 'joel.sierra@example.com', '2021-08-15', NULL),
('Verónica', 'Rocha Lizárraga', '2003-06-06', 'veronica.rocha@example.com', '2022-08-15', NULL),
('Bruno', 'Reynoso Palma', '2001-12-29', 'bruno.reynoso@example.com', '2020-08-15', NULL),
('Araceli', 'Esparza Andrade', '2002-11-17', 'araceli.esparza@example.com', '2021-08-15', NULL),
('Rafael', 'Avendaño Del Ángel', '2003-02-02', 'rafael.avendano@example.com', '2022-08-15', NULL),
('Nancy', 'Galindo Carranza', '2001-05-05', 'nancy.galindo@example.com', '2020-08-15', NULL),
('Kevin', 'Padilla Ledesma', '2002-09-07', 'kevin.padilla@example.com', '2021-08-15', NULL),
('Daniela', 'Cedillo Bolaños', '2003-11-29', 'daniela.cedillo@example.com', '2022-08-15', NULL),
('Jesús', 'Mota Lerma', '2001-08-03', 'jesus.mota@example.com', '2020-08-15', NULL),
('María José', 'Osorio Tinoco', '2002-04-26', 'maria.osorio@example.com', '2021-08-15', NULL),
('Fernando', 'Gálvez Hoyos', '2003-10-13', 'fernando.galvez@example.com', '2022-08-15', NULL),
('Antonia', 'Durán Llamas', '2001-09-01', 'antonia.duran@example.com', '2020-08-15', NULL),
('Ulises', 'Saldaña Tovar', '2002-06-19', 'ulises.saldana@example.com', '2021-08-15', NULL),
('Luz', 'Madrigal Cornejo', '2003-01-21', 'luz.madrigal@example.com', '2022-08-15', NULL),
('Alan', 'Aragón Terrazas', '2001-11-04', 'alan.aragon@example.com', '2020-08-15', NULL);
INSERT INTO estudiantes (nombre, apellidos, fecha_nacimiento, correo, fecha_ingreso, fecha_egreso) VALUES
('Diana', 'Morales Tejada', '2002-04-10', 'diana.morales@example.com', '2020-08-15', NULL),
('Luis', 'Sánchez Cordero', '2001-12-05', 'luis.sanchez@example.com', '2019-08-15', '2024-06-30'),
('Gloria', 'Cervantes Bravo', '2003-07-21', 'gloria.cervantes@example.com', '2022-08-15', NULL),
('Mario', 'Delgado Romero', '2000-09-11', 'mario.delgado@example.com', '2018-08-15', '2024-06-30'),
('Flor', 'Gómez Toledo', '2002-10-01', 'flor.gomez@example.com', '2020-08-15', NULL),
('Tomás', 'Medina Ocampo', '2001-05-09', 'tomas.medina@example.com', '2019-08-15', '2024-06-30'),
('Isabel', 'Montoya Aguirre', '2003-03-15', 'isabel.montoya@example.com', '2022-08-15', NULL),
('Jorge', 'Reyes Lozano', '2000-11-30', 'jorge.reyes@example.com', '2018-08-15', '2024-06-30'),
('Elsa', 'Palacios Nieto', '2002-06-17', 'elsa.palacios@example.com', '2020-08-15', NULL),
('Rubén', 'Rivas Domínguez', '2001-01-03', 'ruben.rivas@example.com', '2019-08-15', '2024-06-30'),
('Carmen', 'Bermúdez Nava', '2003-09-29', 'carmen.bermudez@example.com', '2022-08-15', NULL),
('Óscar', 'Vallejo Soria', '2000-04-14', 'oscar.vallejo@example.com', '2018-08-15', '2024-06-30'),
('Julia', 'Castañeda Pacheco', '2002-11-08', 'julia.castaneda@example.com', '2020-08-15', NULL),
('Alan', 'Benítez Cisneros', '2001-08-24', 'alan.benitez@example.com', '2019-08-15', '2024-06-30'),
('Lucía', 'Zamora Ferrer', '2003-02-12', 'lucia.zamora@example.com', '2022-08-15', NULL),
('Gabriel', 'Peralta Rangel', '2000-06-06', 'gabriel.peralta@example.com', '2018-08-15', '2024-06-30'),
('Valeria', 'Cruz Vélez', '2002-12-20', 'valeria.cruz@example.com', '2020-08-15', NULL),
('Iván', 'Téllez Escamilla', '2001-04-01', 'ivan.tellez@example.com', '2019-08-15', '2024-06-30'),
('Lourdes', 'Herrera Gallardo', '2003-10-18', 'lourdes.herrera@example.com', '2022-08-15', NULL),
('Eduardo', 'Robles Durán', '2000-07-27', 'eduardo.robles@example.com', '2018-08-15', '2024-06-30'),
('Paola', 'Núñez Orozco', '2002-01-25', 'paola.nunez@example.com', '2020-08-15', NULL),
('Ramón', 'Quiroga Cedillo', '2001-10-06', 'ramon.quiroga@example.com', '2019-08-15', '2024-06-30'),
('Angela', 'Lozano Figueroa', '2003-08-13', 'angela.lozano@example.com', '2022-08-15', NULL),
('Julio', 'Zavala Peña', '2000-02-09', 'julio.zavala@example.com', '2018-08-15', '2024-06-30'),
('Berenice', 'Estrada Barrera', '2002-05-05', 'berenice.estrada@example.com', '2020-08-15', NULL),
('Héctor', 'Acosta Solano', '2001-03-18', 'hector.acosta@example.com', '2019-08-15', '2024-06-30'),
('Irene', 'Arroyo Molina', '2003-06-23', 'irene.arroyo@example.com', '2022-08-15', NULL),
('Samuel', 'Paredes Andrade', '2000-10-16', 'samuel.paredes@example.com', '2018-08-15', '2024-06-30'),
('Marisol', 'Guerrero Alvarado', '2002-03-07', 'marisol.guerrero@example.com', '2020-08-15', NULL),
('Rodrigo', 'Peñaloza Avendaño', '2001-09-12', 'rodrigo.penaloza@example.com', '2019-08-15', '2024-06-30'),
('Selene', 'Treviño Varela', '2003-11-05', 'selene.trevino@example.com', '2022-08-15', NULL),
('Fabián', 'Montes Gálvez', '2000-01-20', 'fabian.montes@example.com', '2018-08-15', '2024-06-30'),
('Sofía', 'Rivero Carrión', '2002-09-30', 'sofia.rivero@example.com', '2020-08-15', NULL),
('Matías', 'Ávila Cervantes', '2001-06-02', 'matias.avila@example.com', '2019-08-15', '2024-06-30'),
('Adela', 'Escobedo Ríos', '2003-01-29', 'adela.escobedo@example.com', '2022-08-15', NULL),
('Andrés', 'Cuevas Gallegos', '2000-08-08', 'andres.cuevas@example.com', '2018-08-15', '2024-06-30'),
('Rocío', 'Bautista Méndez', '2002-06-14', 'rocio.bautista@example.com', '2020-08-15', NULL),
('Emanuel', 'Valenzuela Aguado', '2001-11-11', 'emanuel.valenzuela@example.com', '2019-08-15', '2024-06-30'),
('Renata', 'Barrera Nava', '2003-12-03', 'renata.barrera@example.com', '2022-08-15', NULL),
('Axel', 'Carreón Luna', '2000-03-03', 'axel.carreon@example.com', '2018-08-15', '2024-06-30'),
('Yolanda', 'Velasco Becerra', '2002-07-15', 'yolanda.velasco@example.com', '2020-08-15', NULL),
('Cristóbal', 'Zúñiga Beltrán', '2001-01-30', 'cristobal.zuniga@example.com', '2019-08-15', '2024-06-30'),
('Itzel', 'Campos Olmos', '2003-04-04', 'itzel.campos@example.com', '2022-08-15', NULL),
('Esteban', 'Cornejo Arce', '2000-05-17', 'esteban.cornejo@example.com', '2018-08-15', '2024-06-30'),
('Karina', 'Chávez Mercado', '2002-08-26', 'karina.chavez@example.com', '2020-08-15', NULL),
('Saúl', 'Naranjo Rivas', '2001-07-07', 'saul.naranjo@example.com', '2019-08-15', '2024-06-30'),
('Beatriz', 'Olguín Serrano', '2003-10-10', 'beatriz.olguin@example.com', '2022-08-15', NULL),
('Miguel', 'Toledo Taboada', '2000-12-27', 'miguel.toledo@example.com', '2018-08-15', '2024-06-30');


INSERT INTO apoyo_financiero (id_estudiante, porcentaje_beca, activo) VALUES
(1, 100, true),
(2, 50, true),
(3, 75, false),
(4, 25, true),
(5, 50, false),
(6, 100, true),
(7, 0, false),
(8, 25, true),
(9, 75, true),
(10, 50, false),
(11, 100, true),
(12, 50, true),
(13, 75, false),
(14, 25, true),
(15, 50, false),
(16, 100, true),
(17, 0, false),
(18, 25, true),
(19, 75, true),
(20, 50, false),
(21, 100, true),
(22, 50, true),
(23, 75, false),
(24, 25, true),
(25, 50, false),
(26, 100, true),
(27, 0, false),
(28, 25, true),
(29, 75, true),
(30, 50, false),
(31, 100, true),
(32, 50, true),
(33, 75, false),
(34, 25, true),
(35, 50, false),
(36, 100, true),
(37, 0, false),
(38, 25, true),
(39, 75, true),
(40, 50, false),
(41, 100, true),
(42, 50, true),
(43, 75, false),
(44, 25, true),
(45, 50, false),
(46, 100, true),
(47, 0, false),
(48, 25, true),
(49, 75, true),
(50, 50, false);
INSERT INTO horas_beca (id_apoyo, movimiento, descripcion, ciclo) VALUES
-- id_apoyo 1, 100% beca, activo true → 160 horas, solo parte realizadas
(1, 160, 'Asignación inicial de horas', '2024-A'),
(1, -40, 'Participación en biblioteca', '2024-A'),
(1, -20, 'Apoyo en laboratorio', '2024-B'),

-- id_apoyo 2, 50%, activo true → 80 horas, parcialmente realizadas
(2, 80, 'Asignación inicial de horas', '2024-A'),
(2, -30, 'Actividades deportivas', '2024-B'),

-- id_apoyo 3, 75%, activo false → 120 horas, todo realizado
(3, 120, 'Asignación inicial de horas', '2024-A'),
(3, -60, 'Taller de lectura', '2024-A'),
(3, -60, 'Eventos institucionales', '2024-B'),

-- id_apoyo 4, 25%, activo true → 40 horas, ninguna realizada
(4, 40, 'Asignación inicial de horas', '2024-B'),

-- id_apoyo 5, 50%, activo false → 80 horas, todas realizadas
(5, 80, 'Asignación inicial de horas', '2024-A'),
(5, -80, 'Apoyo administrativo', '2024-B'),

-- id_apoyo 6, 100%, activo true → 160 horas, mitad realizada
(6, 160, 'Asignación inicial de horas', '2024-B'),
(6, -80, 'Atención en biblioteca', '2025-A'),

-- id_apoyo 7, 0%, no genera movimientos
-- (ningún registro para id_apoyo 7)

-- id_apoyo 8, 25%, activo true → 40 horas, parcialmente realizadas
(8, 40, 'Asignación inicial de horas', '2024-A'),
(8, -20, 'Apoyo en eventos', '2024-B'),

-- id_apoyo 9, 75%, activo true → 120 horas, casi todas realizadas
(9, 120, 'Asignación inicial de horas', '2024-A'),
(9, -60, 'Soporte técnico', '2024-B'),
(9, -40, 'Tutorías', '2025-A'),

-- id_apoyo 10, 50%, activo false → 80 horas, todas realizadas
(10, 80, 'Asignación inicial de horas', '2024-A'),
(10, -30, 'Mantenimiento de laboratorio', '2024-B'),
(10, -50, 'Asistencia a eventos', '2025-A');
INSERT INTO horas_beca (id_apoyo, movimiento, descripcion, ciclo) VALUES
(11, 160, 'Asignación inicial de horas', '2025-A'),
(11, -52, 'Actividad realizada', '2025-A'),
(12, 80, 'Asignación inicial de horas', '2024-B'),
(12, -51, 'Actividad realizada', '2024-B'),
(13, 120, 'Asignación inicial de horas', '2025-A'),
(13, -12, 'Actividad realizada', '2024-A'),
(13, -32, 'Actividad realizada', '2025-A'),
(13, -34, 'Actividad realizada', '2024-B'),
(13, -14, 'Actividad realizada', '2025-A'),
(13, -18, 'Actividad realizada', '2024-B'),
(13, -10, 'Actividad realizada', '2024-A'),
(14, 40, 'Asignación inicial de horas', '2025-A'),
(14, -8, 'Actividad realizada', '2024-A'),
(15, 80, 'Asignación inicial de horas', '2024-A'),
(15, -21, 'Actividad realizada', '2024-B'),
(15, -41, 'Actividad realizada', '2024-B'),
(15, -18, 'Actividad realizada', '2024-B'),
(16, 160, 'Asignación inicial de horas', '2024-A'),
(16, -17, 'Actividad realizada', '2025-A'),
(16, -17, 'Actividad realizada', '2025-A'),
(16, -26, 'Actividad realizada', '2024-A'),
(16, -51, 'Actividad realizada', '2025-A'),
(16, -4, 'Actividad realizada', '2024-A'),
(18, 40, 'Asignación inicial de horas', '2024-A'),
(18, -7, 'Actividad realizada', '2025-A'),
(19, 120, 'Asignación inicial de horas', '2025-A'),
(19, -14, 'Actividad realizada', '2024-B'),
(20, 80, 'Asignación inicial de horas', '2025-A'),
(20, -11, 'Actividad realizada', '2024-B'),
(20, -17, 'Actividad realizada', '2024-B'),
(20, -19, 'Actividad realizada', '2024-B'),
(20, -33, 'Actividad realizada', '2025-A'),
(21, 160, 'Asignación inicial de horas', '2024-A'),
(21, -53, 'Actividad realizada', '2025-A'),
(21, -22, 'Actividad realizada', '2024-B'),
(22, 80, 'Asignación inicial de horas', '2024-A'),
(22, -23, 'Actividad realizada', '2025-A'),
(23, 120, 'Asignación inicial de horas', '2024-B'),
(23, -38, 'Actividad realizada', '2024-B'),
(23, -54, 'Actividad realizada', '2025-A'),
(23, -28, 'Actividad realizada', '2024-B'),
(24, 40, 'Asignación inicial de horas', '2024-B'),
(24, -12, 'Actividad realizada', '2024-A'),
(25, 80, 'Asignación inicial de horas', '2024-A'),
(25, -52, 'Actividad realizada', '2024-A'),
(25, -25, 'Actividad realizada', '2025-A'),
(25, -3, 'Actividad realizada', '2024-A'),
(26, 160, 'Asignación inicial de horas', '2024-B'),
(26, -33, 'Actividad realizada', '2024-A'),
(28, 40, 'Asignación inicial de horas', '2025-A'),
(28, -13, 'Actividad realizada', '2024-A'),
(29, 120, 'Asignación inicial de horas', '2024-A'),
(29, -34, 'Actividad realizada', '2025-A'),
(29, -44, 'Actividad realizada', '2024-A'),
(30, 80, 'Asignación inicial de horas', '2024-B'),
(30, -51, 'Actividad realizada', '2024-A'),
(30, -18, 'Actividad realizada', '2024-A'),
(30, -11, 'Actividad realizada', '2025-A');

INSERT INTO horas_beca (id_apoyo, movimiento, descripcion, ciclo) VALUES
(31, 160, 'Asignación inicial de horas', '2025-A'),
(31, -48, 'Actividad realizada', '2025-A'),
(31, -51, 'Actividad realizada', '2025-B'),

(32, 80, 'Asignación inicial de horas', '2025-A'),
(32, -40, 'Actividad realizada', '2025-B'),

(33, 120, 'Asignación inicial de horas', '2025-A'),
(33, -45, 'Actividad realizada', '2025-A'),
(33, -40, 'Actividad realizada', '2025-B'),
(33, -35, 'Actividad realizada', '2025-B'),

(34, 40, 'Asignación inicial de horas', '2025-A'),
(34, -20, 'Actividad realizada', '2025-A'),

(35, 80, 'Asignación inicial de horas', '2025-B'),
(35, -30, 'Actividad realizada', '2025-A'),
(35, -50, 'Actividad realizada', '2025-B'),

(36, 160, 'Asignación inicial de horas', '2025-A'),
(36, -32, 'Actividad realizada', '2025-B'),
(36, -47, 'Actividad realizada', '2025-A'),
(36, -38, 'Actividad realizada', '2025-B'),

-- (37) 0%, no se asignan horas

(38, 40, 'Asignación inicial de horas', '2025-B'),
(38, -12, 'Actividad realizada', '2025-A'),

(39, 120, 'Asignación inicial de horas', '2025-A'),
(39, -34, 'Actividad realizada', '2025-B'),
(39, -21, 'Actividad realizada', '2025-B'),

(40, 80, 'Asignación inicial de horas', '2025-A'),
(40, -80, 'Actividad realizada', '2025-B'),

(41, 160, 'Asignación inicial de horas', '2025-B'),
(41, -40, 'Actividad realizada', '2025-B'),
(41, -65, 'Actividad realizada', '2025-A'),

(42, 80, 'Asignación inicial de horas', '2025-A'),
(42, -52, 'Actividad realizada', '2025-A'),

(43, 120, 'Asignación inicial de horas', '2025-A'),
(43, -60, 'Actividad realizada', '2025-B'),
(43, -60, 'Actividad realizada', '2025-A'),

(44, 40, 'Asignación inicial de horas', '2025-B'),
(44, -15, 'Actividad realizada', '2025-B'),

(45, 80, 'Asignación inicial de horas', '2025-B'),
(45, -38, 'Actividad realizada', '2025-B'),
(45, -42, 'Actividad realizada', '2025-A'),

(46, 160, 'Asignación inicial de horas', '2025-A'),
(46, -40, 'Actividad realizada', '2025-B'),
(46, -32, 'Actividad realizada', '2025-B'),

-- (47) 0%, no se asignan horas

(48, 40, 'Asignación inicial de horas', '2025-A'),
(48, -24, 'Actividad realizada', '2025-B'),

(49, 120, 'Asignación inicial de horas', '2025-B'),
(49, -30, 'Actividad realizada', '2025-A'),
(49, -44, 'Actividad realizada', '2025-B'),

(50, 80, 'Asignación inicial de horas', '2025-A'),
(50, -50, 'Actividad realizada', '2025-A'),
(50, -30, 'Actividad realizada', '2025-B');

INSERT INTO cursos (nombre, creditos) VALUES
('Matemáticas I', 6),
('Física General', 5),
('Química Básica', 4),
('Programación I', 6),
('Comunicación Oral y Escrita', 3),
('Historia Universal', 4),
('Biología General', 5),
('Estadística Aplicada', 4),
('Algoritmos y Estructuras de Datos', 6),
('Ética Profesional', 2),
('Bases de Datos', 5),
('Contabilidad Básica', 3),
('Redacción Académica', 3),
('Cálculo Diferencial', 6),
('Inteligencia Artificial', 5);


INSERT INTO profesores (nombres, apellidos, correo) VALUES
('Laura Fernanda', 'Cárdenas Ruiz', 'lcardenas1@universidad.edu'),
('José Luis', 'Montoya Herrera', 'jmontoya2@universidad.edu'),
('Ana Paulina', 'López Morales', 'aplopez3@universidad.edu'),
('Carlos Eduardo', 'Ramírez Vega', 'cramirez4@universidad.edu'),
('Martha Cecilia', 'Gómez Sánchez', 'mgomez5@universidad.edu'),
('Juan Antonio', 'Pérez Torres', 'jperez6@universidad.edu'),
('Daniela Sofía', 'Ríos Mendoza', 'drios7@universidad.edu'),
('Ricardo Andrés', 'Salas Pineda', 'rsalas8@universidad.edu'),
('Camila Alejandra', 'Molina Duarte', 'cmolina9@universidad.edu'),
('Luis Alberto', 'Navarro Castillo', 'lnavarro10@universidad.edu'),
('Patricia Elena', 'Arroyo Vargas', 'parroyo11@universidad.edu'),
('Sebastián Iván', 'Correa Lozano', 'scorrea12@universidad.edu'),
('Verónica Judith', 'Rosales Méndez', 'vrosales13@universidad.edu'),
('Francisco Javier', 'Acosta Villalobos', 'facosta14@universidad.edu'),
('Gabriela Marcela', 'Durán Esquivel', 'gduran15@universidad.edu'),
('David Alejandro', 'Cruz Hernández', 'dcruz16@universidad.edu'),
('Sandra Beatriz', 'Núñez Camacho', 'snunez17@universidad.edu'),
('Héctor Manuel', 'Vargas Rentería', 'hvargas18@universidad.edu'),
('Lucía Renata', 'Valencia Molina', 'lvalencia19@universidad.edu'),
('Tomás Enrique', 'Figueroa Salgado', 'tfigueroa20@universidad.edu');


INSERT INTO secciones (seccion, id_curso, id_profesor, ciclo) VALUES
(10, 1, 1, '2024-A'),
(11, 2, 2, '2024-A'),
(12, 3, 3, '2024-A'),
(13, 4, 4, '2024-A'),
(14, 5, 5, '2024-A'),
(15, 6, 6, '2024-A'),
(16, 7, 7, '2024-A'),
(17, 8, 8, '2024-A'),
(18, 9, 9, '2024-A'),
(19, 10, 10, '2024-A'),
(20, 11, 11, '2024-A'),
(21, 12, 12, '2024-A'),
(22, 13, 13, '2024-A'),
(23, 14, 14, '2024-A'),
(24, 15, 15, '2024-A'),

(25, 1, 16, '2024-B'),
(26, 2, 17, '2024-B'),
(27, 3, 18, '2024-B'),
(28, 4, 19, '2024-B'),
(29, 5, 20, '2024-B'),
(30, 6, 1, '2024-B'),
(31, 7, 2, '2024-B'),
(32, 8, 3, '2024-B'),
(33, 9, 4, '2024-B'),
(34, 10, 5, '2024-B'),
(35, 11, 6, '2024-B'),
(36, 12, 7, '2024-B'),
(37, 13, 8, '2024-B'),
(38, 14, 9, '2024-B'),
(39, 15, 10, '2024-B'),

(40, 1, 11, '2025-A'),
(41, 2, 12, '2025-A'),
(42, 3, 13, '2025-A'),
(43, 4, 14, '2025-A'),
(44, 5, 15, '2025-A'),
(45, 6, 16, '2025-A'),
(46, 7, 17, '2025-A'),
(47, 8, 18, '2025-A'),
(48, 9, 19, '2025-A'),
(49, 10, 20, '2025-A'),
(50, 11, 1, '2025-A'),
(51, 12, 2, '2025-A'),
(52, 13, 3, '2025-A'),
(53, 14, 4, '2025-A'),
(54, 15, 5, '2025-A');


INSERT INTO secciones_estudiantes (id_estudiante, id_seccion, aprobado) VALUES
(1, 1, TRUE),
(2, 2, TRUE),
(3, 3, FALSE),
(4, 4, TRUE),
(5, 5, FALSE),
(6, 6, TRUE),
(7, 7, TRUE),
(8, 8, FALSE),
(9, 9, TRUE),
(10, 10, FALSE),
(11, 11, TRUE),
(12, 12, TRUE),
(13, 13, FALSE),
(14, 14, TRUE),
(15, 15, FALSE),
(16, 16, TRUE),
(17, 17, TRUE),
(18, 18, FALSE),
(19, 19, TRUE),
(20, 20, FALSE),
(21, 21, TRUE),
(22, 22, FALSE),
(23, 23, TRUE),
(24, 24, FALSE),
(25, 25, TRUE),
(26, 26, TRUE),
(27, 27, FALSE),
(28, 28, TRUE),
(29, 29, FALSE),
(30, 30, TRUE),
(31, 31, TRUE),
(32, 32, FALSE),
(33, 33, TRUE),
(34, 34, FALSE),
(35, 35, TRUE),
(36, 36, TRUE),
(37, 37, FALSE),
(38, 38, TRUE),
(39, 39, FALSE),
(40, 40, TRUE),
(41, 41, TRUE),
(42, 42, FALSE),
(43, 43, TRUE),
(44, 44, FALSE),
(45, 45, TRUE),
(46, 1, FALSE),
(47, 2, TRUE),
(48, 3, FALSE),
(49, 4, TRUE),
(50, 5, FALSE),
(1, 6, TRUE),
(2, 7, TRUE),
(3, 8, FALSE),
(4, 9, TRUE),
(5, 10, FALSE),
(6, 11, TRUE),
(7, 12, FALSE),
(8, 13, TRUE);


INSERT INTO secciones_estudiantes (id_estudiante, id_seccion, aprobado) VALUES
(1, 1, TRUE),
(2, 1, TRUE),
(3, 1, FALSE),
(4, 2, TRUE),
(5, 2, FALSE),
(6, 2, TRUE),
(7, 3, TRUE),
(8, 3, FALSE),
(9, 3, TRUE),
(10, 4, TRUE),
(11, 4, TRUE),
(12, 5, FALSE),
(13, 5, TRUE),
(14, 6, FALSE),
(15, 6, TRUE),
(16, 7, TRUE),
(17, 8, TRUE),
(18, 8, TRUE),
(19, 8, FALSE),
(20, 9, FALSE),
(21, 9, TRUE),
(22, 9, TRUE),
(23, 10, TRUE),
(24, 10, TRUE),
(25, 11, FALSE),
(26, 11, TRUE),
(27, 12, TRUE),
(28, 12, TRUE),
(29, 13, FALSE),
(30, 13, TRUE),
(31, 14, TRUE),
(32, 15, FALSE),
(33, 15, TRUE),
(34, 15, TRUE),
(35, 16, TRUE),
(36, 16, FALSE),
(37, 16, TRUE),
(38, 17, TRUE),
(39, 17, TRUE),
(40, 18, FALSE),
(41, 18, TRUE),
(42, 19, TRUE),
(43, 19, FALSE),
(44, 20, TRUE),
(45, 20, TRUE),
(46, 21, FALSE),
(47, 21, TRUE),
(48, 22, TRUE),
(49, 23, TRUE),
(50, 23, FALSE),
(51, 23, TRUE),
(52, 24, TRUE),
(53, 24, FALSE),
(54, 25, TRUE),
(55, 25, TRUE),
(56, 25, TRUE),
(57, 26, FALSE),
(58, 27, TRUE),
(59, 28, TRUE),
(60, 28, TRUE),
(61, 29, TRUE),
(62, 30, FALSE),
(63, 30, TRUE),
(64, 30, TRUE),
(65, 31, TRUE),
(66, 32, TRUE),
(67, 33, FALSE),
(68, 34, TRUE),
(69, 34, FALSE),
(70, 35, TRUE),
(71, 35, TRUE),
(72, 36, TRUE),
(73, 36, FALSE),
(74, 36, TRUE),
(75, 37, TRUE),
(76, 37, FALSE),
(77, 38, TRUE),
(78, 39, TRUE),
(79, 39, FALSE),
(80, 40, TRUE),
(81, 41, FALSE),
(82, 41, TRUE),
(83, 42, TRUE),
(84, 43, TRUE),
(85, 43, TRUE),
(86, 44, FALSE),
(87, 44, TRUE),
(88, 45, TRUE),
(89, 45, FALSE),
(90, 1, TRUE),
(91, 2, TRUE),
(92, 3, FALSE),
(93, 4, TRUE),
(94, 5, TRUE),
(95, 6, TRUE),
(96, 7, FALSE),
(97, 8, TRUE),
(98, 9, FALSE),
(99, 10, TRUE),
(100, 11, TRUE),
(101, 12, FALSE),
(102, 13, TRUE),
(103, 14, TRUE),
(104, 15, FALSE),
(105, 16, TRUE),
(106, 17, FALSE),
(107, 18, TRUE),
(108, 19, TRUE),
(109, 20, TRUE),
(110, 21, FALSE),
(111, 22, TRUE),
(112, 23, FALSE),
(113, 24, TRUE),
(114, 25, TRUE),
(115, 26, TRUE),
(116, 27, FALSE),
(117, 28, TRUE),
(118, 29, TRUE),
(119, 30, TRUE),
(120, 31, FALSE),
(121, 32, TRUE),
(122, 33, FALSE),
(123, 34, TRUE),
(124, 35, TRUE),
(125, 36, FALSE);


INSERT INTO secciones_estudiantes (id_estudiante, id_seccion, aprobado) VALUES
(108, 21, TRUE),
(121, 43, TRUE),
(23, 28, FALSE),
(77, 29, FALSE),
(14, 12, FALSE),
(83, 42, FALSE),
(121, 34, FALSE),
(112, 23, FALSE),
(43, 27, TRUE),
(3, 21, FALSE),
(111, 25, FALSE),
(10, 6, FALSE),
(106, 21, FALSE),
(17, 37, TRUE),
(22, 24, TRUE),
(73, 6, FALSE),
(81, 20, FALSE),
(97, 17, TRUE),
(44, 20, FALSE),
(99, 31, FALSE),
(54, 24, FALSE),
(23, 43, FALSE),
(52, 3, TRUE),
(54, 10, FALSE),
(65, 25, TRUE),
(36, 36, TRUE),
(71, 18, FALSE),
(82, 16, FALSE),
(3, 2, TRUE),
(14, 43, FALSE),
(15, 17, TRUE),
(68, 27, TRUE),
(51, 12, TRUE),
(72, 39, TRUE),
(67, 2, FALSE),
(31, 15, FALSE),
(123, 10, FALSE),
(30, 20, TRUE),
(94, 5, TRUE),
(96, 13, TRUE),
(67, 12, TRUE),
(65, 43, FALSE),
(80, 4, TRUE),
(113, 25, FALSE),
(95, 28, TRUE),
(2, 17, TRUE),
(76, 28, FALSE),
(93, 38, TRUE),
(26, 45, FALSE),
(86, 18, FALSE),
(31, 31, TRUE),
(64, 29, TRUE),
(78, 39, FALSE),
(88, 37, FALSE),
(15, 4, TRUE),
(78, 11, TRUE)
-- ...continúa hasta completar 125 filas
;
INSERT INTO secciones_estudiantes (id_estudiante, id_seccion, aprobado) VALUES
(20, 11, TRUE),
(19, 12, FALSE),
(85, 10, TRUE),
(1, 14, FALSE),
(91, 22, TRUE),
(45, 16, TRUE),
(5, 21, FALSE),
(32, 9, TRUE),
(40, 20, FALSE),
(50, 8, FALSE),
(66, 18, TRUE),
(9, 35, FALSE),
(100, 6, TRUE),
(12, 7, FALSE),
(6, 30, TRUE),
(60, 23, TRUE),
(33, 11, TRUE),
(24, 13, FALSE),
(55, 9, TRUE),
(59, 31, FALSE),
(13, 34, TRUE),
(18, 27, FALSE),
(105, 33, TRUE),
(46, 4, TRUE),
(116, 19, FALSE),
(8, 41, TRUE),
(35, 40, FALSE),
(90, 44, TRUE),
(84, 15, FALSE),
(7, 1, TRUE),
(25, 38, FALSE),
(104, 3, TRUE),
(98, 45, TRUE),
(107, 5, FALSE),
(63, 33, TRUE),
(39, 24, TRUE),
(29, 36, TRUE),
(28, 16, FALSE),
(109, 19, TRUE),
(38, 26, FALSE),
(58, 14, TRUE),
(74, 1, FALSE),
(62, 35, TRUE),
(117, 32, FALSE),
(34, 30, TRUE),
(53, 41, TRUE),
(4, 7, FALSE),
(47, 8, TRUE),
(102, 44, FALSE),
(56, 32, TRUE),
(61, 13, FALSE),
(119, 26, TRUE),
(120, 22, TRUE),
(115, 42, FALSE),
(87, 9, TRUE),
(75, 34, TRUE),
(103, 6, FALSE),
(110, 29, FALSE),
(37, 10, TRUE),
(122, 7, TRUE),
(27, 37, FALSE),
(101, 36, TRUE),
(16, 5, FALSE),
(118, 15, TRUE),
(70, 3, FALSE),
(89, 18, TRUE),
(42, 39, TRUE),
(48, 40, FALSE),
(92, 2, TRUE),
(41, 38, TRUE),
(57, 1, FALSE),
(69, 17, TRUE),
(114, 23, FALSE),
(49, 4, TRUE)
;


INSERT INTO salones (edificio, numero, capacidad) VALUES
('A', 101, 30),
('A', 102, 35),
('B', 201, 40),
('B', 202, 45),
('C', 301, 25),
('C', 302, 50),
('D', 401, 60),
('D', 402, 55),
('E', 501, 40),
('E', 502, 30),
('E', 503, 30);

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (1, 1, 'Lunes', '08:00:00', '10:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (1, 1, 'Miércoles', '08:00:00', '09:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (26, 1, 'Martes', '17:00:00', '18:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (36, 1, 'Lunes', '17:00:00', '18:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (11, 1, 'Lunes', '14:00:00', '16:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (41, 1, 'Jueves', '18:00:00', '19:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (31, 1, 'Jueves', '14:00:00', '15:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (16, 1, 'Viernes', '11:00:00', '13:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (6, 1, 'Martes', '07:00:00', '08:30:00');

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (7, 2, 'Miércoles', '08:30:00', '10:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (17, 2, 'Miércoles', '10:00:00', '11:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (32, 2, 'Miércoles', '15:00:00', '17:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (42, 2, 'Jueves', '19:00:00', '20:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (12, 2, 'Martes', '13:00:00', '15:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (2, 2, 'Martes', '09:00:00', '11:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (2, 2, 'Jueves', '09:00:00', '10:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (37, 2, 'Lunes', '18:30:00', '20:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (27, 2, 'Miércoles', '18:30:00', '20:00:00');

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (3, 3, 'Lunes', '10:00:00', '11:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (3, 3, 'Viernes', '10:00:00', '12:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (13, 3, 'Viernes', '13:00:00', '15:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (18, 3, 'Jueves', '09:00:00', '10:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (28, 3, 'Jueves', '15:00:00', '16:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (38, 3, 'Lunes', '20:00:00', '21:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (43, 3, 'Martes', '20:00:00', '21:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (33, 3, 'Jueves', '13:00:00', '15:00:00');

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (1, 4, 'Lunes', '13:00:00', '15:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (4, 4, 'Miércoles', '08:00:00', '10:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (39, 4, 'Viernes', '07:00:00', '08:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (29, 4, 'Lunes', '07:00:00', '09:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (19, 4, 'Viernes', '08:00:00', '09:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (9, 4, 'Viernes', '11:00:00', '13:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (44, 4, 'Viernes', '17:00:00', '18:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (34, 4, 'Viernes', '14:00:00', '15:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (14, 4, 'Jueves', '14:00:00', '15:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (24, 4, 'Martes', '08:00:00', '10:00:00');

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (25, 5, 'Lunes', '07:00:00', '08:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (15, 5, 'Lunes', '20:00:00', '21:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (35, 5, 'Lunes', '15:00:00', '16:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (45, 5, 'Lunes', '16:00:00', '18:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (10, 5, 'Lunes', '13:00:00', '14:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (20, 5, 'Jueves', '09:00:00', '11:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (30, 5, 'Martes', '08:00:00', '09:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (40, 5, 'Lunes', '08:00:00', '10:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (5, 5, 'Miércoles', '09:00:00', '11:00:00');

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (2, 6, 'Viernes', '07:00:00', '08:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (6, 6, 'Lunes', '10:00:00', '11:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (6, 6, 'Viernes', '10:00:00', '12:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (16, 6, 'Martes', '08:00:00', '09:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (26, 6, 'Martes', '09:00:00', '10:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (31, 6, 'Martes', '10:00:00', '11:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (41, 6, 'Miércoles', '10:00:00', '11:30:00'); -- cambiado de día
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (21, 6, 'Jueves', '10:30:00', '12:00:00');   -- cambiado de día
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (11, 6, 'Martes', '14:30:00', '16:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (1, 6, 'Martes', '17:00:00', '19:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (36, 6, 'Martes', '19:00:00', '20:00:00');

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (7, 7, 'Lunes', '13:00:00', '14:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (22, 7, 'Martes', '12:00:00', '13:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (32, 7, 'Miércoles', '11:00:00', '12:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (32, 7, 'Jueves', '11:00:00', '12:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (42, 7, 'Viernes', '11:00:00', '13:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (27, 7, 'Miércoles', '06:00:00', '07:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (37, 7, 'Miércoles', '10:00:00', '11:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (2, 7, 'Miércoles', '18:00:00', '20:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (12, 7, 'Miércoles', '16:00:00', '17:30:00');


INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (8, 8, 'Miércoles', '12:00:00', '14:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (18, 8, 'Jueves', '14:00:00', '16:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (28, 8, 'Viernes', '10:00:00', '12:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (3, 8, 'Jueves', '19:00:00', '21:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (33, 8, 'Martes', '12:30:00', '14:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (43, 8, 'Viernes', '13:00:00', '14:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (23, 8, 'Lunes', '13:30:00', '15:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (13, 8, 'Jueves', '17:30:00', '19:00:00');

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (14, 9, 'Viernes', '19:00:00', '20:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (9, 9, 'Miércoles', '11:00:00', '12:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (9, 9, 'Viernes', '07:00:00', '08:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (24, 9, 'Viernes', '15:00:00', '16:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (44, 9, 'Lunes', '14:30:00', '16:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (34, 9, 'Martes', '14:00:00', '15:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (29, 9, 'Viernes', '11:00:00', '13:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (19, 9, 'Viernes', '13:00:00', '14:00:00');

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (20, 10, 'Lunes', '12:00:00', '14:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (10, 10, 'Jueves', '13:00:00', '14:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (30, 10, 'Lunes', '15:00:00', '16:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (15, 10, 'Lunes', '20:00:00', '21:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (25, 10, 'Jueves', '16:30:00', '18:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (35, 10, 'Martes', '15:30:00', '17:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (45, 10, 'Viernes', '16:00:00', '17:30:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (3, 10, 'Martes', '11:00:00', '12:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (3, 10, 'Lunes', '07:00:00', '08:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (40, 10, 'Lunes', '17:00:00', '18:00:00');

INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (2, 11, 'Lunes', '12:00:00', '14:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (13, 11, 'Miércoles', '12:00:00', '13:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (17, 11, 'Miércoles', '15:00:00', '17:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (21, 11, 'Martes', '11:00:00', '13:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (22, 11, 'Martes', '10:00:00', '11:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (23, 11, 'Viernes', '09:00:00', '11:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (38, 11, 'Jueves', '7:00:00', '8:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (39, 11, 'Martes', '9:00:00', '10:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (4, 11, 'Viernes', '20:00:00', '21:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (5, 11, 'Lunes', '19:00:00', '21:00:00');
INSERT INTO horario (id_seccion, id_salon, dia, hora_inicio, hora_fin) VALUES (8, 11, 'Jueves', '10:00:00', '11:30:00');




-- ============================
-- Ciclo 2024-A (secciones 1–15)
-- ============================
--  1) Tarea inicial (10 pts) → 2024-02-15
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Tarea inicial', 'Lectura introductoria y preguntas', 10.0, '2024-02-15'
FROM generate_series(1,15) AS gs(id_seccion);

--  2) Hoja de trabajo (20 pts) → 2024-03-01
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Hoja de trabajo', 'Ejercicios prácticos básicos', 20.0, '2024-03-01'
FROM generate_series(1,15) AS gs(id_seccion);
--  3) Examen parcial (30 pts) → 2024-03-30
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Examen parcial', 'Evaluación de mitad de ciclo', 30.0, '2024-03-30'
FROM generate_series(1,15) AS gs(id_seccion);

--  4) Examen final (40 pts) → 2024-05-05
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Examen final', 'Prueba de conocimientos completos', 40.0, '2024-05-05'
FROM generate_series(1,15) AS gs(id_seccion);


-- ============================
-- Ciclo 2024-B (secciones 16–30)
-- ============================
--  1) Tarea inicial (15 pts) → 2024-08-20
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Tarea inicial', 'Lectura guiada y preguntas', 15.0, '2024-08-20'
FROM generate_series(16,30) AS gs(id_seccion);

--  2) Hoja de trabajo (15 pts) → 2024-09-05
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Hoja de trabajo', 'Problemas de aplicación', 15.0, '2024-09-05'
FROM generate_series(16,30) AS gs(id_seccion);

--  3) Proyecto intermedio (30 pts) → 2024-10-01
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Proyecto intermedio', 'Desarrollo de mini-proyecto', 30.0, '2024-10-01'
FROM generate_series(16,30) AS gs(id_seccion);

--  4) Examen final (40 pts) → 2024-11-10
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Examen final', 'Evaluación de todo el ciclo', 40.0, '2024-11-10'
FROM generate_series(16,30) AS gs(id_seccion);


-- ============================
-- Ciclo 2025-A (secciones 31–45)
-- ============================
--  1) Hoja de trabajo (25 pts) → 2025-02-18
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Hoja de trabajo', 'Ejercicios iniciales', 25.0, '2025-02-18'
FROM generate_series(31,45) AS gs(id_seccion);

--  2) Tarea práctica (25 pts) → 2025-03-10
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Tarea práctica', 'Práctica guiada', 25.0, '2025-03-10'
FROM generate_series(31,45) AS gs(id_seccion);

--  3) Examen parcial (50 pts) → 2025-04-15
INSERT INTO actividades (id_seccion, nombre, descripcion, valorNeto, fechaEntrega)
SELECT gs, 'Examen parcial', 'Revisión a mitad de ciclo', 50.0, '2025-04-15'
FROM generate_series(31,45) AS gs(id_seccion);


--CAMBIAR LA NOTA
update actividades_estudiantes as ae
set entregado = true, valorrelativo = fLOOR(RANDOM() * (100 - 1 + 1) +1)
from actividades as tareas
where ae.id_actividad = tareas.id
and tareas.id_seccion < 31;

update actividades_estudiantes as ae
set entregado = true, valorrelativo = fLOOR(RANDOM() * (100 - 1 + 1) +1)
from actividades as tareas
where ae.id_actividad = tareas.id
and tareas.id_seccion > 30
and tareas.valorneto = 25.0;