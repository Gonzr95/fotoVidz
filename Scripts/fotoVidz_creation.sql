/*
=============================================================
Creacion de base de datos y tablas (Version MySQL)
=============================================================
Proposito del script:
    El script crea la BD llamada 'fotoVidz'. 
    Si la tabla existe la elimina para asegurar una instalacion limpia. 
    Luego se crean las tablas:
		-usuario
		-seguimiento
        -album
        -colaborador
        -foto_video
        -geolocalizacion
        -etiqueta    
        -album_foto_video
ATENCION:
    Ejecutar el script eliminara la BD fotoVidz permanentemente junto
    sus datos, si existe. 
*/
DROP DATABASE IF EXISTS fotoVidz;
CREATE DATABASE fotoVidz;
USE fotoVidz;


create table usuario(
	id int unique not null auto_increment,
    mail varchar(63) unique not null,
    nombreDeUsuario varchar(31) unique not null,
    pass varchar(63) not null,
    hashedPass varchar(255) not null,
    primary key(id)
);

create table seguimiento(
	idUsuario int not null,                 -- usuarioA que realiza la accion de seguir a usuarioB
	idUsuarioSeguido int not null,          -- usuario que es seguido x usuarioA
    foreign key(idUsuario) references usuario(id),
    foreign key(idUsuarioSeguido) references usuario(id) 
);

create table etiqueta(
	etiquetadoPor_userID int not null,
    etiquetaA_UserID int not null,
    foto_video_ID int not null,
    primary key(etiquetadoPor_userID, etiquetaA_UserID, foto_video_ID),  -- PK compuesta para evitar duplicidad
	foreign key(etiquetadoPor_userID) references usuario(id),
    foreign key(etiquetaA_UserID) references usuario(id),
    foreign key(foto_video_ID) references foto_video(id)
);

create table geolocalizacion(
	id int unique not null auto_increment,
    nombre varchar(31) unique not null     -- indica el nombre de la ciudad o lugar donde se etiqueto
);

create table foto_video(
	id int unique not null auto_increment,
    filePath varchar(255) unique not null, -- Indica la ubicacion del archivo en disco
    subidoPor int not null,                -- Indica el id del usuario que realizo la subida del archivo
    geolocalizacion_ID int,				   -- Referencia el id de la localizacion (puede ser nulo)
    primary key(id),
    foreign key(subidoPor) references usuario(id),
    foreign key(geolocalizacion_ID) references geolocalizacion(id)
);

create table album_foto_video (
    album_ID int not null,                -- Indica a que album pertenece
    foto_video_ID int not null,		      -- Indica la foto o el video que referencia
    primary key(album_ID, foto_video_ID),    -- PK compuesta para evitarnos duplicados
    foreign key(album_ID) references album(id),
    foreign key(foto_video_ID) references foto_video(id)
);

create table album(
	id int unique not null auto_increment,
    titulo varchar(31),
    esPrivado boolean default true,
    creadoPor_UserID int not null,
    fechaDeCreacion timestamp not null default current_timestamp,
    primary key(id),
    foreign key(creadoPor_UserID) references usuario(id)
);

create table colaborador(
	idUsuario int not null,
    idAlbum int not null,
    foreign key(idUsuario) references usuario(id),
	foreign key(idAlbum) references album(id)
);
