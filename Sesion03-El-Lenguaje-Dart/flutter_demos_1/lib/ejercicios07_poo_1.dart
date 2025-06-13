import 'package:flutter_demos_1/Alumno.dart';

void main() {
  Alumno alumno1 = Alumno('Juan Jose', 'Leon Suyon', 35, 'jleons@isil.pe', '05/06/2005');
  alumno1.init("10000000", "Peruano");
  alumno1.mostrarDatos();
  Alumno alumno2 = Alumno('Edward', 'Espinoza');
  alumno2.init("10000020", "Argentino");
  alumno2.mostrarDatos();
  print('Nombre es: ${alumno2.nombres} y Apellido es: ${alumno2.apellidos}');
  alumno2.nombres = 'Edward Raul';
  print('Nombre es: ${alumno2.nombres} y Apellido es: ${alumno2.apellidos}');
  //Alumno alumno3 = Alumno(nombres: 'Fernando', apellidos: 'Santa Cruz');
  //alumno3.mostrarDatos();
}

