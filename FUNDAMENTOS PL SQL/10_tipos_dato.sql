--07-05-2025
--tipos dato
--record
--rowtype
--array

--crear una variable tipo record
--un record es una fila con múltiples registros
--bloque anónimo para recuperar el apellido, oficio y salario de empleados
/
DECLARE
    --primero declaramos el tipo
    type type_empleado is record(
        v_apellido varchar2(50),
        v_oficio varchar2(50),
        v_salario number
    );

    --uso del tipo en una variable
    v_tipo_empleado type_empleado;
BEGIN
    select apellido, oficio, salario
    into v_tipo_empleado
    from emp
    where emp_no=7839; 
    dbms_output.put_line('Apellido: ' || v_tipo_empleado.v_apellido
    ||', Oficio: '|| v_tipo_empleado.v_oficio
    || ' Salario: ' || v_tipo_empleado.v_salario);
end;
/

--rowtype




--arrays
--un array es un conjunto de filas y columnas

--por un lado tenemos la declaración del tipo
--por otro lado tenemos la variable de dicho tipo
/
declare
    --un tipo array para números
    type table_numeros is table of number
    index by binary_integer;
    --objeto para almacenar varios números
    lista_numeros table_numeros;
begin
    --almacenamos datos en su interior
    lista_numeros(1) := 88;
    lista_numeros(2) := 99;
    lista_numeros(3) := 222;
    dbms_output.put_line('Numero elementos: '|| lista_numeros.count);
    --podemos recorrer todos los registros
    for i in 1..lista_numeros.count loop
        dbms_output.put_line('Numero: '|| lista_numeros(i));
    end loop;
end;
/


--almacenamos a la vez
--guardamos un tipo e fila departamentos
/
declare
    type table_dept is table of dept%rowtype
    index by binary_integer;
    --declaramos el objeto para almacenar las filas
    lista_dept table_dept;
begin
    select * into lista_dept(1) from dept where dept_no=10;
    select * into lista_dept(2) from dept where dept_no=30;
    for i in 1..lista_dept.count
    loop
        dbms_output.put_line(lista_dept(i).dnombre|| ' ,  '|| lista_dept(i).loc);
    end loop;
end;
/


/
declare
    cursor cursorempleados is
    select apellido from emp;
    type c_lista is varray(20) of emp.apellido%type;
    lista_empleados c_lista:=c_lista();
    contador integer:=0;
begin
    for n in cursorempleados loop
    contador:=contador+1;
    lista_empleados.extend;
    --cada extend añade un nuevo elemento
    lista_empleados(contador) := n.apellido;
    dbms_output.put_line('Empleado ('|| contador ||
    '):'||lista_empleados(contador));
    end loop;
end;
/

