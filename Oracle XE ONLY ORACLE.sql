DROP TABLE DEPT;
DROP TABLE EMP;
DROP TABLE HOSPITAL;
DROP TABLE SALA;
DROP TABLE DOCTOR;
DROP TABLE PLANTILLA;
DROP TABLE ENFERMO;
DROP TABLE OCUPACION;

CREATE TABLE DEPT
  (DEPT_NO NUMBER(9)
  ,DNOMBRE VARCHAR2(50)
  ,LOC VARCHAR2(50)
);

CREATE TABLE EMP
  (EMP_NO NUMBER(9)
  ,APELLIDO VARCHAR2(50)
  ,OFICIO VARCHAR2(50)
  ,DIR NUMBER(9)
  ,FECHA_ALT DATE
  ,SALARIO NUMBER(9)
  ,COMISION NUMBER(9)
  ,DEPT_NO NUMBER(9)
);

CREATE TABLE HOSPITAL(
  HOSPITAL_COD NUMBER(9)
  ,NOMBRE VARCHAR2(50)
  ,DIRECCION VARCHAR2(100),
  TELEFONO VARCHAR2(9),
  NUM_CAMA NUMBER(9)
);

CREATE TABLE SALA(
  HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,NOMBRE VARCHAR2(60)
  ,NUM_CAMA NUMBER(9)
);

CREATE TABLE DOCTOR(
  HOSPITAL_COD NUMBER(9)
  ,DOCTOR_NO NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,ESPECIALIDAD VARCHAR2(60),
  SALARIO NUMBER(9)
);

CREATE TABLE PLANTILLA(
  HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,EMPLEADO_NO NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,FUNCION VARCHAR2(60)
  ,TURNO VARCHAR2(1)
  ,SALARIO NUMBER(9)
);

CREATE TABLE ENFERMO(
  INSCRIPCION NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,DIRECCION VARCHAR2(100)
  ,FECHA_NAC DATE
  ,SEXO VARCHAR2(1)
  ,NSS NUMBER(9)
);

CREATE TABLE OCUPACION(
  INSCRIPCION NUMBER(9)
  ,HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,CAMA NUMBER(9)
);

insert into hospital values(19,'provincial','o donell 50','964-4264',502);
insert into hospital values(18,'general','Atocha s/n','595-3111',987);
insert into hospital values(22,'la paz','castellana 1000','923-5411',412);
insert into hospital values(45,'san carlos','ciudad universitaria','597-1500',845);
insert into hospital values(17,'ruber','juan bravo 49','914027100',217);
/
insert into sala values(19,3,'cuidados intensivos',21);
insert into sala values(19,6,'psiquiatria',67);
insert into sala values(18,3,'cuidados intensivos',10);
insert into sala values(18,4,'cardiologia',53);
insert into sala values(22,1,'recuperacion',10);
insert into sala values(22,6,'psiquiatria',118);
insert into sala values(22,2,'maternidad',34);
insert into sala values(45,4,'cardiologia',55);
insert into sala values(45,1,'recuperacion',17);
insert into sala values(45,2,'maternidad',24);
insert into sala values(17,2,'maternidad',19);
insert into sala values(17,6,'psiquiatria',20);
insert into sala values(17,3,'cuidados intensivos',21);
/
insert into plantilla values(19,6,3754,'diaz b.','ENFERMERO','T',226200);
insert into plantilla values(19,6,3106,'hernandez j.','ENFERMERO','T',275500);
insert into plantilla values(18,4,6357,'karplus w.','INTERINO','T',337900);
insert into plantilla values(22,6,1009,'higueras d.','ENFERMERA','T',200500);
insert into plantilla values(22,6,8422,'bocina g.','ENFERMERO','M',163800);
insert into plantilla values(22,2,9901,'nuñez c.','INTERINO','M',221000);
insert into plantilla values(22,1,6065,'rivera g.','ENFERMERA','N',162600);
insert into plantilla values(22,1,7379,'carlos r.','ENFERMERA','T',211900);
insert into plantilla values(45,4,1280,'amigo r.','INTERINO','N',221000);
insert into plantilla values(45,1,8526,'frank h.','ENFERMERO','T',252200);
insert into plantilla values(17,2,8519,'chuko c.','ENFERMERO','T',252200);
insert into plantilla values(17,6,8520,'palomo c.','INTERINO','M',219210);
insert into plantilla values(17,6,8521,'cortes v.','ENFERMERA','N',221200);

/
insert into doctor values(19,435,'Lopez A.','Cardiologia',350000);
insert into doctor values(18,585,'Miller G.','Ginecologia',250000);
insert into doctor values(18,982,'Cajal R','Cardiologia',290000);
insert into doctor values(22,453,'Galo C.','Pediatria',250000);
insert into doctor values(22,398,'Best K.','Urologia',150000);
insert into doctor values(22,386,'Cabeza D.','Psiquiatria',125000);
insert into doctor values(45,607,'Niqo P.','Pediatria',240000);
insert into doctor values(45,522,'Adams C.','Neurologia',450000);
insert into doctor values(17,521,'Nino P.','Neurologia',390000);
insert into doctor values(17,120,'Curro F.','Urologia',250000);
/
INSERT INTO ENFERMO VALUES(10995, 'Languia M.', 'Goya 20', TO_DATE('16-05-1956', 'DD-MM-YYYY'), 'M', 280862482);
INSERT INTO ENFERMO VALUES(18004, 'Serrano V.', 'Alcala 12', TO_DATE('21-05-1960', 'DD-MM-YYYY'), 'F', 284991452);
INSERT INTO ENFERMO VALUES(14024, 'Fernandez N.', 'Recoletos 5', TO_DATE('23-07-1967', 'DD-MM-YYYY'), 'F', 321790059);
INSERT INTO ENFERMO VALUES(36658, 'Domin S.', 'Mayor 71', TO_DATE('01-01-1942', 'DD-MM-YYYY'), 'M', 160657471);
INSERT INTO ENFERMO VALUES(38702, 'Neal R.', 'Orense 21', TO_DATE('18-07-1940', 'DD-MM-YYYY'), 'F', 380010217);
INSERT INTO ENFERMO VALUES(39217, 'Cervantes M.', 'Perón 38', TO_DATE('29-02-1952', 'DD-MM-YYYY'), 'M', 440294390);
INSERT INTO ENFERMO VALUES(59076, 'Miller G.', 'Lopez de Hoyos 2', TO_DATE('16-09-1945', 'DD-MM-YYYY'), 'F', 311969044);
INSERT INTO ENFERMO VALUES(63827, 'Ruiz P.', 'Esquerdo 103', TO_DATE('26-12-1980', 'DD-MM-YYYY'), 'M', 200973253);
INSERT INTO ENFERMO VALUES(64882, 'Fraser A.', 'Soto 3', TO_DATE('10-07-1980', 'DD-MM-YYYY'), 'F', 285201776);
INSERT INTO ENFERMO VALUES(74835, 'Benitez E.', 'Argentina 5', TO_DATE('05-10-1956', 'DD-MM-YYYY'), 'M', 154811767);
/
INSERT INTO OCUPACION VALUES(10995,19,6,1);
INSERT INTO OCUPACION VALUES(18004,19,3,2);
INSERT INTO OCUPACION VALUES(14024,19,6,3);
INSERT INTO OCUPACION VALUES(36658,18,4,1);
INSERT INTO OCUPACION VALUES(38702,18,4,2);
INSERT INTO OCUPACION VALUES(39217,22,1,1);
INSERT INTO OCUPACION VALUES(59076,22,6,2);
INSERT INTO OCUPACION VALUES(63827,22,6,3);
INSERT INTO OCUPACION VALUES(64882,22,2,1);
/
insert into dept values(10,'CONTABILIDAD','SEVILLA');
insert into dept values(20,'INVESTIGACIÓN','MADRID');
insert into dept values(30,'VENTAS','BARCELONA');
insert into dept values(40,'PRODUCCIÓN','GRANADA');
/
INSERT INTO emp VALUES('7839', 'rey', 'PRESIDENTE', NULL, TO_DATE('17-11-2005', 'DD-MM-YYYY'), 650000, NULL, 10);
INSERT INTO emp VALUES('7698', 'negro', 'DIRECTOR', 7839, TO_DATE('01-05-2005', 'DD-MM-YYYY'), 370500, 0, 30);
INSERT INTO emp VALUES('7566', 'jimenez', 'DIRECTOR', 7839, TO_DATE('02-04-2005', 'DD-MM-YYYY'), 386750, 0, 20);
INSERT INTO emp VALUES('7782', 'cerezo', 'DIRECTOR', 7839, TO_DATE('09-06-2005', 'DD-MM-YYYY'), 318500, 0, 10);
INSERT INTO emp VALUES('7499', 'arroyo', 'VENDEDOR', 7698, TO_DATE('20-02-2004', 'DD-MM-YYYY'), 208000, 39000, 30);
INSERT INTO emp VALUES('7521', 'sala', 'VENDEDOR', 7698, TO_DATE('22-02-2005', 'DD-MM-YYYY'), 162500, 65000, 30);
INSERT INTO emp VALUES('7654', 'martin', 'VENDEDOR', 7698, TO_DATE('29-07-2005', 'DD-MM-YYYY'), 162500, 182000, 30);
INSERT INTO emp VALUES('7844', 'tovar', 'VENDEDOR', 7698, TO_DATE('08-07-2005', 'DD-MM-YYYY'), 195000, 0, 30);
INSERT INTO emp VALUES('7900', 'jimeno', 'EMPLEADO', 7698, TO_DATE('03-12-2005', 'DD-MM-YYYY'), 123500, 0, 30);
INSERT INTO emp VALUES('7902', 'fernandez', 'ANALISTA', 7566, TO_DATE('03-12-2007', 'DD-MM-YYYY'), 390000, 0, 20);
INSERT INTO emp VALUES('7788', 'gil', 'ANALISTA', 7566, TO_DATE('09-11-2008', 'DD-MM-YYYY'), 390000, 0, 20);
INSERT INTO emp VALUES('7369', 'sanchez', 'EMPLEADO', 7902, TO_DATE('17-12-2004', 'DD-MM-YYYY'), 104000, 0, 20);
INSERT INTO emp VALUES('7876', 'alonso', 'EMPLEADO', 7788, TO_DATE('23-07-2005', 'DD-MM-YYYY'), 143000, 0, 20);
INSERT INTO emp VALUES('7934', 'muñoz', 'EMPLEADO', 7782, TO_DATE('23-01-2006', 'DD-MM-YYYY'), 169000, 0, 10);
INSERT INTO emp VALUES('7919', 'serra', 'DIRECTOR', 7839, TO_DATE('11-12-2008', 'DD-MM-YYYY'), 395000, 0, 20);
INSERT INTO emp VALUES('7907', 'campayo', 'ANALISTA', 7919, TO_DATE('04-06-2009', 'DD-MM-YYYY'), 251000, 25000, 20);
INSERT INTO emp VALUES('7917', 'nino', 'VENDEDOR', 7919, TO_DATE('06-02-2004', 'DD-MM-YYYY'), 171000, 0, 20);
INSERT INTO emp VALUES('7904', 'ford', 'EMPLEADO', 7907, TO_DATE('04-04-2004', 'DD-MM-YYYY'), 162500, 0, 20);
INSERT INTO emp VALUES('7914', 'gutierrez', 'ANALISTA', 7919, TO_DATE('20-10-2006', 'DD-MM-YYYY'), 258500, 50000, 20);
commit;
select * from dept;
--insert ANSI SQL (menos rapido)
insert into dept values((select max(dept_no)+1 from dept), 'INTO','INTO');
insert into dept values((select max(dept_no)+1 from dept), 'INTO2','INTO2');
insert into dept values((select max(dept_no)+1 from dept), 'INTO3','INTO3');

select * from dual;

insert all
    into dept values (50, 'ORACLE', 'BERNABEU')
    into dept values (60, 'I+D', 'OVIEDO')
select * from dual;

rollback;

insert all
    into dept values ((select max(dept_no)+1 from dept), 'ALL', 'ALL')
    into dept values ((select max(dept_no)+1 from dept), 'ALL2', 'ALL2')
    into dept values ((select max(dept_no)+1 from dept), 'ALL3', 'ALL3')
select * from dual;

rollback;

--create table

describe dept;

create table departamentos
as
select * from dept;

describe departamentos;

select * from departamentos;

create table doctoreshospital
as
select doctor.doctor_no as iddoctor
, doctor.apellido, hospital.nombre, hospital.telefono
from doctor
inner join hospital
on doctor.hospital_cod=hospital.hospital_cod;

select * from doctoreshospital;

--*********************insert into select*********************

--copiar datos de una tabla origen a una tabla destino
--la tabla de estar creada
--ambas tablas deben tener la misma estructura 

--copiamos la tabla dept dentro de la tabla departamentos

insert into departamentos
select * from dept;

select * from departamentos;

--*********variables de sustitución***********

--con & (ampersant)
select * from emp;

select apellido, oficio, salario, comision from emp
where emp_no=&numero;

select apellido, oficio, salario, comision from emp
where apellido='&ape';

select apellido, oficio, salario, comision from emp
where &condicion;

select apellido, &&campo, salario, comision, dept_no
from emp
where &campo1='&dato';
rollback;

--natural join

select apellido, oficio, dnombre, loc, dept_no from emp natural join dept;

select * from emp 
natural join dept
natural join hospital;

select apellido, loc, dnombre from emp inner join dept
using (dept_no);


--Relaciones jerarquicas entre elemntos de una tabla

--rey, eljefe de la empresa, es el 7869
-- mostar todos los empleados q trabajan directamente para rey

select * from emp where dir=7839;

---necesito saber los empleados que trabajan para negro

select * from emp where dir=7698;

--mostar los empleados subordinados a partir del director jimenez, en las dos direcciones

select level as NIVEL, apellido, dir, oficio from emp
connect by emp_no= prior dir
start with apellido='jimenez' order by 1;

select level as NIVEL, apellido, dir, oficio from emp
connect by prior emp_no=dir
start with apellido='jimenez' order by 1;

--presentar las relaciones del trabajador arroyo

 select level, apellido, oficio from emp
 connect by emp_no=prior dir
 start with apellido='arroyo';
 
select level, apellido, oficio from emp
connect by prior emp_no= dir
start with apellido='arroyo';

select level as NIVEL, apellido, dir, oficio, sys_connect_by_path (apellido, '/') as relacion
from emp
connect by prior emp_no=dir
start with APELLIDO='jimenez' order by 1;

select * from plantilla where turno ='T'
INTERSECT
select * from plantilla where funcion='ENFERMERA';


--concepto y creacion de tablas

--02-04-2025

create table prueba(
  identificador integer,
  texto10 varchar2(10),
  textochar char(5)
);

describe prueba

insert into prueba values (1, 'sdfghjkln', 'aeiou');
insert into prueba values (1, 'a','a');
insert into prueba values(1,'a','kjhgfdsarty');
select * from PRUEBA;

--no carga la fila 3 arriba p q no cumple la condicion: char (5)

drop table prueba;

describe prueba;

delete from prueba;

--la tabla prueba contien un registro y
--agregam0os una nueva columna de texto llamada nueva

alter table prueba
add (NUEVA varchar2 (3));

--agregamos otra columna de tipo texto llamada SINNULOS
--y no adminitira nulos

alter table prueba
add(SINNULOS varchar2(7) not null);

alter table prueba
drop column sinnulos;

select * from prueba;

--modificar un tipo de dato alter/modify

alter table prueba
modify (nueva float);

--modificar el nombre de la tabla RENAME

rename prueba to prueva;

rename prueva to prueba;

truncate table prueba;

describe prueba;

--comentar tablas

comment on table prueba
is 'Hoy es miércoles y mañana jueves';

--leer comentarios

select * from user_tab_comments where table_name='PRUEBA';

select * from all_tab_comments where table_name='PRUEBA';

--SABER TODAS LAS TABLAS DE UN USUARIO
--las de user: system son:

select * from user_tables;
select * from all_tables;

-- mostrar solamente lo que yo he creado

select distinct object_type from user_objects;

--objetos propiedad del usuario system

select * from cat;


--restricciones

--añadimos una nueva columna llamada TEST

alter table prueba
add (test int);
select * from prueba;

--añadimos columna con valores por defecto

alter table prueba
add (defecto int default -1);

insert into PRUEBA
(identificador, texto10, textochar, defecto)
VALUES(2, 'AA', 'AA');

insert into PRUEBA
(identificador, texto10, textochar, defecto)
VALUES(3, 'BB', 'BB', 22);



DROP TABLE DEPT;
DROP TABLE EMP;
DROP TABLE HOSPITAL;
DROP TABLE SALA;
DROP TABLE DOCTOR;
DROP TABLE PLANTILLA;
DROP TABLE ENFERMO;
DROP TABLE OCUPACION;

CREATE TABLE DEPT
  (DEPT_NO NUMBER(9)
  ,DNOMBRE VARCHAR2(50)
  ,LOC VARCHAR2(50)
);

CREATE TABLE EMP
  (EMP_NO NUMBER(9)
  ,APELLIDO VARCHAR2(50)
  ,OFICIO VARCHAR2(50)
  ,DIR NUMBER(9)
  ,FECHA_ALT DATE
  ,SALARIO NUMBER(9)
  ,COMISION NUMBER(9)
  ,DEPT_NO NUMBER(9)
);

CREATE TABLE HOSPITAL(
  HOSPITAL_COD NUMBER(9)
  ,NOMBRE VARCHAR2(50)
  ,DIRECCION VARCHAR2(100),
  TELEFONO VARCHAR2(9),
  NUM_CAMA NUMBER(9)
);

CREATE TABLE SALA(
  HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,NOMBRE VARCHAR2(60)
  ,NUM_CAMA NUMBER(9)
);

CREATE TABLE DOCTOR(
  HOSPITAL_COD NUMBER(9)
  ,DOCTOR_NO NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,ESPECIALIDAD VARCHAR2(60),
  SALARIO NUMBER(9)
);

CREATE TABLE PLANTILLA(
  HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,EMPLEADO_NO NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,FUNCION VARCHAR2(60)
  ,TURNO VARCHAR2(1)
  ,SALARIO NUMBER(9)
);

CREATE TABLE ENFERMO(
  INSCRIPCION NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,DIRECCION VARCHAR2(100)
  ,FECHA_NAC DATE
  ,SEXO VARCHAR2(1)
  ,NSS NUMBER(9)
);

CREATE TABLE OCUPACION(
  INSCRIPCION NUMBER(9)
  ,HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,CAMA NUMBER(9)
);

insert into hospital values(19,'provincial','o donell 50','964-4264',502);
insert into hospital values(18,'general','Atocha s/n','595-3111',987);
insert into hospital values(22,'la paz','castellana 1000','923-5411',412);
insert into hospital values(45,'san carlos','ciudad universitaria','597-1500',845);
insert into hospital values(17,'ruber','juan bravo 49','914027100',217);
/
insert into sala values(19,3,'cuidados intensivos',21);
insert into sala values(19,6,'psiquiatria',67);
insert into sala values(18,3,'cuidados intensivos',10);
insert into sala values(18,4,'cardiologia',53);
insert into sala values(22,1,'recuperacion',10);
insert into sala values(22,6,'psiquiatria',118);
insert into sala values(22,2,'maternidad',34);
insert into sala values(45,4,'cardiologia',55);
insert into sala values(45,1,'recuperacion',17);
insert into sala values(45,2,'maternidad',24);
insert into sala values(17,2,'maternidad',19);
insert into sala values(17,6,'psiquiatria',20);
insert into sala values(17,3,'cuidados intensivos',21);
/
insert into plantilla values(19,6,3754,'diaz b.','ENFERMERO','T',226200);
insert into plantilla values(19,6,3106,'hernandez j.','ENFERMERO','T',275500);
insert into plantilla values(18,4,6357,'karplus w.','INTERINO','T',337900);
insert into plantilla values(22,6,1009,'higueras d.','ENFERMERA','T',200500);
insert into plantilla values(22,6,8422,'bocina g.','ENFERMERO','M',163800);
insert into plantilla values(22,2,9901,'nuñez c.','INTERINO','M',221000);
insert into plantilla values(22,1,6065,'rivera g.','ENFERMERA','N',162600);
insert into plantilla values(22,1,7379,'carlos r.','ENFERMERA','T',211900);
insert into plantilla values(45,4,1280,'amigo r.','INTERINO','N',221000);
insert into plantilla values(45,1,8526,'frank h.','ENFERMERO','T',252200);
insert into plantilla values(17,2,8519,'chuko c.','ENFERMERO','T',252200);
insert into plantilla values(17,6,8520,'palomo c.','INTERINO','M',219210);
insert into plantilla values(17,6,8521,'cortes v.','ENFERMERA','N',221200);

/
insert into doctor values(19,435,'Lopez A.','Cardiologia',350000);
insert into doctor values(18,585,'Miller G.','Ginecologia',250000);
insert into doctor values(18,982,'Cajal R','Cardiologia',290000);
insert into doctor values(22,453,'Galo C.','Pediatria',250000);
insert into doctor values(22,398,'Best K.','Urologia',150000);
insert into doctor values(22,386,'Cabeza D.','Psiquiatria',125000);
insert into doctor values(45,607,'Niqo P.','Pediatria',240000);
insert into doctor values(45,522,'Adams C.','Neurologia',450000);
insert into doctor values(17,521,'Nino P.','Neurologia',390000);
insert into doctor values(17,120,'Curro F.','Urologia',250000);
/
INSERT INTO ENFERMO VALUES(10995, 'Languia M.', 'Goya 20', TO_DATE('16-05-1956', 'DD-MM-YYYY'), 'M', 280862482);
INSERT INTO ENFERMO VALUES(18004, 'Serrano V.', 'Alcala 12', TO_DATE('21-05-1960', 'DD-MM-YYYY'), 'F', 284991452);
INSERT INTO ENFERMO VALUES(14024, 'Fernandez N.', 'Recoletos 5', TO_DATE('23-07-1967', 'DD-MM-YYYY'), 'F', 321790059);
INSERT INTO ENFERMO VALUES(36658, 'Domin S.', 'Mayor 71', TO_DATE('01-01-1942', 'DD-MM-YYYY'), 'M', 160657471);
INSERT INTO ENFERMO VALUES(38702, 'Neal R.', 'Orense 21', TO_DATE('18-07-1940', 'DD-MM-YYYY'), 'F', 380010217);
INSERT INTO ENFERMO VALUES(39217, 'Cervantes M.', 'Perón 38', TO_DATE('29-02-1952', 'DD-MM-YYYY'), 'M', 440294390);
INSERT INTO ENFERMO VALUES(59076, 'Miller G.', 'Lopez de Hoyos 2', TO_DATE('16-09-1945', 'DD-MM-YYYY'), 'F', 311969044);
INSERT INTO ENFERMO VALUES(63827, 'Ruiz P.', 'Esquerdo 103', TO_DATE('26-12-1980', 'DD-MM-YYYY'), 'M', 200973253);
INSERT INTO ENFERMO VALUES(64882, 'Fraser A.', 'Soto 3', TO_DATE('10-07-1980', 'DD-MM-YYYY'), 'F', 285201776);
INSERT INTO ENFERMO VALUES(74835, 'Benitez E.', 'Argentina 5', TO_DATE('05-10-1956', 'DD-MM-YYYY'), 'M', 154811767);
/
INSERT INTO OCUPACION VALUES(10995,19,6,1);
INSERT INTO OCUPACION VALUES(18004,19,3,2);
INSERT INTO OCUPACION VALUES(14024,19,6,3);
INSERT INTO OCUPACION VALUES(36658,18,4,1);
INSERT INTO OCUPACION VALUES(38702,18,4,2);
INSERT INTO OCUPACION VALUES(39217,22,1,1);
INSERT INTO OCUPACION VALUES(59076,22,6,2);
INSERT INTO OCUPACION VALUES(63827,22,6,3);
INSERT INTO OCUPACION VALUES(64882,22,2,1);
/
insert into dept values(10,'CONTABILIDAD','SEVILLA');
insert into dept values(20,'INVESTIGACIÓN','MADRID');
insert into dept values(30,'VENTAS','BARCELONA');
insert into dept values(40,'PRODUCCIÓN','GRANADA');
/
INSERT INTO emp VALUES('7839', 'rey', 'PRESIDENTE', NULL, TO_DATE('17-11-2005', 'DD-MM-YYYY'), 650000, NULL, 10);
INSERT INTO emp VALUES('7698', 'negro', 'DIRECTOR', 7839, TO_DATE('01-05-2005', 'DD-MM-YYYY'), 370500, 0, 30);
INSERT INTO emp VALUES('7566', 'jimenez', 'DIRECTOR', 7839, TO_DATE('02-04-2005', 'DD-MM-YYYY'), 386750, 0, 20);
INSERT INTO emp VALUES('7782', 'cerezo', 'DIRECTOR', 7839, TO_DATE('09-06-2005', 'DD-MM-YYYY'), 318500, 0, 10);
INSERT INTO emp VALUES('7499', 'arroyo', 'VENDEDOR', 7698, TO_DATE('20-02-2004', 'DD-MM-YYYY'), 208000, 39000, 30);
INSERT INTO emp VALUES('7521', 'sala', 'VENDEDOR', 7698, TO_DATE('22-02-2005', 'DD-MM-YYYY'), 162500, 65000, 30);
INSERT INTO emp VALUES('7654', 'martin', 'VENDEDOR', 7698, TO_DATE('29-07-2005', 'DD-MM-YYYY'), 162500, 182000, 30);
INSERT INTO emp VALUES('7844', 'tovar', 'VENDEDOR', 7698, TO_DATE('08-07-2005', 'DD-MM-YYYY'), 195000, 0, 30);
INSERT INTO emp VALUES('7900', 'jimeno', 'EMPLEADO', 7698, TO_DATE('03-12-2005', 'DD-MM-YYYY'), 123500, 0, 30);
INSERT INTO emp VALUES('7902', 'fernandez', 'ANALISTA', 7566, TO_DATE('03-12-2007', 'DD-MM-YYYY'), 390000, 0, 20);
INSERT INTO emp VALUES('7788', 'gil', 'ANALISTA', 7566, TO_DATE('09-11-2008', 'DD-MM-YYYY'), 390000, 0, 20);
INSERT INTO emp VALUES('7369', 'sanchez', 'EMPLEADO', 7902, TO_DATE('17-12-2004', 'DD-MM-YYYY'), 104000, 0, 20);
INSERT INTO emp VALUES('7876', 'alonso', 'EMPLEADO', 7788, TO_DATE('23-07-2005', 'DD-MM-YYYY'), 143000, 0, 20);
INSERT INTO emp VALUES('7934', 'muñoz', 'EMPLEADO', 7782, TO_DATE('23-01-2006', 'DD-MM-YYYY'), 169000, 0, 10);
INSERT INTO emp VALUES('7919', 'serra', 'DIRECTOR', 7839, TO_DATE('11-12-2008', 'DD-MM-YYYY'), 395000, 0, 20);
INSERT INTO emp VALUES('7907', 'campayo', 'ANALISTA', 7919, TO_DATE('04-06-2009', 'DD-MM-YYYY'), 251000, 25000, 20);
INSERT INTO emp VALUES('7917', 'nino', 'VENDEDOR', 7919, TO_DATE('06-02-2004', 'DD-MM-YYYY'), 171000, 0, 20);
INSERT INTO emp VALUES('7904', 'ford', 'EMPLEADO', 7907, TO_DATE('04-04-2004', 'DD-MM-YYYY'), 162500, 0, 20);
INSERT INTO emp VALUES('7914', 'gutierrez', 'ANALISTA', 7919, TO_DATE('20-10-2006', 'DD-MM-YYYY'), 258500, 50000, 20);
commit;


select * from emp;

--incluímos una restricccion primary key en el campo
--dept_no de departamentos para que no pueda admitir nulos

alter table dept
add constraint pk_dept
primary key (dept_no);

--todas la resticcciones se encuenttra en el diccionario
--user_constraints

select * from user_constraints;

--intentamos insertar un departamento repetido

insert into dept values(10, 'REPE', 'REPE');

select * from dept;

--eliminamos la resticcion de primary key de departamentos

alter table dept
drop constraint pk_dept;

DELETE FROM dept WHERE dept_no=10;
rollback;


------------------EMPLEADOS-------------------------------------
--creamos una primary key para el campo emp_no

alter table emp
add constraint pk_emp
primary key (emp_no);

select * from emp;

--creamos una restriccion para que el salario siempre sea positivo
--sería una restricción check

alter table emp
add constraint ch_emp_salario_positivo
check (salario >= 0);

--insertamos un empleado en negativo

update emp set salario = -1 where emp_no=7782;

--eliminamos la resticción

alter table emp drop constraint ch_emp_salario_positivo;
rollback;


--ahora si permite ingresar un salario negativo, y,
-- cuando queremos reaccitvar la restricción, no permite si no
-- eliminamos antes el negativo


----en la tabla enfermo

select * from enfermo;

alter table enfermo
add constraint pk_enfermo
primary key (inscripcion);

--unique para el dato de la segurdad social

alter table enfermo
add constraint u_enfermo_nss
unique (nss);

--no podemos repetir PK
insert into enfermo VALUES
(10995, 'Nuevo', 'Calle nueva', '01/01/2000', 'F', '123');
--no podemos repetir unique
insert into enfermo VALUES
(10999, 'Nuevo', 'Calle nueva', '01/01/2000', 'F', '123');

--¿nulos en PK? >>>>>>NO!!!!!!

--¿nulos en UNIQUE? >>>>>>SI!!!!!!
describe enfermo;

insert into enfermo VALUES
(12346, 'Nuevo', 'Calle nueva', '01/01/2000', 'F', null);

select * from enfermo;

rollback;

--eliminamos las dos restricciones anteriores

alter table enfermo
drop constraint pk_enfermo;

alter table enfermo
drop constraint u_enfermo_nss;

--crear primary key de dos columnas

alter table enfermo
add constraint pk_enfermo
primary key (inscripcion, nss);

--intentamos insertar un registro con mismo inscripción y nss >>> y no se puede

insert into enfermo VALUES
(10995, 'Nuevo', 'Calle nueva', '01/01/2000', 'F', 280862482);

--lo intentamos con otra inscripción y sí lo permite

insert into enfermo VALUES
(88999, 'Nuevo', 'Calle nueva', '01/01/2000', 'F', 280862482);

--la foreighn key apunta a la tabla donde hay "muchos"
--ej de un empleado (tabla emp) a un departamento (tabla dept) (donde hay muchos empleados)
--apunta a departamento

--otro ej: de clientes apunta a pedidos

alter table dept
add constraint pk_dept
primary key (dept_no);

insert into dept values (10, 'CONTABILIDAD', 'ELCHE');

--hacemos la restricción
alter table emp
add constraint fk_emp_dept
foreign key (dept_no)
references dept (dept_no);

--para comprobarlo insertamos un empleado en un departamento que no existe

insert into emp values (111, 'nuevo', 'empleado', 7902, '02/04/2025', 1, 1, 50);

insert into emp values (111, 'nulo', 'empleado', 7902, '02/04/2025', 1, 1, null);

select * from emp;
select * from dept;

--acepta nulos, por eso se deben impedir los nulos cuando se estructura la tabla

rollback;

--NO HACERLO; NO HACERLO; NO HACERLO

--vamos a probar la eliminación en cascada

delete from dept where dept_no=10;

alter table emp
add constraint fk_emp_dept
foreign key (dept_no)
references dept (dept_no)
on delete cascade;

alter table emp
drop constraint fk_emp_dept;

rollback;


03/04/2025
------******SECUENCIAS******

create sequence seq_dept
increment by 10
start with 40;

drop sequence seq_dept;

--una secuencia no se pueden alterar, solo eliminar y volvewr a crear

select seq_dept.nextval as siguiente from dual;

--no podemos acceder a currval hasta que no hayamos ejecutado nextval

select seq_dept.nextval as actual from dual;

--si lo queremos para insert debemos llamarlo de forma explícita

insert into dept values (seq_dept.nextval, 'nuevo', 'nuevo');

select * from dept order by 1;

--otro ejemplo
create sequence seq_test
increment by 11
start with 121;

drop sequence seq_test;

select seq_test.nextval as siguiente from dual;
select seq_test.currval as actual from dual;

--el primer valor de la secuencia será SIEMPRE el de start with

--OJO, una secuencia se puede insertar en múltiples tablas, pero,
--como no se puede modificar, insertará siempre el next elemento

----------------------------------
--------ejercicio
---incluir en la base de datos:

--1.- incluir clave primaria en hospital

alter table hospital
add constraint pk_hospital
primary key (hospital_cod);

select * from hospital;

select * from user_constraints order by 4;

--2.- incluir clave prmaria en doctor

alter table doctor
add constraint pk_doctor
primary key (doctor_no);

select * from doctor;

--3.- relacionar doctores con hospitales

alter table doctor
add constraint fk_doctor_hospital
foreign key (hospital_cod)
references hospital (hospital_cod);

--4.- las personas de la plantilla solamente pueden trabajar en turnos 
--mañana, tarde o noche (M, T, N)

alter table plantilla
add constraint chk_plantilla_turno
check (turno in ('M', 'T', 'N'));

alter table plantilla
drop constraint chk_plantilla_turno;

select * from plantilla;




--****martes 08/04/2025*******

--FUNCIONES DE STRING.... funciones de cadena

select * from emp where lower(oficio)='analista';

update emp set oficio='analiSTA' where emp_no=7902;

--estamos poniendo valores estáticos: 'analista'
--también podríamos iincluir cvalores dinámicos, por lo que tendriámos que
--cpnvertr las dos comparaciones
select * from emp where upper(oficio)=upper('&dato');

--en oracle tenemos la posibilida de concatenar textos en 
--una sola columna (campo calculado)
--se utiliza el símbolo || para concatenar
--queremos mostrar ejn una sola columna el apellido y oficio de los empleados 

select apellido|| oficio as descripcion from emp;

select apellido|| '  ' || oficio as descripcion from emp;

--la funcion initcap muestra cada palabra de una frase con la primera letra en mayúsculas

select INITCAP (oficio) as INICT from emp;

select initcap(apellido|| '  ' || oficio) as descripcion from emp;

select concat('Nuestro empleado es: ', apellido) as resultado from emp;

--SUBSTR..... sub string.... SUB CADENA...

SELECT SUBSTR('FLORERO', 1, 4)AS DATO FROM DUAL;

SELECT SUBSTR('FLORERO', 2, 4)AS DATO FROM DUAL;

SELECT SUBSTR('FLORERO', 4)AS DATO FROM DUAL;

SELECT SUBSTR('FLORERO', 2, 40)AS DATO FROM DUAL;

--mostrar los empleados cuyos apellidos comienzan con S

select * from emp where apellido like 's%';

select substr (apellido, 1, 1) as UNAletra from emp;

select * from emp where substr(apellido, 1, 1)='s';

--es más eficiente usar la linea substr que like

--length devuelve el número de posiciones de una expresion

select length('libro') as longitud from dual;

--mostar los empleados cuyo apellido sea de 4 letras

select * from emp where apellido like '____';

select * from emp where length(apellido)=4;

--instr permite buscar un texto dentro de una cadena de caracteres y devuelve su posición....

select instr ('benito', 'n') as posicion from dual;

select instr ('benito', 'nip') as posicion from dual;
--si devuelve CER es que no la encuentra

select instr ('oracle mola', 'l') as posicion from dual;
--si hay dos sólo devuelve la primera que encuentra

select instr ('oracle mola', 'm') as posicion from dual;
--el espacio lo cuenta como un caracter

--si, por ejemplo, deseamos validar un mail
select * from dual where instr ('m@ail', '@') >0;

--L o R PAD incluye caracteres
select lpad (dept_no, 5, '$') from emp;

select rpad (dept_no, 5, '$') from emp;


--FUNCIONES NUMÉRICAS

--round

select round(45.923548) as redondeo from dual;
--46

select round(45.323548) as redondeo from dual;
--45

--indicando 2 decimadles

select round(45.923548, 2) as redondeo from dual;
--45.92

select round(45.929548, 2) as redondeo from dual;
--45.93

--TRUNC (corta, pero no redondea)

select trunc(45.923548) as redondeo from dual;
--45

select trunc(45.323548) as redondeo from dual;
--45

select trunc(45.923548, 2) as redondeo from dual;
--45.92

select trunc(45.929548, 2) as redondeo from dual;
--45.92

--MOD(n,m)
--devuelve el resto de la división ebntre dos números
--averiguar si número es par
select mod(99,2)as resto from dual;
--1, 99 no es divisible entre dos, por lo que su restop es 1

select mod(8,2)as resto from dual;
--0, 8 sí es divisible entre dos, por lo que su resto es 1

--empleados copn salario par
select * from emp where mod(salario, 2)=0;
-- son todos pares

--incluimos números impares
update emp set salario = salario + 1 where dept_no=20;

select * from emp where mod(salario, 2)=0;
--9 impares

--FUNCIONES DE FECHAS

--TENEMOS UNA FUNCION PARA AVERIGUR LA FECHA DEL SERVIDOR

--SYSDATE

select sysdate as fecha_actual from dual;

--opera con fechas

select sysdate + 10 as fecha from dual;

select sysdate + 30 as fecha from dual;

select sysdate + 365 as fecha from dual;

select sysdate -365 as fecha from dual;

--months_between
--mostar cuantos meses llevan los empleados dados de alta en la empresa

select apellido, months_between(sysdate, fecha_alt) as meses from emp;

--add_month
--agregamos a la fecha actual 5 meses
select add_months(sysdate, 5) as dentro5 from dual;

--next_day
--mostar cuando es el próximo .lunes

select next_day(sysdate, 'monday') as proximo_lunes from dual;

--last_day devuelve el último día del mes

select last_day(sysdate) as fin_mes from dual;

--round (fecha, formato)

--empleados redondeados al mes
select apellido, fecha_alt, round(fecha_alt, 'MM') as roundmes from emp;

--redondeados al año
select apellido, fecha_alt, round(fecha_alt, 'YYYY') as roundyear from emp;

--TRUNC 
--recorta la fecha la fecha sin redondear

select apellido, fecha_alt, trunc(fecha_alt, 'MM') as truncmes from emp;
--TODOS los trunca (redondea) a la baja

select apellido, fecha_alt, trunc(fecha_alt, 'YYYY') as truncyear from emp;
--TODOS los trunca (redondea) a la baja

--FUNCIONES de CONVERSIÓN
--conversión de fechas

select apellido, fecha_alt, to_char (fecha_alt, 'mm-dd-yyyy') as formato from emp;

select apellido, fecha_alt, to_char (fecha_alt, 'mm@dd@yyyy') as formato from emp;

select apellido, fecha_alt, to_char (fecha_alt, 'dd*mm*yyyy') as formato from emp;

select apellido, fecha_alt, to_char (fecha_alt, 'day-mm-dd-yyyy') as formato from emp;
--thursday -11-17-2005

--conversión de números

select to_char(7458, '0000L') as zero from dual;
--7458$

select to_char(7458, 'L0000') as zero from dual;
--          $7458

select to_char (sysdate, 'hh24:mi:ss') as hora_sistema from dual;
--17:45:27

--si se desea incluir TEXTOS dentro de los formatos se incluyen
-- con comllas " " dentro de las comillas ' '

select to_char(sysdate, '"Hoy es " DD') as formato from dual;
--Hoy es  08

select to_char(sysdate, '"Hoy es " DD " de " month') as formato from dual;
--Hoy es  08  de  april    

select to_char(sysdate, '"Hoy es " DD " de " month', 'nls_date_languaje=french') as formato from dual;


--funciones de conversión
select '08/04/2025' as fecha from dual;
--NO permite operar con fechas

select to_date('08/04/2025') as fecha from dual;
--SI permite operar con fechas

select to_date('08/04/2025') + 2 as fecha from dual;
--2025-04-10T00:00

select '12' + 2 as resultado from dual;
--NO permite operar

select to_number('12') + 2 as resultado from dual;
--SI permite operar con fechas

--NVL sirve para evitar los nulos y sustituirlos
--si encuentra un nulo, lo sustituye, sino, muestra el valor

--ejemplo: mostar apellido, salario y comisión de todos los empleados

select apellido, salario, comision from emp;

--podemos indicar que, en lugar de poner null, escriba otro valor
--el valor debe ser correspondiente al tipo de dato de la columna

select apellido, salario, nvl(comision, -1) as comision from emp;

select apellido, salario + comision as total from emp;
--el salario de rey da NULL

select apellido, salario + nvl(comision, 0) as total from emp;
--el salario de rey da 650000


--DECODE

--mostar el turno en palabra ('mañana', 'tarde', 'noche') de la plantilla
select apellido, turno from plantilla;

--ojo, DECODE se escribe en parejas.... 
select apellido, decode(TURNO, 'M', 'MAÑANA', 'N', 'NOCHE') as turno from plantilla;

--ojo, el último, si no se nombra en par, equivale a un ELSE
select apellido, decode(TURNO, 'M', 'MAÑANA', 'N', 'NOCHE', 'TARDE') as turno from plantilla;


--FUNCIONES ANIDADAS
 
--ejemplo, se quiere saber la fecha del próximommiercoles que juega el Madrid

select next_day(sysdate, 'wednesday') as champions from dual;
--2025-04-09T18:22:30

--quiero ver la fecha completa que no me entero

select to_char(
  next_day(sysdate + 2, 'wednesday'),
  '"el dia" day dd " juega el Madrid"') as champions from dual;

--el dia wednesday 16  juega el Madrid

--*******09/04/2025*********





