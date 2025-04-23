

--vamos a mostrar la suma de los primeros 100 numeros
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


--queremos un bucle pidiendo un inicio y un fin
--mostrar los numeros pares comprendidos entre dicho incio y fin

declare
    inicio int;
    fin int;
begin
    inicio := &inicial;
    fin :=&final;
    --preguntamos por los valores de los numeros
    for i in inicio..fin loop
        if (MOD(i,2) = 0) then
            dbms_output.put_line(i);
        end if;
    end loop;
    dbms_output.put_line('Fin de programa');
end;

undefine inicial;
undefine final;

--CONJETURA DE COLLATZ
--lA TEORÍA INDICA QUE CUALQUIER NÚMERO SIEMPRE LLEGARÁ A SER 1
--SIGUIENDO UNA SERIE DE INSTRUCCIONES:
--sI EL NUMERO ES PAR, SE DIVIDE ENTRE 2
--SI EL NUMERO ES IMPAR, SE SE MULTIPLICA POR 3 Y SUMAMOS 1
--6,3,10,5,16,8,4,2,1


declare
    NUMERO int;
begin
    NUMERO := &valor;
    WHILE NUMERO <> 1 LOOP
        IF(mod(numero, 2)=0) then
        numero := numero/2;
        else
        numero:= (numero*3)+1;
        
        end if;
        dbms_output.put_line(numero);
    end loop;
    dbms_output.put_line('Fin de programa');
end;

undefine valor;


--mostrar la tabla de multiplicar del número que pida el usuario que pida el usuario


declare
    numero int;
    resultado int;
begin
    numero := &inicial;
    resultado := 0;
    --multiplicamos el numero por cada valor del bucle
        for i in 1..10 loop
        resultado := numero * i;
        dbms_output.put_line(numero || ' * ' || i || ' = ' || resultado);
        end loop;
    dbms_output.put_line('Fin de programa');
end;

undefine inicial;

--quiero un programa que nos pedirá un texto
--debemos recorrer dicho texto letra a letra
--mostramos cada letra dekl texto

declare
    v_texto varchar2(50);
    v_longitud int;
    v_letra varchar2 (1);
begin
    v_texto:= '&texto';
    --un elemento en oracle empieza en UNO
    --en un lugar de la mancha.... 
    v_longitud:= length(v_texto);
    for i in 1..v_longitud loop
        v_letra := substr(v_texto, i, 1);
        dbms_output.put_line(v_letra);
    end loop;
    dbms_output.put_line('Fin de programa');
end;

undefine texto;

--necesito un programa donde un usuario introducirá un texto numérco
--necesito mostrar la suma de todos los caracteres numéricos de un mensaje
-- la suma de 1234 es 10

declare
    v_texto_numero varchar2(50);
    v_longitud int;
    v_letra varchar2 (1);
    v_numero int;
    v_suma int;
begin
    v_suma:=0;
    v_texto_numero := &texto;
    v_longitud:= length(v_texto_numero);
    for i in 1..v_longitud loop
        v_letra := substr(v_texto_numero, i, 1);
        v_numero:= to_number(v_letra);
        v_suma:= v_suma+v_numero;
    end loop;
    dbms_output.put_line('La suma de los caracteres de ' || v_texto_numero || ' es ' || v_suma);
    dbms_output.put_line('Fin de programa');
end;

undefine texto;

    





