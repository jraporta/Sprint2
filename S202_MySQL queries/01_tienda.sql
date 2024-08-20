SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.11 FROM producto;
SELECT nombre AS 'nom de producto', precio AS euros, precio * 1.11 AS dòlars FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, SUBSTRING(nombre, 1 , 2) FROM fabricante;
SELECT nombre, ROUND(precio, 0) FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
SELECT f.codigo FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT DISTINCT f.codigo FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT nombre FROM fabricante ORDER BY nombre desc;
SELECT nombre, precio FROM producto ORDER BY nombre, precio desc;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 4, 2;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio LIMIT 1;
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'lenovo';
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'cucial' AND p.precio > 200;
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'asus' OR f.nombre = 'hewlett-packard' OR f.nombre = 'seagate';
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('asus', 'hewlett-packard', 'seagate');
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE('%e');
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE('%w%');







