select *
from productos
left outer join detalleventas
on productos.idProductos = detalleventas.Productos_idProductos
where Productos_idProductos is null