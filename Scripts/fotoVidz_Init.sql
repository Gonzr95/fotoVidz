use fotoVidz;
select * from geolocalizacion;
select * from album;

insert into usuario (mail, nombreDeUsuario, pass, hashedPass) VALUES
('usuario1@email.com', 'usuario1', 'Inicio1', 'a'),
('usuario2@email.com', 'usuario2', 'Inicio1', 'a'),
('usuario3@email.com', 'usuario3', 'Inicio1', 'a'),
('usuario4@email.com', 'usuario4', 'Inicio1', 'a'),
('usuario5@email.com', 'usuario5', 'Inicio1', 'a');
select * from usuario;

insert into seguimiento (idUsuario, idUsuarioSeguido) VALUES
(1, 2),
(1, 3),
(2, 3),
(3, 1),
(4, 1);
select * from seguimiento;

insert into geolocalizacion (nombre) VALUES
('Buenos Aires'),
('Córdoba'),
('Rosario'),
('Mendoza'),
('San Miguel de Tucumán');
select * from geolocalizacion;

insert into album (titulo, esPrivado, creadoPor_UserID) VALUES
('Viaje al Norte', false, 1),
('Mi cumpleaños', true, 2),
('Fotos de la facultad', true, 3),
('Navidad en familia', false, 1),
('Tarde en el parque', false, 4),
('Proyecto fotoVidz', true, 3);
select * from album;

insert into colaborador (idUsuario, idAlbum) values
(1, 1),
(2, 1),
(3, 2),
(1, 2),
(4, 3),
(2, 3);
select * from colaborador;

-- Álbum 1: Viaje al Norte (usuario 1)
INSERT INTO foto_video (filePath, subidoPor, geolocalizacion_ID) VALUES
('norte1.jpg', 1, 5),  -- San Miguel de Tucumán
('norte2.jpg', 1, 4),  -- Mendoza
('norte3.jpg', 1, NULL);

-- Álbum 2: Mi cumpleaños (usuario 2)
INSERT INTO foto_video (filePath, subidoPor, geolocalizacion_ID) VALUES
('cumple1.jpg', 2, 1),  -- Buenos Aires
('cumple2.jpg', 2, NULL),
('cumple3.jpg', 2, NULL),
('cumple4.jpg', 2, NULL);

-- Álbum 3: Fotos de la facultad (usuario 3)
INSERT INTO foto_video (filePath, subidoPor, geolocalizacion_ID) VALUES
('facu1.jpg', 3, 1),  -- Buenos Aires
('facu2.jpg', 3, 2),  -- Córdoba
('facu3.jpg', 3, NULL);

-- Álbum 4: Navidad en familia (usuario 1)
INSERT INTO foto_video (filePath, subidoPor, geolocalizacion_ID) VALUES
('navidad1.jpg', 1, NULL),
('navidad2.jpg', 1, NULL),
('navidad3.jpg', 1, 3),  -- Rosario
('navidad4.jpg', 1, NULL);

-- Álbum 5: Tarde en el parque (usuario 4)
INSERT INTO foto_video (filePath, subidoPor, geolocalizacion_ID) VALUES
('parque1.jpg', 4, 1),  -- Buenos Aires
('parque2.jpg', 4, 1),
('parque3.jpg', 4, NULL);

-- Álbum 6: Proyecto fotoVidz (usuario 3)
INSERT INTO foto_video (filePath, subidoPor, geolocalizacion_ID) VALUES
('proyecto1.jpg', 3, NULL),
('proyecto2.jpg', 3, NULL),
('proyecto3.jpg', 3, NULL),
('proyecto4.jpg', 3, 2);  -- Córdoba
select * from foto_video;


-- Relación álbum 1 con fotos 1–3
INSERT INTO album_foto_video VALUES (1, 1), (1, 2), (1, 3);

-- Álbum 2 con fotos 4–7
INSERT INTO album_foto_video VALUES (2, 4), (2, 5), (2, 6), (2, 7);

-- Álbum 3 con fotos 8–10
INSERT INTO album_foto_video VALUES (3, 8), (3, 9), (3, 10);

-- Álbum 4 con fotos 11–14
INSERT INTO album_foto_video VALUES (4, 11), (4, 12), (4, 13), (4, 14);

-- Álbum 5 con fotos 15–17
INSERT INTO album_foto_video VALUES (5, 15), (5, 16), (5, 17);

-- Álbum 6 con fotos 18–21
INSERT INTO album_foto_video VALUES (6, 18), (6, 19), (6, 20), (6, 21);
select * from album_foto_video;


-- Usuario 1 etiqueta a otros en sus propias fotos (IDs 1 a 3)
INSERT INTO etiqueta VALUES
(1, 2, 1),  -- Usuario 1 etiquetó a Usuario 2 en norte1.jpg
(1, 3, 2),  -- Usuario 1 etiquetó a Usuario 3 en norte2.jpg
(1, 4, 3);  -- Usuario 1 etiquetó a Usuario 4 en norte3.jpg

-- Usuario 2 etiqueta a Usuario 1 y 3 en fotos del cumple (IDs 4 a 7)
INSERT INTO etiqueta VALUES
(2, 1, 4),
(2, 3, 5);

-- Usuario 3 etiqueta en fotos de la facu (IDs 8 a 10)
INSERT INTO etiqueta VALUES
(3, 2, 8),
(3, 4, 9),
(3, 5, 10);

-- Usuario 1 etiqueta a Usuario 2 y 5 en fotos de navidad (IDs 11 a 14)
INSERT INTO etiqueta VALUES
(1, 2, 11),
(1, 5, 13);

-- Usuario 4 etiqueta en parque (fotos 15 a 17)
INSERT INTO etiqueta VALUES
(4, 1, 15),
(4, 2, 16);

-- Usuario 3 etiqueta en proyecto fotoVidz (fotos 18 a 21)
INSERT INTO etiqueta VALUES
(3, 1, 18),
(3, 2, 19),
(3, 4, 21);
select * from etiqueta;