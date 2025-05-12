--08-05-2025





insert into registros (idcliente,ventas, estado)
values(1, 'telefono', 1);


insert into registros (idcliente,ventas, estado)
values(1, 'telefono averiado', 0);

create or replace procedure sp_insert_registro
(p_idcliente number,p_valor varchar2, p_estado number, p_tipo boolean)
AS

begin

end;