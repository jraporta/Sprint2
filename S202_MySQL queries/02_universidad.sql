SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE('%k');
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre as departamento FROM (SELECT * FROM persona WHERE tipo = 'profesor') p JOIN profesor prof ON p.id = prof.id_profesor JOIN departamento d ON prof.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM (SELECT id FROM persona WHERE nif = '26902806M') alumno JOIN alumno_se_matricula_asignatura asma ON alumno.id = asma.id_alumno JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id JOIN asignatura a ON asma.id_asignatura = a.id;
SELECT DISTINCT d.nombre FROM (SELECT id FROM grado WHERE nombre = 'Grado en Ingeniería Informática (Plan 2015)') grado_ii JOIN asignatura a ON grado_ii.id = a.id_grado JOIN profesor p USING(id_profesor) JOIN departamento d ON p.id_departamento = d.id;
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE ce.anyo_inicio = '2018';
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM (SELECT * FROM persona WHERE tipo = 'profesor') p LEFT JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.apellido1, p.apellido2, p.nombre FROM (SELECT * FROM persona WHERE tipo = 'profesor') p LEFT JOIN profesor prof ON p.id = prof.id_profesor WHERE prof.id_departamento IS NULL;
SELECT d.nombre FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IS NULL;
SELECT p.apellido1, p.apellido2, p.nombre FROM (SELECT * FROM persona WHERE tipo = 'profesor') p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE a.id IS NULL;
SELECT nombre FROM asignatura WHERE id_profesor IS NULL;
SELECT d.nombre FROM alumno_se_matricula_asignatura asma JOIN asignatura a ON asma.id_asignatura = a.id JOIN profesor p ON a.id_profesor = p.id_profesor RIGHT JOIN departamento d ON p.id_departamento = d.id WHERE a.id IS NULL;
SELECT COUNT(*) AS n_alumnos FROM persona WHERE tipo = 'alumno' GROUP BY tipo;
SELECT COUNT(*) AS n_alumnos FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999 GROUP BY tipo, YEAR(fecha_nacimiento);
SELECT d.nombre, COUNT(*) as n_de_profesores FROM profesor p JOIN departamento d ON p.id_departamento = d.id GROUP BY d.nombre ORDER BY n_de_profesores DESC;
SELECT d.nombre, COUNT(p.id_profesor) as n_de_profesores FROM profesor p RIGHT JOIN departamento d ON p.id_departamento = d.id GROUP BY d.nombre ORDER BY n_de_profesores DESC;
SELECT g.nombre, COUNT(a.id) as n_de_asignaturas FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.nombre ORDER BY n_de_asignaturas DESC;
SELECT g.nombre, COUNT(a.id) as n_de_asignaturas FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.nombre  HAVING n_de_asignaturas > 40 ORDER BY n_de_asignaturas DESC;
SELECT g.nombre, a.tipo, SUM(a.creditos) as n_de_creditos FROM asignatura a JOIN grado g ON a.id_grado = g.id GROUP BY g.nombre, a.tipo ORDER BY g.nombre, a.tipo;
SELECT ce.anyo_inicio, COUNT(asma.id_alumno) as n_de_alumnos FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar GROUP BY ce.anyo_inicio;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS n_de_asignaturas FROM profesor pr RIGHT JOIN (SELECT * FROM persona WHERE tipo = 'profesor') p ON pr.id_profesor = p.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor GROUP BY p.id ORDER BY n_de_asignaturas desc;
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS n_de_asignaturas FROM (SELECT * FROM profesor prof JOIN persona pers ON prof.id_profesor = pers.id WHERE prof.id_departamento IS NOT NULL) AS p LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor GROUP BY p.id HAVING n_de_asignaturas = 0;
