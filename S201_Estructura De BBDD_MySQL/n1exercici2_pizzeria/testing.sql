-- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.

SELECT SUM(dp.cantidad) AS 'Nombre de begudes venudes'
FROM detalle_pedido dp
	JOIN pedido pe USING(pedido_id)
    JOIN producto pr USING(producto_id)
    JOIN tienda t USING(tienda_id)
WHERE pr.tipo = 'bebida' AND t.localidad_id = 1;

-- Llista quantes comandes ha efectuat un determinat empleat/da.
    
SELECT t.nombre, t.puesto, COUNT(*) AS 'nº pedidos'
FROM pedido p
	JOIN trabajador t USING(trabajador_id)
GROUP BY t.nombre, t.puesto, t.trabajador_id
HAVING t.trabajador_id = 2;

