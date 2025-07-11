	-- Views
    use fotoVidz;
    
    -- Descripcion: muestra id y nombre de usuarios y la cantidad de albums que crearon 
	-- si no tienen albums creados no se veran reflejados en esta tabla
    CREATE VIEW vista_usuario_con_album AS
    SELECT 
        u.id AS userID,
        u.nombreDeUsuario,
        COUNT(a.id) AS cantidAlbums
    FROM
        usuario u
            LEFT JOIN
        album a ON u.id = a.creadoPor_UserID
    GROUP BY u.id;
    
    select * from vista_usuario_con_album;
    
    -- Descripcion: muestra los lugares que tienen fotos cargadas.
CREATE VIEW vista_lugares_con_fotos AS
    SELECT 
        g.id, g.nombre AS lugar, COUNT(fv.id) AS qtyFotos
    FROM
        geolocalizacion g
            LEFT JOIN
        foto_video fv ON g.id = fv.geolocalizacion_ID
    GROUP BY g.nombre;
    
    -- Descripcion: creacion de vista que muestra id y nombre de usuario y a quienes sigue 
	CREATE VIEW vista_usuario_sigue_a AS
    SELECT 
        u.id, u.nombreDeUsuario, s.idUsuarioSeguido AS followsUser
    FROM
        usuario u
            JOIN
        seguimiento s ON u.id = s.idUsuario
    ORDER BY u.id ASC;

-- Descripcion: crea la vista que devuelve id y nombre de usuario y la cantidad de fotos en las que esta etiquetado
CREATE VIEW vista_usuario_etiquetas AS
    SELECT 
        u.id, u.nombreDeUsuario, COUNT(e.foto_video_ID) AS qtyFotos
    FROM
        usuario u JOIN etiqueta e 
	ON u.id = etiquetaA_UserID
    GROUP BY u.id;
    
-- uso de vista agregando una condicion
SELECT * FROM vista_usuario_etiquetas
WHERE qtyFotos > 3;