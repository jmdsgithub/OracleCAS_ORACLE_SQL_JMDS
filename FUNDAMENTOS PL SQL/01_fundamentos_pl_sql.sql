declare
--mi comentario
--declaramos una variable
   numero int;
   texto varchar2(50);
begin
    texto:='Mi primer PL/SQL';
    dbms_output.put_line('Mensaje: ' || texto);
   dbms_output.put_line('Mi primer bloque anónimo');
   numero := 44;
   dbms_output.put_line('Valor número: ' || numero);
   numero := 22;
   dbms_output.put_line('Valor número: ' || numero);
end;




DECLARE
    nombre varchar2(30);
BEGIN
    nombre := '&dato';
    dbms_output.put_line('Su nombre es ' || nombre);
end;


declare
   fecha    date;
   texto    varchar2(50);
   longitud int;
begin
   fecha := sysdate;
   texto := '&data';
    --almacenamos la longitud del texto
   longitud := length(texto);
    --la longitud de su texto es....
   dbms_output.put_line('La longitud del texto es ' || longitud);
    --hoy es ... miércoles
   dbms_output.put_line('Hoy es ' || to_char(fecha,'day'));
   dbms_output.put_line(texto);
end;


    undefine data1;
    undefine data2;
DECLARE
    numero1 int;
    numero2 int;
    suma int;
BEGIN
    numero1 := '&data1';
    numero2 := '&data2';
    suma := numero1 + numero2;
    dbms_output.put_line('La suma de ' || numero1 || ' + ' || numero2 || ' es igual a  ' || suma);
end;

DECLARE
    --declaramos una varisable para almacenar el numero de departamento
    v_departamento int;
BEGIN
    
    --pedimos un nro de departamento al usuario
    v_departamento := &dept;
    update emp set salario = salario + 1 where dept_no = v_departamento;
end;

undefine dept;


select * from emp;