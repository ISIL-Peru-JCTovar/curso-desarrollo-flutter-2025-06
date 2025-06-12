void main() {
  try {
    int resultado1 = 10 ~/ 0;
    String alumno = 'Juan Perez';
    int suma = 5 + 6;
  } on UnsupportedError {
    print('Se ha producido un error general: Division incorrecta'); //-- Se envia por Widget el mensaje
  } catch (e, s) {
    print('Se ha producido un error general: Error desconocido'); //-- Se envia por Widget el mensaje
    print('Error tecnico basico: $e');  //-- Se guarda en un log, o se envia por API
    print('Error tecnico detallado: $s');  //-- Se guarda en un log, o se envia por API
  } finally {
    print('Este bloque se debe utilizar para cerrar recursos (ej. conexiones a bases de datos, conexiones a APIs, uso de recursos del dispositivo, etc.)');
  }
}
