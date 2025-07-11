/* ==============================================================================
   STORED PROCEDURES
-------------------------------------------------------------------------------
Parámetros de STORED PROCEDURES
	In: parámetro de entrada ( solo lectura ) 
	Out: parámetro de salida (devuelve resultado)
	Inout: entrada y salida

     
=================================================================================
*/
use fotoVidz;
show procedure status where Db = 'fotoVidz';

delimiter //
create procedure obtener_cantidad_albumes(
	in user_ID int,
    out cantidad int
)
begin
	select count(*) into cantidad
	from album
	where creadoPor_UserID = user_ID;
end //
delimiter ;

call obtener_cantidad_albumes(1, @resultado);
select @resultado