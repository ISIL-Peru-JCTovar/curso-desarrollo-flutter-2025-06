import 'package:flutter_demos_1/Ciudadano.dart';
import 'package:flutter_demos_1/Persona.dart';

class Alumno extends Persona with Ciudadano {
  
  //-- Atributos
  String _nombres;
  String _apellidos;
  int edad;
  String correo;
  
  String get nombres => _nombres;
  
  set nombres(String otroNombre) {
    if (otroNombre.isNotEmpty) {
      _nombres = otroNombre;
    }
  }

  String get apellidos => _apellidos;

  set apellidos(String otroApellido) {
    if (otroApellido.isNotEmpty) {
      _apellidos = otroApellido;
    }
  }
  
  //-- Constructor
  Alumno(this._nombres, this._apellidos, [this.edad = 0,  this.correo = '-', String fechaNacimiento = ''])
        : super(fechaNacimiento);
  //Alumno({ required _nombres, required this.apellidos, this.edad = 0,  this.correo = '-' });
  
  //-- Metodos
  void mostrarDatos() {
    imprimirDatos();
    imprimirCiudadania();
    print("Nombres: $_nombres, Apellidos: $_apellidos, Edad: $edad, Correo: $correo");
  }
  
}
