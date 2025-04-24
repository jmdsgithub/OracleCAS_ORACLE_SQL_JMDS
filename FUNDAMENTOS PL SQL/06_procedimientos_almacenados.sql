--24/04/2025

--PROCEDIMIENTOS ALMACENADOS

--ejemplo procedimiento para mostrar un mensaje
--stored procedure

/
create or replace procedure sp_mensaje
AS
begin
    --mostraos un mensaje
    DBMS_OUTPUT.PUT_LINE('Hoy es juernes con música.....!!!!');

end;
/

--llamada al procedimiento

begin
    sp_mensaje;
end;

exec sp_mensaje;

--creamos otro procedimiento pl/sql

create or replace procedure sp_ejemplo_plsql
AS
begin
    --procedimiento con bloque pl/sql
    declare
        v_numero number;
    begin
        v_numero:= 14;
        if v_numero > 0 then
            DBMS_OUTPUT.PUT_LINE('Positivo');
        else
            DBMS_OUTPUT.PUT_LINE('Negativo');
        end if;
    end; 
end;

--llamada

begin
    sp_ejemplo_plsql;
end;


--tenemos otra sintaxis para tener variables
--dentro de un procedimiento.
--no se utiliza la palabra declare

create or replace procedure sp_ejemplo_plsql2
AS
    v_numero number:=14;
begin
    if v_numero > 0 then
        DBMS_OUTPUT.PUT_LINE('Positivo');
    else
        DBMS_OUTPUT.PUT_LINE('Negativo');
    end if;
end;

begin
    sp_ejemplo_plsql2;
end;

--procedimiento para sumar dos numeros

create or replace procedure sp_sumar_numeros
(p_numero1 number, p_numero2 number)
AS
    v_suma number;
begin
    v_suma:=p_numero1+p_numero2;
    DBMS_OUTPUT.PUT_LINE('La suma de ' || p_numero1 || ' + '
    || p_numero2 || ' es igual a ' || v_suma);
end;

--llamada al procedimiento

begin
    sp_sumar_numeros(5,6);
end;

--crear procedimiento para dividir dos numeros
--se llamará sp_dividir_numeros

create or replace procedure sp_dividir_numeros
(p_numero1 number, p_numero2 number)
AS
begin
    declare
        v_division number;
    begin
        v_division:=p_numero1/p_numero2;
        DBMS_OUTPUT.PUT_LINE('La división de ' || p_numero1 || ' entre  '
        || p_numero2 || ' es igual a ' || v_division);
    exception
        when zero_divide then
        DBMS_OUTPUT.PUT_LINE('División entre cero  PL/SQL inner');
end;
exception
    when zero_divide then
    DBMS_OUTPUT.PUT_LINE('División entre cero  procedure');
end;

--llamada al procedimiento

begin
    sp_dividir_numeros(5,0);
exception
    when zero_divide then
    DBMS_OUTPUT.PUT_LINE('División entre cero, PL/SQL outer');
end;



