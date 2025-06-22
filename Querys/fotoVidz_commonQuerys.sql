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
select count(*) from usuario;

-- cuantos usuarios sigue determinado usuario?

-- cuantos usuarios siguen a determinado usuario?

-- cuantos usuarios sigue cada usuario?

-- cuantos usuarios promedio sigue cada usuario?

-- cuantos usuarios siguen a cada usuario?

-- cuantos usuarios sigue y siguen a todos y cada uno de los usuario?

-- cuantos albums tiene cada usuario?

-- cuantas fotos tiene cada album?

-- cuantas fotos promedio tiene cada album?

-- cuantos colaboradores hay en toda la app?

-- cuantas fotos tienen geolocalizacion? 

-- borrado en casacada: borrar una foto, su etiqueta y geolocalizacion

-- si un usuario dueño de album borra dicho album, borrar las fotos que haya subido el pero no sos colaboradores.

-- creo nuevos albums individuales para cada uno de los colaboradores huerfanos?

-- stored procedures para las 2 consultas anteriores? 

-- trigger para avisar si se generan mas de 2 albums en el mismo dia por el mismo usuario

-- 