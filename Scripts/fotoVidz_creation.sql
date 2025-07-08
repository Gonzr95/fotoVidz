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
        -geolocalizacion
        -foto_video
        -etiqueta
        -album
		-album_foto_video
        -colaborador

ATENCION:
    Ejecutar el script eliminara la BD fotoVidz permanentemente junto
    sus datos, si existe. 
*/
DROP DATABASE IF EXISTS fotoVidz;
CREATE DATABASE fotoVidz;
USE fotoVidz;

CREATE TABLE usuario (
    id INT UNIQUE NOT NULL AUTO_INCREMENT,
    mail VARCHAR(63) UNIQUE NOT NULL,
    nombreDeUsuario VARCHAR(31) UNIQUE NOT NULL,
    pass VARCHAR(63) NOT NULL,
    hashedPass VARCHAR(255) NOT NULL,
    fechaNac DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE seguimiento (
    idUsuario INT NOT NULL,
    idUsuarioSeguido INT NOT NULL,
    FOREIGN KEY (idUsuario)
        REFERENCES usuario (id),
    FOREIGN KEY (idUsuarioSeguido)
        REFERENCES usuario (id),
    PRIMARY KEY (idUsuario , idUsuarioSeguido),
    CHECK (idUsuario <> idUsuarioSeguido)
);

CREATE TABLE geolocalizacion (
    id INT UNIQUE NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(31) UNIQUE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE foto_video (
    id INT UNIQUE NOT NULL AUTO_INCREMENT,
    filePath VARCHAR(255) UNIQUE NOT NULL,
    subidoPor INT NOT NULL,
    geolocalizacion_ID INT,
    PRIMARY KEY (id),
    FOREIGN KEY (subidoPor)
        REFERENCES usuario (id),
    FOREIGN KEY (geolocalizacion_ID)
        REFERENCES geolocalizacion (id)
);

CREATE TABLE etiqueta (
    etiquetadoPor_userID INT NOT NULL,
    etiquetaA_UserID INT NOT NULL,
    foto_video_ID INT NOT NULL,
    PRIMARY KEY (etiquetadoPor_userID , etiquetaA_UserID , foto_video_ID), -- PK compuesta para evitar duplicidad
    FOREIGN KEY (etiquetadoPor_userID)
        REFERENCES usuario (id),
    FOREIGN KEY (etiquetaA_UserID)
        REFERENCES usuario (id),
    FOREIGN KEY (foto_video_ID)
        REFERENCES foto_video (id)
);

CREATE TABLE album (
    id INT UNIQUE NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(31),
    esPrivado BOOLEAN DEFAULT TRUE,
    creadoPor_UserID INT NOT NULL,
    fechaDeCreacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (creadoPor_UserID)
        REFERENCES usuario (id)
);

CREATE TABLE album_foto_video (
    album_ID INT NOT NULL,
    foto_video_ID INT NOT NULL,
    PRIMARY KEY (album_ID , foto_video_ID),
    FOREIGN KEY (album_ID)
        REFERENCES album (id),
    FOREIGN KEY (foto_video_ID)
        REFERENCES foto_video (id)
);

CREATE TABLE colaborador (
    idUsuario INT NOT NULL,
    idAlbum INT NOT NULL,
    FOREIGN KEY (idUsuario)
        REFERENCES usuario (id),
    FOREIGN KEY (idAlbum)
        REFERENCES album (id),
    PRIMARY KEY (idUsuario , idAlbum)
);
