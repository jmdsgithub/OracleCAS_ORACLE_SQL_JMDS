--vammos a mostrar la suma de los primeros 100 numeros
--1.- loop....end   lop

DECLARE
    --las variables contador suelen denominarse
    --con una sola letra: i, z, k
    i int;
    suma int;
BEGIN
    --debemos iniciar i, sino será null
    i:=1;
    --inicializamos suma
    suma:=0;
    LOOP
        suma:= suma+i;
        --incrementamos la variable i
        i:= i+1;
        --debemos indicar cuándo queremos que el bucle finalice
        exit when i > 100;
    end loop;
    dbms_output.put_line('La suma de los primeros 100 números es: ' || suma);

end;


--2.- while.. loop
--la condición se evalua antes de entrar

DECLARE
    i int;
    suma int;
begin
    --debemos iniciar las variables
    i:=1;
    suma:=0;
    while i < 101 loop
        --instrucciones
        suma:=suma+i;
        i:=i+1;
    end loop;
    dbms_output.put_line('La suma de los primeros 100 números es: ' || suma);
end;

--3.- bucle for::loop (contador)
--cuando sabemos el inicio y el final

DECLARE
    suma int;

BEGIN
    suma:=0;
    for i in 1..100 LOOP
        suma:=suma+i;
    end loop;
    dbms_output.put_line('La suma de los primeros 100 números es: ' || suma);
end;

--4.- etiquetas go to

--en el caso siguiente el goto  salta el bucle

DECLARE
    suma int;

BEGIN
    suma:=0;
    dbms_output.put_line('Inicio');
    goto codigo;
    dbms_output.put_line('Antes del bucle');
    for contador in 1..100 LOOP
        suma:=suma+contador;
    end loop;
    <<codigo>>
    dbms_output.put_line('La suma de los primeros 100 números es: ' || suma);
end;

--ejemplos
--bucle para mostrar los numeros entre 1 y 10
--1.- bucle while
--2.- bucle for

--1.- bucle while
DECLARE
    i int;

begin
    --debemos iniciar las variables
    i:=1;
    
    while i <= 10 loop
        dbms_output.put_line(i);
        i:=i+1;
    end loop;
    dbms_output.put_line('Fin del bucle while');
end;

--2.- bucle for

DECLARE
    i int;

BEGIN
    for i in 1..10 LOOP
        dbms_output.put_line(i);
    end loop;
    dbms_output.put_line('Fin del bucle For');
end;

--pedir al usuario un inicio &inicio
--y un numero final
--mostrar los numeros comprendidos entre dicho rango

--con while ******hay que resolverlo, que aun no lo está*********
declare
    numero_inic int;
    numero_fin int;
begin
    --pedimos los numeros al usuario
    numero_inic := &numero_1;
    numero_fin := &numero_2;
    --mostramos los números entre ellos
    for i in numero_inic..numero_fin LOOP
        dbms_output.put_line('Positivo: ' || v_numero);
    else
        dbms_output.put_line('Negativo: ' || v_numero);
    end if;
    dbms_output.put_line('Fin de programa');
end;
undefine numero;

--con bucle for
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
    fin:=&final;
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
