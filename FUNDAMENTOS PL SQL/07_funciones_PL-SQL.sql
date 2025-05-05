--05-05-2025
--funciones

--realizar una función para sumar dos números
/
create or replace function f_sumar_numeros
(p_numero1 number, p_numero2 number)
return NUMBER
AS
    v_suma number;
BEGIN
    v_suma:= nvl(p_numero1, 0)+nvl(p_numero2,0);
    --siempre un return
    return v_suma;
end;
/

--llamada a la funcion con codigo pl/sql
/
declare
    v_resultado number;
begin
    v_resultado:= f_sumar_numeros (22,55);
    DBMS_OUTPUT.PUT_LINE('La suma es   ' || v_resultado);
end;
/

--tambien podemos llamarlo con un select

select f_sumar_numeros(22,99) as suma from dual;
select f_sumar_numeros(salario, comision) as total from emp;


--funcion para saber el numero de personas de un oficio
/
create or replace function num_personas_oficio
(p_oficio emp.oficio%type)
return number
as
    v_personas int;
begin
    select count(emp_no) into v_personas from emp
    where lower(oficio)=lower(p_oficio);
    return v_personas;
end;
/
select num_personas_oficio ('analista') as personas from dual;

--realizar una funcion npara devoolver el mayor de dos numetros

--hecho por mi... revisarlo que no corre
/
create or replace function mayor_de_dos_numeros
(p_num1 number, p_num2 number)
return number
as 
begin
    if p_num1 > p_num2;
    return DBMS_OUTPUT.PUT_LINE('El numero 1 ' || p_num1  || 'Es mayor que el número 2 ' || p_num2);
    else
    p_num 1 < p_num2;
    return DBMS_OUTPUT.PUT_LINE('El numero 2 ' || p_num1  || 'Es mayor que el número 1 ' || p_num2);
    end if
    return DBMS_OUTPUT.PUT_LINE('El numero 1 ' || p_num1  || 'Es igual al número 2 ' || p_num2);
end;
/

/
create or replace function mayor_de_dos_numeros
(p_num1 number, p_num2 number)
return number
as 
    v_resultado number;
begin
    if p_num1 > p_num2;

/

--resalizar un funcion para devolver el mayor de tres números
--no utilizar if
--buscar (google) una función de oracle que nos devuelva el mayor de tres números

/
CREATE OR REPLACE FUNCTION mayor_de_tres
    (num1 IN NUMBER,
    num2 IN NUMBER,
    num3 IN NUMBER)
    RETURN NUMBER IS
BEGIN
    RETURN DBMS_OUTPUT.PUT_LINE('El numero mayor de los tres es:   ' || GREATEST(num1, num2, num3);
END;
/

/
CREATE OR REPLACE FUNCTION mayor_de_tres_numeros
    (num1 IN NUMBER,
    num2 IN NUMBER,
    num3 IN NUMBER)
    RETURN NUMBER IS
BEGIN
    RETURN DBMS_OUTPUT.PUT_LINE('El numero mayor de los tres es:   ' || GREATEST(num1, num2, num3);
END;
/

select mayor_de_tres_numeros (8, 3, 55) as mayor from dual;

--tenemos los parametros por defecto dentro de las funciones
select 100 * 1.21 as iva from dual;
select 100*1.18 as iva from dual;
select importe, iva(importe) as iva from productos;
select importe, iva(importe, 21) as iva from productos;

/
create or replace function calcular_iva
(p_precio number, p_iva number:=1.18)
return number
as
begin
    return p_precio * p_iva;
end;
/

select calcular_iva(100,1.21) as iva from dual;

--si no le indico el valor, me toma el valor por defecto, que es 1.18

select calcular_iva(100) as iva from dual;

