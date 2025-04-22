


--ejemplo de CURSORES

DECLARE
    v_nombre dept.dnombre%type;
    v_loc dept.loc%type;

BEGIN
    --crearemos el bucle para insertar 5 departamentos
    for i in 1..5 loop
        v_nombre:= 'Departamento '|| i;
        v_loc:= 'Localidad ' || i;
        insert into dept values (i, v_nombre, v_loc);
    end loop;
    DBMS_OUTPUT.PUT_LINE('Fin de programa.');
end;

select * from dept order by 1;

--ponemos una subconsulta a ver si FUNCIONA
DECLARE
    v_nombre dept.dnombre%type;
    v_loc dept.loc%type;

BEGIN
        for i in 1..5 loop
        v_nombre:= 'Departamento '|| i;
        v_loc:= 'Localidad ' || i;
        insert into dept values 
        ((select max(dept_no) + 1 from dept)
        , v_nombre, v_loc);
    end loop;
    DBMS_OUTPUT.PUT_LINE('Fin de programa.');
end;
--lo anterior SI FUNCIONA

--caso de ejemplo de cuando NO funciona un select
--realizar un bloque pl/sql que pedirá un 
--número al usuaruio y mostrará el departamento con dicho número

DECLARE
    v_id int;
BEGIN
    v_id:= &numero;
    select * from dept where dept_no=v_id;
end;

undefine numero;

--lo anterior NO funciona, no se puede hacer un select en ujna consulta SQL
--excepto si es dentro de un INSERT, un UPDATE o un DELETE


--cursores IMPLICITOS solamente pueden devolver una fila
--ejemplo: recuperar oficio empleado rey

DECLARE 
    v_oficio emp.oficio%type;
BEGIN
    select oficio into v_oficio from emp where upper(apellido)= 'REY';
    dbms_output.put_line('El oficio de REY es.... ' || v_oficio);
end;

--Los cursores pueden ser 
--implícitos
--(devuelven una sola fila) 
--o explícitos 
--(devuelven más de una).


--ejemplo: mostarr apellido y salario de todos los empleados
DECLARE
    v_ape emp.apellido%type;
    v_sal emp.salario%type;
    --declaramos nuestro cursor con una consulta
    cursor cursoremp is
    select apellido, salario from emp;
begin
    --abrir el cursor
    open cursoremp;
    --bucle infinito
    loop
        --extraemos los datos del cursor
        fetch cursoremp into v_ape, v_sal;
        --preguntamos si hemos terminado
        exit when cursoremp%notfound;
        --dibujamos los datos
        dbms_output.put_line('Apellido: ' || v_ape 
        || ', Salario: ' || v_sal);
        end loop;
end;

select * from emp;

--ATRIBUTOS PARA CONSULTAS DE ACCION

--ROWCOUNT

--incrementar en 1 el salario de los empleados del departamento 10
--mostrar el número de empleados modificados. 
BEGIN
    update emp set salario = salario + 1 
    where dept_no=10;
    dbms_output.put_line('Empleados modificados ' || sql%rowcount);
end;

--ejercicio
--incrementar en 10mil al empleado que menos cobre en la empresa.
--hecho por mí 
DECLARE

BEGIN
    update emp set salario = salario +10000
    where salario=(select min(salario) from emp);
    dbms_output.put_line('Empleados modificados ' || sql%rowcount);
end;

--hecho por paco
declare 
    v_minimo_salario emp.salario%type;
    --para ver el apellido
    v_apellido emp.apellido%type;
begin 
    select min(salario) into v_minimo_salario from emp;
    --almacenamos la persona que cobra dicho salario
    select apellido into v_apellido from emp
    where salario=v_minimo_salario;
    update emp set salario = salario +10000
    where salario=v_minimo_salario;
    dbms_output.put_line('Empleado modificado ' || sql%rowcount || ', Sr. ' || v_apellido);
end;

select * from dept;


--realizar un código pl/sql donde pediremos
--el numero, nombre y localidad de un departamento.
--si el departamento existe, modificamos nombre y localidad
--si el departameno no existe, lo insertamos.

DECLARE
    v_id dept.dept_no%type;
    v_nombre dept.dnombre%type;
    v_localidad dept.loc%type;
    v_existe dept.dept_no%type;
    
    CURSOR cursordept is
    select dept_no from DEPT
    where dept_no=v_id;
begin 
    v_id:= &iddepartamento;
    v_nombre:= '&nombre';
    v_localidad:= '&localidad';
    open cursordept;
    fetch cursordept into v_existe;
    if (cursordept%found) THEN
       dbms_output.put_line('Update');
       update dept set dnombre=v_nombre, loc=v_localidad
       where dept_no=v_id;
    else 
        dbms_output.put_line('Insert');
        insert into dept values (v_id, v_nombre, v_localidad);
    end if;
end;

undefine iddepartamento;
undefine nombre;
undefine localidad;

--otra forma, pero SIN cursor

DECLARE
    v_id dept.dept_no%type;
    v_nombre dept.dnombre%type;
    v_localidad dept.loc%type;
    v_existe dept.dept_no%type;
       
begin 
    v_id:= &iddepartamento;
    v_nombre:= '&nombre';
    v_localidad:= '&localidad';
    select count(dept_no) from DEPT where dept_no=v_id;
    if (V_EXISTE<>0) THEN
       dbms_output.put_line('Update');
       update dept set dnombre=v_nombre, loc=v_localidad
       where dept_no=v_id;
    else 
        dbms_output.put_line('Insert');
        insert into dept values (v_id, v_nombre, v_localidad);
    end if;
end;

undefine iddepartamento;
undefine nombre;
undefine localidad;


--ejercicio
--realizar un código pl/sql para modificar elsalario del empleado arroyo
--si el empleado cobra más de 250.000 le bajamos el sueldo en 10.000
--sino, le subimos el sueldo en 10.000

DECLARE
    v_salario emp.salario%type;
begin 
    select salario into v_salario from emp where apellido = 'arroyo';
        if (V_salario < 250000) THEN
            dbms_output.put_line('Aumento de sueldo');
            update emp set salario=salario+10000 where apellido='arroyo';
        else 
            dbms_output.put_line('Rebaja de sueldo');
            update emp set salario=salario-10000 where apellido='arroyo';
        end if;
end;

select * from emp;

select salario from emp where apellido = 'arroyo';


