declare
    inicio int;
    fin int;
begin
    inicio:= &inicial;
    fin:=&final;
    for i in inicio..fin loop
    dbms_output.put_line(i);
    end loop;
    dbms_output.put_line('Fin de programa');
end;

undefine inicio;
undefine fin;




declare
    inicio int;
    fin int;
begin
    inicio:= &inicial;
    fin:= &final;
    --preguntamos por los valores de los numeros
    if (inicio>=fin) tHEN
        dbms_output.put_line('El número de inicio (' || inicio||')
        debe ser menor al número de fin (' || fin || ')');
    else
        for i in inicio..fin loop
            dbms_output.put_line(i);
        end loop;

    END IF;
    dbms_output.put_line('Fin de programa');
end;

undefine inicio;
undefine fin;