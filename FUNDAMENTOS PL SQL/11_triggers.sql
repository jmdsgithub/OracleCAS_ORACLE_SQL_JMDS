--07-05-2025
--triggers

--los triggers son perfectos para advertencias


--ejemplo 1.
/
create or replace trigger tr_dept_before_insert
before INSERT
on dept
for each ROW
declare
begin
    dbms_output.put_line('Trigger dept before insert row ');
    dbms_output.put_line(:new.dept_no || ' ,  '||:new.dnombre
    || ' ,  '||:new.loc);
end;
/

insert into dept values (111, 'nuevo', 'TOLEDO');

select * from dept;
rollback;

--delete
/
create or replace trigger tr_dept_before_delete
before delete
on dept
for each ROW
declare
begin
    dbms_output.put_line('Trigger dept before delete row ');
    dbms_output.put_line(:old.dept_no || ' ,  '||:old.dnombre
    || ' ,  '||:old.loc);
end;
/

delete from dept where dept_no=111;

--update

/
create or replace trigger tr_dept_before_update
before update
on dept
for each ROW
declare
begin
    dbms_output.put_line('Trigger dept before update row ');
    dbms_output.put_line(:old.dept_no || ' , Antigua LOC:  '||:old.loc
    || ' , Nueva LOC:   '||:new.loc);
end;
/

update dept set loc='VITORIA' where dept_no=111;

rollback;


--ejemplo trigger que advierte de  aumentos de mas de 250mil.... 
--TRIGGER DE EJEMPLO, el trigger consume mucho recurso, se debe hacer con un CHECK

--update

/
create or replace trigger tr_doctor_control_salario_update
before update
on doctor
for each ROW
declare
begin
    dbms_output.put_line('Trigger DOCTOR before update row ');
    dbms_output.put_line('Dr/Dra ' || :old.apellido || ' , cobra mucho dinero: '||:new.salario
    || ' , Antes:   '||:old.salario);
end;
/

update doctor set salario=252000 where doctor_no=386;

/
create or replace trigger tr_doctor_control_salario_update
before update
on doctor
for each ROW
    when (new.salario > 250000) --ojo, aquí no van los dos puntos antes de new
declare
begin
    dbms_output.put_line('Trigger DOCTOR before update row ');
    dbms_output.put_line('Dr/Dra ' || :old.apellido || ' , cobra mucho dinero: '||:new.salario
    || ' , Antes:   '||:old.salario);
end;
/

select * from doctor;

--trigger donde se advierte que no se debe cambiar ciudades

--no podemos tener dos triggers del mismo tipo, en este caso,
-- "for each row" en la misma tabla,
-- uno se elimina con drop

/
drop trigger tr_dept_before_insert
/
create or replace trigger tr_dept_control_barcelona
before INSERT
on dept
for each ROW
declare
begin
    dbms_output.put_line('Trigger control Barcelona ');
    if (upper(:new.loc)='BARCELONA') then
    dbms_output.put_line('No se admiten departamentos en Barcelona ');
    end if;
end;
/

insert into dept values (66, 'MILAN', 'BARCELONA');
rollback;

--trigger con excepción

/
create or replace trigger tr_dept_control_barcelona
before INSERT
on dept
for each ROW
declare
begin
    dbms_output.put_line('Trigger control Barcelona ');
    if (upper(:new.loc)='BARCELONA') then
    dbms_output.put_line('No se admiten departamentos en Barcelona ');
    raise_application_error (-20001, 'En Munich solo ganadores');
    end if;
end;
/

insert into dept values (5, 'MILAN', 'BARCELONA');


--este, el siguiente,  es mas rapido
/
create or replace trigger tr_dept_control_barcelona
before INSERT
on dept
for each ROW
    when (upper(new.loc)='BARCELONA')
declare
begin
    dbms_output.put_line('Trigger control Barcelona ');
    dbms_output.put_line('No se admiten departamentos en Barcelona ');
    raise_application_error (-20001, 'En Munich solo ganadores');
end;
/

/
create or replace trigger tr_dept_control_localidades
before INSERT
on dept
for each ROW
declare
    v_num number;
begin
    dbms_output.put_line('Trigger control Localidades ');
    select count(dept_no) into v_num from dept
    where upper(loc)=upper(:new.loc);
    if (v_num > 1) then
        raise_application_error (-20001, 'Solo un departamento por ciudad  '|| :new.loc);
    end if;
end;
/

insert into dept values (6, 'MILANA', 'TERUEL');

select * from dept;

--08-05-2025

--vamos a utilizar triggers para advertir updates q puedan comprometer los datos

--primero  eliminamos los triggers q ya tenemos en la tabla,
-- q solo funciona uno de cada tipo por tabla

drop trigger tr_dept_before_insert;
drop trigger tr_dept_before_delete;
drop trigger tr_dept_control_barcelona;
drop trigger tr_dept_control_localidades;
drop trigger tr_doctor_control_salario_update;
drop trigger tr_dept_before_update;

/
create or replace trigger tr_update_dept_cascade
before update
on dept
for each row
    when (new.dept_no <> old.dept_no)
declare
begin
   dbms_output.put_line('DEPT_NO cambiando');
   update emp set dept_no=:new.dept_no where
   dept_no=:old.dept_no;
end;
/

select * from dept;
update dept set loc='ZARAGOZA' where dept_no=30;
select * from emp where dept_no=30;
update dept set dept_no=31 where dept_no=30;


--ejemplo: impedir insertar un nuevo presidente si ya existe uno
--en la tabla emp

select * from emp;

/
create or replace trigger tr_update_emp_presidente
before INSERT
on emp
for each ROW
    when (upper(new.oficio)='PRESIDENTE')
declare
    v_presidente number;
begin
    dbms_output.put_line('Trigger de control UN solo presidente ');
    select count(oficio) into v_presidente from emp
    where upper(oficio)='PRESIDENTE';
    if v_presidente <> 0 then
        raise_application_error (-20001, 'Solo un presidente en la empresa  ');
    end if;
end;
/

insert into emp values (2223, 'rodriguez', 'PRESIDENTE', null, sysdate, 650000, null, 10);

insert into emp values (2223, 'rodriguez', 'PRESIDENTa', null, sysdate, 650000, null, 10);

drop trigger tr_update_emp_presidente;

--en el trigger de control de localidades 
--no quiero que exista mas de una localidad si hacemos un update

--**ojo, **ojo, no podemos hacer SELECT en ningún update o
-- delete **for each row**, solo en insert
--entonces debemos hacer dos triggers, uno para almacenar el valor de new
-- y luego entrar en otro trigger para hacer el update

/
create or replace trigger tr_dept_control_localidades
before update --vamos a comprobar antes de update
on dept
for each ROW
declare
    v_num number;
begin
    dbms_output.put_line('Trigger control Localidades ');
    select count(dept_no) into v_num from dept
    where upper(loc)=upper(:new.loc);
    if (v_num > 1) then
        raise_application_error (-20001, 'Solo un departamento por ciudad  '|| :new.loc);
    end if;
end;
/



update dept values (6, 'MILAN', 'PINTO');

select * from dept;
--package para almacenar las variables entre triggers

--PACKAGE PARA ALMACENAR LAS VARIABLES ENTRE TRIGGERS
/
create or replace package PK_TRIGGERS
as
    v_nueva_localidad DEPT.LOC%TYPE;
end PK_TRIGGERS;
/

/
create or replace trigger tr_dept_control_localidades_row
before update --VAMOS A COMPROBAR ANTES DE UPDATE
on DEPT
for each row
declare
begin
    dbms_output.PUT_LINE('For each ROW ');
    --almacenamos el valor de la nueva localidad
    PK_TRIGGERS.v_nueva_localidad := :new.LOC;
end;
/

--creamos el trigger de update para after
/
create or replace trigger tr_dept_control_localidades_after
after update
on DEPT
declare
begin
    select count(dept_no) into v_numero from dept
    where upper(loc)=upper(PK_TRIGGERS.v_nueva_localidad)
    if (v_numero > 0) then
        raise_application_error (-20001, 'Solo un departamento por localidad');
    end if;
    dbms_output.PUT_LINE('Localidad nueva: ' || PK_TRIGGERS.v_nueva_localidad);
end;
/

update DEPT set LOC='CADIZ' where DEPT_NO=10;
select * from DEPT;
rollback;

--TRIGGER INSTEAD OF
--funciona en las vistas

--creamos la vista con todos los datos de los ddepartamentos

create or replace view vista_departamentos
as
    select * from dept;

--de ahora en adelante solo trabajamos con la vista

insert into vista_departamentos values
(11, 'VISTA', 'SIN TRIGGER');

select * from vista_departamentos;


--creamos un trigger sobre la vista
/
create or replace trigger tr_vista_dept
instead of insert
on vista_departamentos
declare
begin
    dbms_output.put_line('Insertando en vista dept');
end;
/

insert into vista_departamentos values
(11, 'VISTA', 'CON TRIGGER');

--creamos una vista con los datos de los empleados,
-- pero, sin los datos sensibles: salario, comisión y fecha de alta.

create or replace view vista_empleados
as
    select emp_no, apellido, oficio, dir, dept_no from emp;

select * from emp;

insert into vista_empleados values (557, 'el nuevo 3', 'BECARIO 3', 7566, 31);


/
create or replace trigger tr_vista_empleados
instead of insert
on vista_empleados
declare
begin
    --con new capturamos los datos que vienen en la vista
    --y rellenamos el resto
    insert into emp values(:new.emp_no, :new.apellido, :new.oficio, 
    :new.dir, sysdate, 0, 0, :new.dept_no);
end;
/
 rollback;

--amos a crear una vista para mostrar doctores

/
create or replace view vista_doctores
as
    select doctor.doctor_no, doctor.apellido, doctor.especialidad,
    doctor.salario, hospital.nombre
    from doctor
    inner join hospital
    on doctor.hospital_cod=hospital.hospital_cod;
/

select * from hospital;

insert into vista_doctores values
(111, 'house 2', 'ESPECIALISTA', 450000, 'provincial');

/
create or replace trigger tr_vista_doctor
instead of insert
on vista_doctores
declare
    v_codigo hospital.hospital_cod%type;
begin
    select hospital_cod into v_codigo from hospital
    where upper(nombre)=upper(:new.nombre);
    insert into doctor values
    (v_codigo, :new.doctor_no, :new.apellido, :new.especialidad
    , :new.salario);
end;
/

select * from doctor;

