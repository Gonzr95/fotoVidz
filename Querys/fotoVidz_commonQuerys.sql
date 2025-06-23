use fotoVidz;
show tables;

select * from album;
select * from album_foto_video;
select * from colaborador;
select * from etiqueta;
select * from foto_video;
select * from geolocalizacion;
select * from seguimiento;
select * from usuario;

-- cuantos usuarios tiene la app?
SELECT 
    COUNT(*)
FROM
    usuario;

-- cuantos usuarios sigue determinado usuario?
SELECT 
    COUNT(idUsuarioSeguido) followsDeUser1
FROM
    seguimiento
where idUsuario = 1;

-- cuantos usuarios siguen a determinado usuario?
SELECT 
    COUNT(idUsuario)
FROM
    seguimiento
WHERE
    idUsuarioSeguido = 1;

-- cuantos usuarios sigue cada usuario?
SELECT 
	idUsuario,
    COUNT(idUsuarioSeguido) as 'follows'
FROM
    seguimiento
GROUP BY idUsuario;

-- subconsulta y agrupacion
-- cuantos usuarios promedio sigue cada usuario?
SELECT 
    AVG(cantidadSeguidos) AS promedioDeFollows
FROM
    (SELECT 
        idUsuario, COUNT(*) AS cantidadSeguidos
    FROM
        seguimiento
    GROUP BY idUsuario) AS subconsulta;

-- cuantos usuarios siguen a determinado usuario?
select count(*)
from seguimiento
where idUsuarioSeguido = 2;

-- cuantos usuarios sigue y siguen a todos y cada uno de los usuario?
SELECT 
    idUsuario, 
    COUNT(idUsuarioSeguido) AS qtyFollows,
	COUNT(idUsuario) as qtyFollowers
    from
		(select
        
		)
FROM
    seguimiento
GROUP BY idUsuario;

-- cuantos albums tiene cada usuario?
SELECT 
    COUNT(creadoPor_UserID) AS qtyAlbumbsByUser
FROM
    album
GROUP BY creadoPor_UserID;

-- cuantas fotos tiene cada album?
select album_ID, count(foto_video_ID)
from album_foto_video
group by album_ID;

-- cuantas fotos promedio tienen los album?
SELECT 
    AVG(qtyFotos) AS promedioDeFotos
FROM
    (SELECT 
        COUNT(foto_video_ID) AS qtyFotos
    FROM
        album_foto_video
    GROUP BY album_ID) AS subconsulta;

-- cuantas fotos promedio tienenlalbum?

-- cuantos colaboradores hay en toda la app?

-- cuantas fotos tienen geolocalizacion? 

-- borrado en casacada: borrar una foto, su etiqueta y geolocalizacion

-- si un usuario dueño de album borra dicho album, borrar las fotos que haya subido el pero no sos colaboradores.

-- creo nuevos albums individuales para cada uno de los colaboradores huerfanos?

-- stored procedures para las 2 consultas anteriores? 

-- trigger para avisar si se generan mas de 2 albums en el mismo dia por el mismo usuario

-- 