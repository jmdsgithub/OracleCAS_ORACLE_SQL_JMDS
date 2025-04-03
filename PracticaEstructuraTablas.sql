create table colegios(
    cod_colegio NUMBER
    , nombre varchar2(20) not NULL
    , localidad varchar2(15)
    , provincia varchar2(15)
    , anyo_construccion DATE
    , coste_construccion NUMBER
    , cod_region NUMBER
);

create table profesores(
    cod_profe varchar2(3) not NULL
    , nombre varchar2(20) not NULL
    , apellido1 varchar2(20)
    , apellido2 varchar2(20)
    , dni char(9)
    , edad NUMBER
    , localidad varchar2(20)
    , provincia varchar2(20)
    , salario NUMBER
    , cod_colegio NUMBER
);

create table regiones(
    cod_region NUMBER
    , regiones varchar2(20) not null
);

create table alumnos(
    dni char(9) not null
    , nombre varchar2 (20) not null
    , apellidos varchar2 (20)
    , fecha_ingreso DATE
    , fecha_nac DATE
    , localidad varchar2(15)
    , provincia varchar2(30)
    , cod_colegio number
);

