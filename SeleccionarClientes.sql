SELECT idVentas, FechaVenta, MontoVenta, idClientes, NombresCliente, ApellidosCliente,
	CantidadProducto as Cantidad, idProductos, DescripcionProducto, ClaveProducto
FROM ventas v
INNER JOIN clientes c
ON v.Clientes_idClientes = c.idClientes
INNER JOIN detalleventas as dv
ON v.idVentas = dv.Ventas_idVentas
INNER JOIN productos p
ON dv.Productos_idProductos = p.idProductos
WHERE idVentas = 2