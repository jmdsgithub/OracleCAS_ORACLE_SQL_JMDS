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

--LUN 28-04 APAGÓN NACIONAL
--MAR 29-04 IBERCENTER ASCA SIN LUZ

--MIE 30-04-2025

--realizar un procedimiento para insertar un nuevo departamento
--opción 1

/
create or replace procedure sp_insertardepartamento
(p_id dept.dept_no%type
, p_nombre dept.dnombre%type
, p_localidad dept.loc%type)
AS
begin
    insert into dept values (p_id, p_nombre, p_localidad);
    --normalmente, dentro de los procedimientos de accion se incluye
    --commit o rollback, si diera una excepción
    commit;
end;
/

/
begin
   sp_insertardepartamento(11, '11', '11');
end;
/

select * from dept;

rollback;

--opción 2
/
create or replace procedure sp_insertardepartamento
(p_nombre dept.dnombre%type
, p_localidad dept.loc%type)
AS
    v_max_id dept.dept_no%type;
begin
    --realizamos un cursor implícito para buscar el max id
    select max(dept_no)+1 into v_max_id from dept;
    insert into dept values (v_max_id, p_nombre, p_localidad);
    commit;
exception
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No existen datos');
        rollback;
end;
/

/
begin
   sp_insertardepartamento('miércoles', 'azca');
end;
/

rollback;

--realizar un procediimiento para incrementar el salario de 
--los empleados por un oficio.
--debemos enviar el oficio y el incremento.
select * from emp;

/
create or replace procedure sp_incrementarsalario
(p_oficio emp.oficio%type
,p_nvo_salario number)
AS
begin
    update emp set salario = (salario + p_nvo_salario) where upper(oficio)=upper(p_oficio);
    commit;
end;
/

/
begin
   sp_incrementarsalario('ANALISTA', 1);
end;
/

--versión 1
--necesito un procedimiento para insertar un doctor.
--enviaremos todos los datos del doctor excepto el id
--debemos recuperar el máximo id de doctor dentro del procedimiento
select * from doctor;
/
create or replace procedure sp_insertardoctor
(p_hospital_cod doctor.hospital_cod%type
, p_apellido doctor.apellido%type
, p_especialidad doctor.especialidad%type
, p_salario doctor.salario%type)
AS
    v_max_doctor_no doctor.doctor_no%type;
begin
    select max(doctor_no)+1 into v_max_doctor_no from doctor;
    insert into doctor values (p_hospital_cod, v_max_doctor_no, p_apellido
    , p_especialidad, p_salario);
    DBMS_OUTPUT.PUT_LINE('Insertados' || sql%rowcount);
    commit;
end;
/

/
begin
    sp_insertardoctor (20, 'Quiroz', 'Cardiología', 295000);
end;
/

--versión 2
--necesito un procedimiento para insertar un doctor.
--enviaremos todos los datos del doctor excepto el id
--debemos recuperar el máximo id de doctor dentro del procedimiento
--enviaremos el nombre del hospital en lugar del id del hospital
--controlar si no existe el hospital enviado
select * from doctor;
select * from hospital;

/
create or replace procedure sp_insertardoctor
(p_nombre_hospital hospital.nombre%type
, p_apellido doctor.apellido%type
, p_especialidad doctor.especialidad%type
, p_salario doctor.salario%type)
AS
    v_max_doctor_no doctor.doctor_no%type;
    v_hospital_id hospital.hospital_cod%type; 
begin
    select max(doctor_no)+1 into v_max_doctor_no from doctor;
    select hospital_cod into v_hospital_id from hospital where upper(nombre)=upper(p_nombre_hospital);
    insert into doctor values (v_hospital_id, v_max_doctor_no, p_apellido
    , p_especialidad, p_salario);
    DBMS_OUTPUT.PUT_LINE('Insertados' || sql%rowcount);
    commit;
exception
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No existe el hospital    ' || p_nombre_hospital);
end;
/

/
begin
    sp_insertardoctor ('la plaza', 'Pedraza', 'Anestecista', 395000);
end;
/


--podemos usar cursores explicitos dentro de los procedimientos

--realizar un procedimiento para mostrar los empleados
--de un determinado departamento

/
create or replace procedure sp_empleados_dept
(p_deptno emp.dept_no%type)
AS
    cursor cursor_emp is
    select * from emp
    where dept_no = p_deptno;
begin
    for v_reg_emp in cursor_emp
    loop
        DBMS_OUTPUT.PUT_LINE('Apellido  ' || upper(v_reg_emp.apellido)
        || ' , Oficio: ' || v_reg_emp.oficio);
    end loop;
end;
/

/
begin
    sp_empleados_dept(10);
end;
/

--si usamos cursor implícito (devuelve un valor) e introduciomos un dato erróneo da error "too many rows"
--si usamos cursor explícito no devuelve error

