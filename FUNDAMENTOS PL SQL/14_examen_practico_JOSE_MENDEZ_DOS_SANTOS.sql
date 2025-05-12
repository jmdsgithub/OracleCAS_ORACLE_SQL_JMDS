--1.-

CREATE TABLE distribuidoras (
    iddistribuidor NUMBER(10) PRIMARY KEY,
    distribuidor VARCHAR2(50),
    direccion VARCHAR2(50),
    email VARCHAR2(50),
    paginaweb VARCHAR2(50),
    telefono VARCHAR2(50),
    contacto VARCHAR2(50),
    logo VARCHAR2(50)
);

-- Tabla: generos
CREATE TABLE generos (
    idgenero NUMBER(10) PRIMARY KEY,
    genero VARCHAR2(50)
);

-- Tabla: nacionalidad
CREATE TABLE nacionalidad (
    idnacionalidad NUMBER(10) PRIMARY KEY,
    nacionalidad VARCHAR2(50),
    bandera VARCHAR2(50)
);

-- Tabla: clientes
CREATE TABLE clientes (
    idcliente NUMBER(10) PRIMARY KEY,
    nombre VARCHAR2(50),
    direccion VARCHAR2(50),
    email VARCHAR2(50),
    cpostal VARCHAR2(50),
    paginaweb VARCHAR2(50),
    imagen_cliente VARCHAR2(50)
);

-- Tabla: peliculas
CREATE TABLE peliculas (
    idpelicula NUMBER(10) PRIMARY KEY,
    iddistribuidor NUMBER(10),
    idgenero NUMBER(10),
    titulo VARCHAR2(50),
    idnacionalidad NUMBER(10),
    argumento VARCHAR2(50),
    foto VARCHAR2(50),
    fecha_estreno DATE,
    actores VARCHAR2(50),
    director VARCHAR2(50),
    duracion VARCHAR2(10),
    precio NUMBER(10, 2),
    FOREIGN KEY (iddistribuidor) REFERENCES distribuidoras(iddistribuidor),
    FOREIGN KEY (idgenero) REFERENCES generos(idgenero),
    FOREIGN KEY (idnacionalidad) REFERENCES nacionalidad(idnacionalidad)
);

-- Tabla: pedidos
CREATE TABLE pedidos (
    idpedido NUMBER(10) PRIMARY KEY,
    idcliente NUMBER(10),
    idpelicula NUMBER(10),
    cantidad NUMBER(10),
    fecha DATE,
    precio NUMBER(10, 2),
    FOREIGN KEY (idcliente) REFERENCES clientes(idcliente),
    FOREIGN KEY (idpelicula) REFERENCES peliculas(idpelicula)
);

describe peliculas;
describe clientes;
describe pedidos;

drop table peliculas;
drop table distribuidoras;
drop table generos;
drop table pedidos;
drop table clientes;
drop table nacionalidad;

--2.- 

INSERT INTO distribuidoras VALUES (1, 'CineWorld', 'Calle Falsa 123', 'info@cineworld.com', 'www.cineworld.com', '123456789', 'Juan Pérez', 'logo1.jpg');

INSERT INTO generos VALUES (1, 'Acción');

INSERT INTO nacionalidad VALUES (1, 'España', 'bandera_es.png');

INSERT INTO clientes VALUES (1, 'Carlos Ramírez', 'Calle Luna 45', 'carlos@email.com', '28080', 'www.cliente1.com', 'carlos.jpg');

INSERT INTO peliculas VALUES (
    1, 1, 1, 'La gran aventura', 1, 'Película de acción intensa',
    'aventura.jpg', TO_DATE('2024-10-12', 'YYYY-MM-DD'), 
    'Actor 1, Actor 2', 'Director A', '120 min', 12.99
);

INSERT INTO pedidos VALUES (
    1, 1, 1, 2, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 25.98
);

select * from peliculas;
select * from distribuidoras;
select * from generos;
select * from pedidos;
select * from clientes;
select * from nacionalidad;

--3.- 
--Crear un procedimiento almacenado para la posible incorporación de un cliente.
-- En el procedimiento almacenado pasaremos tantos parámetros como campos tenga la tabla. 
/
CREATE OR REPLACE PROCEDURE insertar_cliente (
    p_idcliente         IN clientes.idcliente%TYPE,
    p_nombre            IN clientes.nombre%TYPE,
    p_direccion         IN clientes.direccion%TYPE,
    p_email             IN clientes.email%TYPE,
    p_cpostal           IN clientes.cpostal%TYPE,
    p_paginaweb         IN clientes.paginaweb%TYPE,
    p_imagen_cliente    IN clientes.imagen_cliente%TYPE
)
IS
BEGIN
    INSERT INTO clientes (
        idcliente, nombre, direccion, email,
        cpostal, paginaweb, imagen_cliente
    ) VALUES (
        p_idcliente, p_nombre, p_direccion, p_email,
        p_cpostal, p_paginaweb, p_imagen_cliente
    );
    
    COMMIT;
END insertar_cliente;
/

--4.-
--Crear una función que nos devuelva el precio de una película
-- (pasándole el idPelicula como parámetro de entrada). 

/
CREATE OR REPLACE FUNCTION obtener_precio_pelicula (
    p_idpelicula IN peliculas.idpelicula%TYPE
) RETURN NUMBER
IS
    v_precio peliculas.precio%TYPE;
BEGIN
    SELECT precio
    INTO v_precio
    FROM peliculas
    WHERE idpelicula = p_idpelicula;

    RETURN v_precio;
END obtener_precio_pelicula;
/

--5.- 
--Crear un procedimiento para modificar el email y dirección de un cliente. 
/
CREATE OR REPLACE PROCEDURE modificar_datos_cliente (
    p_idcliente IN clientes.idcliente%TYPE,
    p_email     IN clientes.email%TYPE,
    p_direccion IN clientes.direccion%TYPE
)
IS
BEGIN
    UPDATE clientes
    SET email = p_email,
        direccion = p_direccion
    WHERE idcliente = p_idcliente;

    COMMIT;
END modificar_datos_cliente;
/

BEGIN
    modificar_datos_cliente(
        p_idcliente => 1,
        p_email     => 'nuevoemail@cliente.com',
        p_direccion => 'Nueva Dirección 456'
    );
END;

select * from clientes;


--6.-
--Desarrollar una función en la que al pasarle un título de película nos devuelva la duración. 

/
CREATE OR REPLACE FUNCTION obtener_duracion_pelicula (
    p_titulo IN peliculas.titulo%TYPE
) RETURN VARCHAR2
IS
    v_duracion peliculas.duracion%TYPE;
BEGIN
    SELECT duracion
    INTO v_duracion
    FROM peliculas
    WHERE titulo = p_titulo;

    RETURN v_duracion;
END obtener_duracion_pelicula;
/

--7.- 
--Crear una vista que nos muestre los siguientes datos de las películas:
--  Título, Fecha, Actores, Argumento, Nombre del género y nombre de la nacionalidad. 

/
CREATE OR REPLACE VIEW vista_info_peliculas AS
SELECT
    p.titulo,
    p.fecha_estreno,
    p.actores,
    p.argumento,
    g.genero AS nombre_genero,
    n.nacionalidad AS nombre_nacionalidad
FROM
    peliculas p
JOIN
    generos g ON p.idgenero = g.idgenero
JOIN
    nacionalidad n ON p.idnacionalidad = n.idnacionalidad;
/

 select * from vista_info_peliculas;

 --8.-
 --Crear procedimiento con un cursor que muestre todos los datos de la vista anterior con un bucle FOR.
 --  (Mostrar el título, el nombre del género y la nacionalidad) 

 /
 CREATE OR REPLACE PROCEDURE mostrar_info_peliculas
IS
BEGIN
    FOR pelicula IN (
        SELECT titulo, nombre_genero, nombre_nacionalidad
        FROM vista_info_peliculas
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Título: ' || pelicula.titulo);
        DBMS_OUTPUT.PUT_LINE('Género: ' || pelicula.nombre_genero);
        DBMS_OUTPUT.PUT_LINE('Nacionalidad: ' || pelicula.nombre_nacionalidad);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
END mostrar_info_peliculas;
/

/
BEGIN
    mostrar_info_peliculas;
END;