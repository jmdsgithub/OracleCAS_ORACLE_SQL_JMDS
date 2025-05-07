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