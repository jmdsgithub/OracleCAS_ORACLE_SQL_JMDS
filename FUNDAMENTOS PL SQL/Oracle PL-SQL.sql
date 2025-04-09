--fundamentos de pl sql

--el examen 71 es el basic

--el examen 149 es el advanced

--es preferible hacer el 149 

--EJEMPLO PRIMER PL-SQL 

declare 

     numero int := 12; 

begin 

  dbms_output.put_line('El número vale ' || numero); 

  --CAMBIAMOS EL VALOR DEL NUMERO 

  numero := 19; 

  dbms_output.put_line('El número vale ahora ' || numero); 

end; 
