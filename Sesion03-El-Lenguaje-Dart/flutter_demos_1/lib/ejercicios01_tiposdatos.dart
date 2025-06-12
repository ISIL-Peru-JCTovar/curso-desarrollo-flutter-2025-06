void main() {
  //int, double, String, bool
  //-- ** Tipos de datos inferidos
  var nombre = 'Juan Jose';
  var edad = 29;
  //-- ** Tipos de datos basicos
  String apellidos = 'Leon Suyon';
  print('Mi nombre 1 es: $nombre');
  print('Mi apellido 1 es: $apellidos');
  nombre = 'Edward Raul';
  apellidos = 'Espinoza Fernandez';
  print('Mi nombre 2 es: $nombre');
  print('Mi apellido 2 es: $apellidos');
  //-- ** Tipo final, no se puede cambiar el valor de la variable
  final String pais = 'Peru';
  print(Alumno.nacionalidad);
  //-- ** Tipo de dato const vs final
  final String pronosticoGoles1;  //-- Opcional
  const String pronosticoGoles2 = '10'; //-- Obligatorio
  pronosticoGoles1 = '15';
  //pronosticoGoles1 = '20';
  //-- ** Tipo de dato late (implicito)
  late final String ganador = 'Peru';
  print('El ganador es: $ganador');
  //-- ** NullSafety
  String curso1 = 'Desarrollo de Aplicaciones con Flutter';
  //curso1 = null;  //-- No se permite porque no es tipado NULL
  print('La longitud de la cadena curso1 es: ${curso1.length}');
  String? curso2;
  curso2 = null;
  //print('La longitud de la cadena curso2 es: ${curso2?.length}');
  print('La longitud de la cadena curso2 es: ${curso2?.length ?? 0}');
  curso2 = 'Desarrollo con Android';
  //print('La longitud de la cadena curso2 es: ${curso2?.length}');
  print('La longitud de la cadena curso2 es: ${curso2?.length ?? 0}');
  //-- ** dynamic
  dynamic valor = 'Peru ira al mundial pero del 2030'; //-- String
  print(valor);
  valor = 2030;  //-- int
  print(valor);
  valor = [ 'Papas', 'Arroz', 'Zanahoria' ]; //-- List
  print(valor);
}

class Alumno {
  
  static const String nacionalidad = 'Peruano';
  
}