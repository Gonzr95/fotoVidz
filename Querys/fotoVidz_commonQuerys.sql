/* ==============================================================================
   SQL SELECT Query
-------------------------------------------------------------------------------
	NO TE OLVIDE DE 
    USE fotoVidz;
   Contenido:
     1. SELECT COLUMNS & SPECIFIC COLUMNS
     2. WHERE CLAUSE + OPERADORES DE COMPARACIONN
     3. ORDER BY
     4. DISTINCT
     5. TOP / LIMIT
     6. operadores logicos
     7. BETWEEN IN INKE 
     8. GROUP BY
     9. HAVING
	 10. LITTLE JOINS
     
=================================================================================
*/

/*
Bloque 1 – SELECT ALL / SPECIFIC COLUMNS
1.	Mostrar todos los datos de todos los usuarios.
2.	Mostrar solo el nombreDeUsuario y fechaNac de todos los usuarios.
3.	Obtener todos los álbumes con sus títulos y fecha de creación.
4.	Listar todos los filePath de fotos o videos y su subidoPor.
5.	Mostrar todos los campos de la tabla geolocalizacion.
*/
use fotoVidz;
-- 1)
SELECT * from usuario;

-- 2)
select nombreDeUsuario, fechaNac
from usuario;

-- 3)
select titulo, fechaDeCreacion from album;

-- 4)
select filePath, subidoPor from foto_video;

-- ======================================================

-- 6)
select * from usuario
where fechaNac > '2000-12-31';

desc foto_video;
-- 7)
select * from foto_video 
where subidoPor = 3;

-- 8)
select * from album where creadoPor_UserID = 1;

-- 9)
select * from usuario where mail like '%mail.com';

-- 10)
select * from foto_video
where geolocalizacion_id is not null;

-- =====================================================

-- 11)
select * from usuario
order by fechaNac desc;

-- 12)
select * from foto_video 
order by filePath asc;

-- 13)
select * from album
order by fechaDeCreacion desc;

-- 14)
select mail from usuario
order by mail asc;

-- 15) 
select * from geolocalizacion 
order by nombre asc;

-- ====================================================
-- 16)
select distinct geolocalizacion_id from foto_video;

-- 17)
select distinct idUsuario, idUsuarioSeguido
from seguimiento;

 -- 18)
 select distinct titulo
 from album;
 
 -- 19)
 select distinct subidoPor from foto_video;
 
 -- 20)
 select distinct foto_video_ID from etiqueta;
 
 -- 21)
 select * from usuario
 order by fechaNac desc
 limit 3;
 
 -- 22)
 select * from album
 order by fechaDeCreacion desc
 limit 2;
 
 -- 23)
 select * from foto_video
 limit 2;
 
 -- 24) 
 select id, mail from usuario
 order by id asc
 limit 2;
 
 -- 25) 
 select id, mail from usuario
 order by id asc
 limit 4;
 
 -- 26)
 select * from usuario
 where fechaNac > '2000-12-31' and mail like '%o%';
 
 -- 27)
  select * from foto_video;
  select * from foto_video
  where subidoPor = 2 and geolocalizacion_ID is null;
  
  -- 28)
  select * from album
  where esPrivado = false
  or creadoPor_UserID = 1;
  
  -- 29)
  select * from etiqueta
  where etiquetadoPor_userID <> etiquetaA_UserID;
  
  -- 30)
  select * from usuario;
  select * from usuario
  where nombreDeUsuario like "%rio5%"
  and mail like "%.com";
  
  -- 31)
  select * from usuario
  where fechaNac between '1990-01-01' and '2010-12-31';
  
  -- 32)
  select * from foto_video
  where id between 1 and 10;
  
  -- 33)
  select * from album
  where creadoPor_UserID in (1,3,5);
  
  -- 34)
  select * from usuario
  where nombreDeUsuario like "u%";
  
  -- 35)
  select * from album
  where titulo like "%viaje%";
  
  -- 36)
  select subidoPor, count(id) as cantidad 
  from foto_video
  group by subidoPor;
  
  -- 37)
  select creadoPor_UserID, count(id) as cantidad
  from album
  group by creadoPor_UserID;
  
  -- 38)
  select * from foto_video;
  select geolocalizacion_ID, count(id) as cantidad 
  from foto_video
  where geolocalizacion_ID is not null
  group by geolocalizacion_ID;
  
  -- 39)
  select etiquetadoPor_userID as userID ,count(foto_video_ID) as cantidad
  from etiqueta
  group by etiquetadoPor_userID;
  
  -- 40)
  select count(album_ID) as cantidadFotos
  from album_foto_video
  group by album_ID;

-- 41)
select subidoPor as userId, count(*) as cantidadDeArchivos
from foto_video
group by subidoPor
having cantidadDeArchivos > 3;

-- 42)
select album_ID, count(foto_video_ID) as cantidadDeArchivos
from album_foto_video
group by album_ID
having cantidadDeArchivos > 3;

-- 43)
select etiquetadoPor_userID
from etiqueta
group by etiquetadoPor_userID
having count(distinct etiquetaA_UserID) > 1;

 -- 44)
select geolocalizacion_ID
from foto_video
group by geolocalizacion_ID
having count(*) > 2;

-- 45)
select idUsuario
from colaborador
group by idUsuario
having count(*) > 1 ;

-- 46)
select subidoPor as userID
from foto_video
where geolocalizacion_ID is null
group by userID;

-- 47) uso distinct para solo traer el mail 1 sola vez una vez encontrado que se encuentra etiquetado en 1 foto
select distinct u.mail
from usuario u
join etiqueta e on e.etiquetaA_UserID = u.id;

-- 48)
select
a.titulo as albumTitle,
count(afv.foto_video_ID) as cantidadDeFotos
from album a
join album_foto_video afv on a.id = afv.album_ID
where a.esPrivado = false
group by a.id;


-- 49)
SELECT 
    s.idUsuarioSeguido AS usuarioID,
    COUNT(s.idUsuario) AS qtyFollows
FROM
    seguimiento s
GROUP BY idUsuarioSeguido;

-- 50)
SELECT 
    s.idUsuario, 
    COUNT(DISTINCT a.id) AS cantidadAlbums
FROM
    seguimiento s
        JOIN
    album a ON s.idUsuario = a.creadoPor_UserID
GROUP BY s.idUsuario
ORDER BY s.idUsuario ASC;

-- 51) nombres de usuario cantidad de follow y folloers y albums y creados dsp del 2024
SELECT 
    u.nombreDeUsuario, 
    COUNT(distinct s1.idUsuarioSeguido) AS qtyFollows, 
    COUNT(distinct s2.idUsuario) as qtyFollowers,
    COUNT(distinct a.id) as qtyAlbums
FROM
    usuario u
        LEFT JOIN
    seguimiento s1 ON u.id = s1.idUsuario
		LEFT JOIN
	seguimiento s2 ON u.id = s2.idUsuarioSeguido
		LEFT JOIN
	album a on u.id = a.creadoPor_UserID AND a.fechaDeCreacion > '2026-12-12'
GROUP BY u.id
ORDER BY u.nombreDeUsuario ASC;
  