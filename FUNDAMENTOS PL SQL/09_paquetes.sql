--06-05-2025
--paquetes
--creamos nuestro primer paquete de prueba

--header
/
create or replace package pk_ejemplo
as
    --en el header solamente se incluyen las declaraciones
    procedure mostrarmensaje;
end pk_ejemplo;
/

--body
create or replace package body pk_ejemplo
as
    --en el header solamente se incluyen las declaraciones
    procedure mostrarmensaje
    as
    begin 
        dbms_output.put_line('Soy un paquete');
    end;
end pk_ejemplo;
--llamada
begin
    PK_EJEMPLO.MOSTRARMENSAJE;
end;

--vamos a crear un paquete que contenga acciones de eliminar
--
/
create or replace package pk_delete
AS
    procedure eliminarempleado (p_empno emp.emp_no%type);
    procedure eliminardepartamento (p_deptno dept.dept_no%type);
    procedure eliminardoctor (p_doctorno doctor.doctor_no%type);
    procedure eliminarenfermo(p_inscripcion enfermo.inscripcion%type);
end pk_delete;
/
--body
/
create or replace package body pk_delete
as
    procedure eliminarempleado (p_empno emp.emp_no%type)
    as
    BEGIN
        delete from emp where emp_no=p_empno;
        commit;
    end;
    procedure eliminardepartamento (p_deptno dept.dept_no%type)
    as
    BEGIN
        delete from dept where dept_no=p_deptno;
        commit;
    end;
    procedure eliminardoctor (p_doctorno doctor.doctor_no%type)
    as
    BEGIN
        delete from doctor where doctor_no=p_doctorno;
        commit;
    end;
    procedure eliminarenfermo(p_inscripcion enfermo.inscripcion%type)
    as
    BEGIN
        delete from enfermo where inscripcion=p_inscripcion;
        commit;
    end;
end pk_delete;
/

select * from dept;

/
BEGIN
    pk_delete.eliminardepartamento(43);
end;
/
rollback;

--crearemos un paquete para devolver máximo, minimo y diferencia de
--todos los salarios de los empleados
/
create or replace package pk_empleados_salarios
as
    function minimo return emp.salario%type;
    function maximo return emp.salario%type;
    function diferencia return emp.salario%type;
end pk_empleados_salarios;
/
--creamos el body
/
create or replace package body pk_empleados_salarios
as
    function minimo return emp.salario%type
    as
        v_minimo emp.salario%type;
    begin
        select min(salario) into v_minimo from emp;
        return v_minimo;
    end;
    function maximo return emp.salario%type
    as
        v_maximo emp.salario%type;
    begin
        select max(salario) into v_maximo from emp;
        return v_maximo;
    end;
    function diferencia return emp.salario%type
    as
        v_diferencia emp.salario%type;
    begin
        v_diferencia:= maximo - minimo;
        return v_diferencia;
    end;
end pk_empleados_salarios;
/
select pk_empleados_salarios.maximo as maximo,
pk_empleados_salarios.minimo as minimo,
pk_empleados_salarios.diferencia as diferencia from dual;
/

--necesito un paquete para realizar
--update, insert y delete sobre departamentos.
--llamamos al paquete pk_departamentos
/
create or replace package pk_departamentos
as
    procedure updatedept (p_id dept.dept_no%type, p_nombre dept.dnombre%type
    , p_localidad dept.loc%type); 
    procedure insertdept (p_id dept.dept_no%type, p_nombre dept.dnombre%type
    , p_localidad dept.loc%type);
    procedure deletedept (p_id dept.dept_no%type);
end pk_departamentos;
/
--body
/
create or replace package body pk_departamentos
as
    procedure updatedept (p_id dept.dept_no%type, p_nombre dept.dnombre%type
    , p_localidad dept.loc%type)
    as
    begin
        update dept set dnombre=p_nombre, loc=p_localidad where dept_no=p_id;
        commit;
    end;
    procedure insertdept (p_id dept.dept_no%type, p_nombre dept.dnombre%type
    , p_localidad dept.loc%type)
    as
    begin
        insert into dept values (p_id, p_nombre, p_localidad);
        commit;
    end;
    procedure deletedept (p_id dept.dept_no%type)
    as
    begin
        delete from dept where dept_no=p_id;
        
    end;
end pk_departamentos;
/

/
begin
    PK_DEPARTAMENTOS.INSERTDEPT(88, 'martes', 'Madrid');
end;
/
/
begin
    PK_DEPARTAMENTOS.UPDATEDEPT(88, 'martesssss', 'MadriZZ');
end;
/
/
begin
    PK_DEPARTAMENTOS.DELETEDEPT(88);
end;
/
select * from dept;
rollback;









--1.
--Necesito una funcionalidad que nos devuelva
--el apellido, el trabajo, salario y lugar de trabajo (departamento/hospital)
--de todas las personas de nuestra bbdd
--usar union
--2.
--Necesito otra funcionalidad que nos devuelva
--el apellido, el trabajo, salario y lugar de trabajo (departamento/hospital)
--dependiendo del salario
--hacer una vista

--pasos:
--1. consulta gorda separada
select emp.apellido, emp.oficio, emp.salario
, dept.dnombre
from emp
inner join dept
on emp.dept_no=dept.dept_no;

select doctor.apellido, doctor.especialidad, doctor.salario
, hospital.nombre
from doctor
inner join hospital
on doctor.hospital_cod=hospital.hospital_cod;

select plantilla.apellido, plantilla.funcion, plantilla.salario
, hospital.nombre
from plantilla
inner join hospital
on plantilla.hospital_cod=hospital.hospital_cod;

--1 consulta gorda reunida
select emp.apellido, emp.oficio, emp.salario
, dept.dnombre
from emp
inner join dept
on emp.dept_no=dept.dept_no
union
select doctor.apellido, doctor.especialidad, doctor.salario
, hospital.nombre
from doctor
inner join hospital
on doctor.hospital_cod=hospital.hospital_cod
union
select plantilla.apellido, plantilla.funcion, plantilla.salario
, hospital.nombre
from plantilla
inner join hospital
on plantilla.hospital_cod=hospital.hospital_cod;

--hacer la vista
/
create or replace view v_todos_empleados
as
select emp.apellido, emp.oficio, emp.salario
, dept.dnombre
from emp
inner join dept
on emp.dept_no=dept.dept_no
union
select doctor.apellido, doctor.especialidad, doctor.salario
, hospital.nombre
from doctor
inner join hospital
on doctor.hospital_cod=hospital.hospital_cod
union
select plantilla.apellido, plantilla.funcion, plantilla.salario
, hospital.nombre
from plantilla
inner join hospital
on plantilla.hospital_cod=hospital.hospital_cod;
/

--2. consulta dentro de vista

select * from v_todos_empleados;

--3. paquete con dos procedimientos
--header
/
create or replace package pk_vista_empleados
as
    procedure todos_empleados;
    procedure todos_empleados_salario (p_salario emp.salario%type);
end pk_vista_empleados;
/
--body

/
create or replace package body pk_vista_empleados
as
    procedure todos_empleados
    as
        cursor c_empleados is
        select * from v_todos_empleados;
    begin
        for v_emp in c_empleados
        loop
            dbms_output.put_line(v_emp.apellido || ', Oficio: ' || v_emp.oficio ||
            ', Salario: ' || v_emp.salario || ', Lugar: ' || v_emp.dnombre);
        end loop;
    end;
    procedure todos_empleados_salario (p_salario emp.salario%type)
    as
        cursor c_empleados is
        select * from v_todos_empleados
        where salario >= p_salario;
    begin
        for v_emp in c_empleados
        loop
            dbms_output.put_line(v_emp.apellido || ', Oficio: ' || v_emp.oficio ||
            ', Salario: ' || v_emp.salario || ', Lugar: ' || v_emp.dnombre);
        end loop;
    end;
end pk_vista_empleados;
/
--3a. procedimiento para devolver todos los datos en un cursor
--3b. procedimiento para devolver todos los datos en un cursor por salario
/
begin
    pk_vista_empleados.todos_empleados;
end;
/
begin
    pk_vista_empleados.todos_empleados_salario(350000);
end;
/

--necesitamos un paquete con procedimiento para modificar el salario de cada
--doctor de forma individual.
--La modificación de los datos de cada doctor será de forma aleatoria.
--Debemos comprobar el salario de cada doctor para ajustar elnúmero aleatorio
--del ncremento.
--1.. Doctor con menos de 200.000: incremento aleatorio de 500
--2. Doctor entre 200.000 y 300.000: incremento aleatorio 300
--3. Doctor mayor de 300.000: incremento aleatorio de 50
--El incremento random lo haremos con una función dentro del paquete.

update doctor set salario = salario + dbms_random.value(1,50);
select dbms_random.value(1,50) from dual;
select round(dbms_random.value(1,50)) from dual;

--header
/
create or replace package pk_doctores
as
    procedure incremento_random_doctores;
    function function_random_doctores(p_iddoctor DOCTOR.DOCTOR_NO%TYPE)
    return NUMBER;
end pk_doctores;
/
--body
/
create or replace package body pk_doctores
as
    procedure incremento_random_doctores
    as
        cursor c_doctores is
        select DOCTOR_NO, APELLIDO, SALARIO from DOCTOR;
        v_random number;
    begin
        for v_doc in c_doctores
        loop
            v_random := function_random_doctores(v_doc.DOCTOR_NO);
            update DOCTOR set SALARIO = SALARIO + v_random
            where DOCTOR_NO=v_doc.DOCTOR_NO;
            dbms_output.put_line('Doctor ' || v_doc.APELLIDO 
            || ' tiene un incremento de ' || v_random);
        end loop;
    end;
    function function_random_doctores(p_iddoctor DOCTOR.DOCTOR_NO%TYPE)
    return NUMBER
    as
        v_salario DOCTOR.SALARIO%TYPE;  
        v_random NUMBER;
    begin
        select SALARIO into v_salario from DOCTOR
        where DOCTOR_NO=p_iddoctor;
        if (v_salario < 200000) then
            v_random := trunc(dbms_random.value(1,500));
        elsif (v_salario > 300000) then
            v_random := trunc(dbms_random.value(1, 50));
        else 
            v_random := trunc(dbms_random.value(1, 300));
        end if;
        return v_random;    
    end;
end pk_doctores;
/

/
declare
    cursor c_doctores is
    select DOCTOR_NO, APELLIDO, SALARIO from DOCTOR;
    v_random number;
begin
    for v_doc in c_doctores
    loop
        v_random := random_doctor(v_doc.DOCTOR_NO);
        update DOCTOR set SALARIO = SALARIO + v_random
        where DOCTOR_NO=v_doc.DOCTOR_NO;
        dbms_output.put_line('Doctor ' || v_doc.APELLIDO 
        || ' tiene un incremento de ' || v_random);
    end loop;
end;
/


/
create or replace function random_doctor
(p_iddoctor DOCTOR.DOCTOR_NO%TYPE)
return number
as
    v_salario DOCTOR.SALARIO%TYPE;  
    v_random NUMBER;
begin
    select SALARIO into v_salario from DOCTOR
    where DOCTOR_NO=p_iddoctor;
    if (v_salario < 200000) then
        v_random := trunc(dbms_random.value(1,500));
    elsif (v_salario > 300000) then
        v_random := trunc(dbms_random.value(1, 50));
    else 
        v_random := trunc(dbms_random.value(1, 300));
    end if;
    return v_random;
end;
/
--386 -> 500
--522 -> 50
select PK_DOCTORES.FUNCTION_RANDOM_DOCTORES(386) as incremento from DUAL;
select random_doctor(522) as incremento from DUAL;
select * from DOCTOR;
update doctor set salario = salario + dbms_random.value(1,50);
select trunc(dbms_random.value(1,50)) as aleatorio from DUAL;
select * from DOCTOR;