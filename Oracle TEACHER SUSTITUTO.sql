-- TEMA 12
-- Diccionario de datos



select * from user_tables;

select * from employees;
select * from departments;


select * from employees;
select * from employees where employee_id=100;
select * from user_tables;
select * from all_tables;
select * from dba_tables; -- Error para un usuario no administrador
select * from cdb_tables; -- Error para un usuario no administrador

select count(*) from dba_tables;


/* Prefijos

USER_   - Los objetos del esquema (= usuario)
ALL_    - Los objetos del esqema/usuario y de otros esquemas en los que el usuario tiene algún privilegio
DBA_    - Todos los objetos de la instancia (sólo visible por los DBAs)

-- Multitenant

CDB_    - Todos los objetos de todos los contenedores si la sesión está en el contenedor: cdb$root
          Todos los objetos del contenedor en el que se encuentra la sesión, si es una PDB (Pluggable Database)
DBA_    - Todos los objetos del contenedor en el que se encuentra la sesión

Contenedor 1 > cdb$root
Contenedor 2 > pdb$seed
Contenedores 3+ > PDBs

show con_id
show con_name

-- TABLAS PRINCIPALES PARA CONSULTA/DESARROLLO
*_objects      - Toodos los objetos
*_tables       - Las tablas
*_tab_columns  - Columnas de las tablas
*_constraints  - Restricciones
*_cons_columns - Columnas de las restricciones
*_views        - Vistas
*_indexes      - Índices
*_ind_columns  - Columnas de los índices
*_synonyms     - Sinónimos
*_sequences    - Secuencias
*_tab_comments - Comentarios de las tablas
*_col_comments - Comentarios de las columnas de las tablas

*/

select * from dictionary;
select * from dict;
select * from user_objects;
select * from user_tables;
select * from user_tab_columns;
select * from user_tab_columns where table_name = 'EMPLOYEES' order by column_id;


select * from dict where table_name like '%IND%';

select * from user_tab_comments;
select * from user_col_comments;

select * from user_views;

select * from employees;
select * from user_constraints where table_name='EMPLOYEES';

select * from user_cons_columns where table_name='EMPLOYEES';

describe employees;


-- V$
-- Son vistas de rendimiento

select * from v$session;
  -- Los usuarios sin privilegios no pueden verlas


-- Comentarios

create table t1 (c1 number(3));
comment on table t1 is 'Es una tabla de prueba';
comment on column t1.c1 is 'Es la columna c1 de la tabla de prueba';

select * from user_tab_comments where table_name='T1';
select * from user_col_comments where table_name='T1';


--Tasks 
--1. Query the USER_TABLES data dictionary view to see information about the
-- tables that you own.

select * from user_tables;

--2. Query the ALL_TABLES data dictionary view to see information about all the tables that you 
--can access. Exclude the tables that you own. 

SELECT table_name, owner 
FROM   
all_tables 
WHERE  owner <>'system'; 

--3. For a specified table, create a script that reports the column names, data types, and data 
--types’ lengths, as well as whether nulls are allowed. Prompt the user to enter the table 
--name. Give appropriate aliases to the DATA_PRECISION and DATA_SCALE columns. 
--Save this script in a file named lab_12_03.sql.  

SELECT column_name, data_type, data_length, 
data_precision PRECISION, data_scale SCALE, nullable 
FROM   user_tab_columns 
WHERE  table_name = UPPER('EMPLOYEES');

--4. Create a script that reports the column name, constraint name, constraint type, search 
--condition, and status for a specified table. You must join the USER_CONSTRAINTS and 
--USER_CONS_COLUMNS tables to obtain all this information. Prompt the user to enter the 
--table name. Save the script in a file named lab_12_04.sql.

SELECT ucc.column_name, uc.constraint_name, uc.constraint_type,    
uc.search_condition, uc.status 
FROM   user_constraints uc JOIN user_cons_columns ucc 
ON     uc.table_name = ucc.table_name 
AND    uc.constraint_name = ucc.constraint_name 
AND    uc.table_name = UPPER('EMPLOYEES');  










