void main() {
  //-- if-else
  int edad = 15;
  if (edad >= 18) {
    print('Mayor de edad: ${edad}');
  } else if (edad > 13) {
    print('Menor de edad (adolescente): ${edad}');
  } else {
    print('Menor de edad (niño(a)): ${edad}');
  }
  //-- switch
  int diaSemana = 6;
  switch(diaSemana) {
    case 1: print('Lunes');
    case 2: print('Martes');
    case 3: print('Miercoles');
    case 4: print('Jueves');
    case 5: print('Viernes');
    case 6: print('Sabado');
    case 7: print('Domingo');
    default: print('NO EXISTE');
  }
  //-- Bucle for clasico
  List<String> listaAlumnos = [ 'Juan Jose', 'Edward Raul', 'Fernando Salomon', 'Mauricio', 'Adalberto', 'Liliana', 'Heidi' ];
  for (var idx = 0; idx < listaAlumnos.length; idx++) {
    String alumno = listaAlumnos[idx];
    print('Alumno(a) en bucle for clasico: $alumno');
  }
  //-- Bucle for en recorrido de coleccion (List, Set, Map)
  for (var alumno in listaAlumnos) {
    print('Alumno(a) en bucle for de coleccion: $alumno');
  }
  //-- forEach
  listaAlumnos.forEach((alumno) {
    print('Alumno(a) en bucle forEach interno: $alumno');
  });
  //Bucle while y do-while
  //-- while:    Primero pregunta, luego ejecuta, si no cumple a la primera, nunca se ejecutará
  //-- do-while: Primero ejecuta (la primera vez), luego pregunta, si no cumple ya no ejecuta, pero al menos una vez SI.
  var contador = 0;
  while (contador < listaAlumnos.length) {
    String alumno = listaAlumnos[contador];
    print('Alumno(a) en bucle while: $alumno');
    if (contador == 3) break;
    contador++;
  }
  contador = 0;
  do {
    if (contador < 3) {
      contador++;
      continue;
    }
    String alumno = listaAlumnos[contador];
    print('Alumno(a) en bucle do-while: $alumno');
    contador++;
  } while (contador < listaAlumnos.length);
}

