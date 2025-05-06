--05-05-2025
--vistas

select * from emp;

--por ejemplo hacer vistas predefinidas para no permitir
--a los usuarios  ver salarios de la empresa


--vamos a crear una vista para tener tofos los datos de los empleados
--sin el salario ni la comisión
/
create or replace view v_empleados
AS
    select emp_no, apellido, oficio,fecha_alt, salario, dept_no from emp;
/

/
create or replace view v_emp_dept
as
    select emp.apellido, emp.oficio, emp.salario
    , dept.dnombre, dept.loc
    from emp
    inner join dept
    on emp.dept_no=dept.dept_no;
/

--una vista simplifica las consultas
--mostrar el apellido, salario, nombre del departamento y localidad de todos los empleados

/
create or replace view v_emp_dept
as
    select emp.apellido, emp.oficio, emp.salario
    , dept.dnombre, dept.loc
    from emp
    inner join dept
    on emp.dept_no=dept.dept_no;
/

select * from v_emp_dept where loc='MADRID';

/
create or replace view v_empleados_virtual
as
    select emp_no, apellido, oficio, salario + comision as total,
    dept_no from emp;
/

select * from v_empleados_virtual;

--modificar el salario de los empleados analista
--tabla

update emp set salario =salario + 1 where oficio='ANALISTA';

--vista

update v_empleados set salario =salario + 1 where oficio='ANALISTA';

--eliminamos al empleado con id 7917 de la vista (y, por ende, también de la tabla)

delete from v_empleados where emp_no=7917;

--insertamos un empleado en la vista

/
insert into v_empleados values
(1111, 'lunes', 'LUNES', sysdate, 0, 40);
/

/
create or replace view v_empleados
AS
    select emp_no, apellido, oficio,fecha_alt, salario, dept_no from emp;
/

--podríamos modificar el salario de los empleados de madrid?????

update v_emp_dept set salario = salario + 1 where loc='MADRID';

--eliminar a los empleados de barcelona

delete v_emp_dept where loc='BARCELONA';
--sí elimina, pero no lo hace correctamente, coge aleatoriamente "lo que quiere", por lo cual es incorrecto

/
create or replace view v_emp_dept
as
    select emp.emp_no, emp.apellido, emp.oficio, emp.salario
    , dept.dnombre, dept.loc
    from emp
    inner join dept
    on emp.dept_no=dept.dept_no;
/

insert into v_emp_dept values
(3333, 'lunes 3', 'LUNES 3', 250000, 'CONTABILIDAD', 'SEVILLA');
--el update anterior apunta a DOS tablas por lo cual no permite insertar

rollback;


--check option= impide que una vista quede inútil
--ejemplo

--creamos laa vista V_vendedores
/
create or replace view v_vendedores
as
    select emp_no, apellido, oficio, salario, dept_no from emp
    where oficio = 'VENDEDOR'
    with check option;
/

--modificamos salario de los vendedores
update v_vendedores set salario=salario+1;

--intentamos cambiar el dato de vendedor al error, pero,
-- como tiene check option, no lo permite
update v_vendedores set oficio='VENDIDOS';
select * from v_vendedores;
rollback;

--ejercicio
--Un número narcisista es aquel que es igual a la suma de cada uno de sus dígitos elevados a la “n” potencia
-- (donde “n” es el número de cifras del número). La metáfora de su nombre alude a lo mucho que parecen
-- “quererse a sí mismos” estas cifras. 
--Por ejemplo, el 153 es un número narcisista puesto que 13 + 53 + 33 = 1 + 125 + 27 = 153. 
--Los primeros números narcisistas son: 1, 2, 3, 4, 5, 6, 7, 8, 9, 153, 370, 371, 407, 1634, 8208, 9474 y 54748.

/
DECLARE
    v_num NUMBER := 153; -- Número a verificar
    v_sum NUMBER := 0;
    v_digit NUMBER;
    v_temp NUMBER := v_num;
    v_length NUMBER := LENGTH(v_num);
BEGIN
    WHILE v_temp > 0 LOOP
        v_digit := MOD(v_temp, 10);
        v_sum := v_sum + POWER(v_digit, v_length);
        v_temp := TRUNC(v_temp / 10);
    END LOOP;

    IF v_sum = v_num THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' es un número narcisista.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num || ' no es un número narcisista.');
    END IF;
END;
/

SELECT POWER(-3,3) FROM dual;

SELECT POWER(-3,8) FROM dual;

SELECT DECODE(1, 1, 'One', 'Default') FROM dual;