-- triggers
use fotoVidz;


CREATE TABLE log_actualizacion_seguimiento(
    id INT AUTO_INCREMENT,
    usuario_anterior_ID INT NOT NULL,
    seguido_anterior_ID INT NOT NULL,
    usuario_nuevo_ID INT NOT NULL,
    seguiddo_nuevo_ID INT NOT NULL,
    usuario_MySQL VARCHAR(100) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)  COMMENT='Log de auditoria para la tabla seguimiento Almacena cambios de valores, fecha y user que ejecuto modificacion';


-- log_actualizacion_seguimiento
-- Proposito: registrar cualquier intento de modificacion de registros en la tabla seguimiento, 
-- almacenando valores anteriores y nuevos, junto a a fecha del evento y el usuario de bd.
delimiter //
create trigger log_update_seguimmiento
after update on seguimiento -- para cada fila modificada ejecutame el siguiente codigo
for each row
begin 
insert into log_actualizacion_seguimiento(
	usuario_anterior_ID,
    seguido_anterior_ID,
    usuario_nuevo_ID,
    seguiddo_nuevo_ID,
    usuario_MySQL
    )
    values(
    OLD.idUsuario,
    OLD.idUsuarioSeguido,
    NEW.idUsuario,
    NEW.idUsuarioSeguido,
    current_user()
    );
    END //
    delimiter ;
    
    