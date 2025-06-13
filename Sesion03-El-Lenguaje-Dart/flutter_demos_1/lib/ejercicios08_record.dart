void main() {
  //-- Records
  var producto1 = (1, 'Celular iPhone 15 Pro Max 256GB', 4480.55, true);
  var producto2 = (2, 'Celular Honor Magic7 Lite 512GB', 2180.55, false);
  //-- Agregar a un arreglo
  var listaProductos = [producto1, producto2];
  //-- Imprimir los records
  print(producto1);
  print(
    "ID: ${producto1.$1}, Nombre: ${producto1.$2}, Precio: ${producto1.$3}, Stock: ${producto1.$4}",
  );
  //-- Records con parametros nombrados
  var producto1n = (
    id: 1,
    nombre: 'Celular iPhone 15 Pro Max 256GB',
    precio: 4480.55,
    stock: true,
  );
  var producto2n = (
    id: 2,
    name: 'Celular Honor Magic7 Lite 512GB',
    price: 2180.55,
    stock: false,
  );
  print(producto1n);
  print(
    "ID: ${producto1n.id}, Nombre: ${producto1n.nombre}, Precio: ${producto1n.precio}, Stock: ${producto1n.stock}",
  );
}
