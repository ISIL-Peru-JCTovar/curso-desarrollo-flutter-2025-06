import 'dart:collection';

void main() {

  //-- List
  //-- a. Lista ordenada.
  //-- b. Lista que permite duplicados.
  //var listaAlumnos = [ 'Juan Jose', 'Edward Raul', 'Fernando Salomon', 'Mauricio' ];
  List<String> listaAlumnos = [ 'Juan Jose', 'Edward Raul', 'Fernando Salomon', 'Mauricio' ];
  listaAlumnos.add('Diego');
  print(listaAlumnos);
  listaAlumnos.add('Mauricio');
  print(listaAlumnos);
  print(listaAlumnos[2]); //-- Fernando Salomon
  
  //-- Map
  //-- a. Listas de tipo clave-valor.
  //-- b. La clave es unica, no se puede repetir.
  //-- c. Listas desordenadas
  Map<String, String> listaCursos = {
    '01': 'Desarrollo de Aplicaciones Empresariales con Flutter',
    '02': 'Desarrollo Nativo con Android',
    '03': 'Desarrollo con Swift y XCode'
  };
  print(listaCursos);
  print('El curso que estamos llevando hoy en ISIL es: ${listaCursos['01']}');
  
  //-- Set (HashSet, LinkedHashSet, SplayTreeSet)
  //-- a. Lista que NO permite duplicados.
  //-- b. Lista desordenada (a veces).
  //-- HashSet es desordenado
  HashSet<String> setAlumnos1 = HashSet<String>.from({ 'Juan Jose', 'Edward Raul', 'Fernando Salomon', 'Mauricio', 'Maria', 'Pepe', 'Alonso', 'Vidaurre', 'Diangelo' });
  //-- Set ordenado, por defecto es un LinkedHashSet, que si es ordenado, pero a un mayor costo de recursos
  var setAlumnos2a = { 'Juan Jose', 'Edward Raul', 'Fernando Salomon', 'Mauricio', 'Maria', 'Pepe', 'Alonso', 'Vidaurre', 'Diangelo' };
  LinkedHashSet<String> setAlumnos2b = LinkedHashSet<String>.from({ 'Juan Jose', 'Edward Raul', 'Fernando Salomon', 'Mauricio', 'Maria', 'Pepe', 'Alonso', 'Vidaurre', 'Diangelo' });
  /*
  print(setAlumnos1);
  setAlumnos1.add('Diego');
  print(setAlumnos1);
  setAlumnos1.add('Mauricio'); //-- Lo ignora, no se agrega
  print(setAlumnos1);
  print(setAlumnos1.toList()[3]); //-- Mauricio?
  */
  print(setAlumnos2a);

}