USE n1_exercici1_optica;

SELECT c.cliente_id, c.nombre, v.venta_id, m.nombre as marca, g.precio
FROM venta v
	JOIN cliente c USING(cliente_id)
    JOIN gafas g ON v.gafas_gafas_id = g.gafas_id
    JOIN marca m USING(marca_id)
WHERE v.cliente_id = 3;

SELECT e.nombre as empleado, CONCAT('MO-', g.marca_id, g.gafas_id, g.montura) AS modelo
FROM venta v
	JOIN empleado e USING(empleado_id)
    JOIN gafas g ON v.gafas_gafas_id = g.gafas_id
WHERE v.empleado_id = 1;

SELECT p.nombre, COuNT(*)
FROM venta v
	JOIN gafas g ON v.gafas_gafas_id = g.gafas_id
    JOIN marca USING(marca_id)
    JOIN proveedor p USING(proveedor_id)
GROUP BY proveedor_id