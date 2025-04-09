--CONSULTAS CON FUNCIONES 

 --1.- Mostrar todos los apellidos de los empleados en Mayúsculas 
select * from emp;


 SELECT apellido,
    UPPER(apellido) as apellido_mayusculas
FROM emp;

--2.- Construir una consulta para que salga la fecha de hoy con el siguiente formato: 

--FECHA DE HOY 
-- con este formato: Martes 06 de Octubre de 2020 

select sysdate as fecha_actual from dual;

select to_char (sysdate, 'day DD" de "month" de "yyyy') as fecha_pedida from dual;
--wednesday 09 de april     de 2025

select to_char (sysdate, 'day DD" de "month" de "yyyy',
 'NLS_DATE_LANGUAGE=ITALIAN') as fecha_pedida from dual;
 --mercoledì 09 de aprile    de 2025

--3.-Queremos cambiar el departamento de Barcelona y llevarlo a Tabarnia. 
--Para ello tenemos que saber qué empleados cambiarían de localidad y cuáles no.   
--Combinar tablas y mostrar el nombre del departamento junto a los datos del empleado. 
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT DEPT.DNOMBRE, EMP.APELLIDO, DECODE(dept.loc, 'BARCELONA', 'CAMBIA A TABARNIA', 'NO CAMBIA')
AS TRASLADO 
FROM EMP INNER JOIN DEPT
ON EMP.DEPT_NO=DEPT.DEPT_NO;

--4.- Mirar la fecha de alta del presidente. Visualizar todos los empleados dados de alta 
--330 días antes que el presidente. 

SELECT apellido, fecha_alt from emp where fecha_alt < to_date (selec fecha_alt from emp where apellido='rey')-330);





