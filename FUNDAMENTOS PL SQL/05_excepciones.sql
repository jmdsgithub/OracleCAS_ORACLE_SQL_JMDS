
--24/04/2025
--excepciones

--capturar una excepción del sistema
--en este caso, dividir entre cero
/
DECLARE
    v_numero1 number:= &numero1;
    v_numero2 number:= &numero2;    
    v_division number;
BEGIN
    v_division:= v_numero1/v_numero2;
    DBMS_OUTPUT.PUT_LINE('La división es ' || v_division);

end;
/
undefine numero1;
undefine numero2;

--el bloque anterior da error, en el bloque siguiente capturaremos el error

/
DECLARE
    v_numero1 number:= &numero1;
    v_numero2 number:= &numero2;    
    v_division number;
BEGIN
    v_division:= v_numero1/v_numero2;
    DBMS_OUTPUT.PUT_LINE('La división es ' || v_division);
exception
    when zero_divide THEN
        DBMS_OUTPUT.PUT_LINE('Error al dividir entre 0');
end;
/
undefine numero1;
undefine numero2;

--cuando los empleados tengan una comision con valor 0,
--lanzaremos una excepción
--tendremos una tabla donde almacenaremos los empleados
--con comisión mayor a cero

create table emp_comision (apellido varchar2(50), comision number(9));
select * from emp_comision;
/
declare
    cursor cursor_emp is
    select apellido, comision from emp order by comision desc;
    exception_comision exception;
begin
    for v_record in cursor_emp
    loop
        insert into emp_comision values (v_record.apellido, v_record.comision)
        if (v_record.comision = 0) then 
            raise exception_comision;
        end if;        
    end loop;
exception
    when exception_comision then
        DBMS_OUTPUT.PUT_LINE('Comisiones a CERO');
end;
/

--pragma exceptions

/
declare
    exception_nulos exception;
    pragma exception_init(exception_nulos, -1400);
begin
    insert into dept values(null,'DEPARTAMENTO','PRAGMA');
exception
    when exception_nulos then
        DBMS_OUTPUT.PUT_LINE('No me sirven los nulos......');
end;
/
describe dept;

--SQLCODE: devuelve el número de error de Oracle de las excepciones internas.
--Se le asigna a una variable number. Vale 0 si no encuentra ninguna excepción, 1
--si la excepción es indefinida por el usuario, 100 si es del tipo NO_DATA_FOUND
--y un número negativo si es error del servidor.

--SQLERRM: Devuelve datos carácter que contienen el mensaje de error asociado

/
declare
    v_id number;
begin
    select dept_no into v_id
    from dept
    where dnombre='BENTAS';
    DBMS_OUTPUT.PUT_LINE('Ventas es el número....' || v_id);
exception
    when too_many_rows then
        DBMS_OUTPUT.PUT_LINE('Demasiadas filas en cursor');
    when others then
        DBMS_OUTPUT.PUT_LINE(to_char(sqlcode) || '   ' || sqlerrm);
end;
/

--RAISE_APPLICATION_ERROR

/
declare
    v_id number;
begin
    raise_aplication_error(-20400, 'Puedo hacer esto con exception?????');
    select dept_no into v_id
    from dept
    where dnombre='BENTAS';
    DBMS_OUTPUT.PUT_LINE('Ventas es el número....' || v_id);
end;
/

