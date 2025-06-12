void main() {
  //-- Funcion clasica - Simple
  int resultado1 = sumar(10, 13);
  print('sumar(10, 13): $resultado1');
  //-- Funcion clasica - Con parametros opcionales
  int resultado2a = sumarMasNumeros(10, 13);
  print('sumarMasNumeros(10, 13): $resultado2a');
  int resultado2b = sumarMasNumeros(10, 13, 17);
  print('sumarMasNumeros(10, 13, 17): $resultado2b');
  //-- Funcion clasica - Con parametros predeterminados
  int resultado3a = restar(100, 20);
  print('restar(100, 20): $resultado3a');
  int resultado3b = restar(100, 20, 10);
  print('restar(100, 20, 10): $resultado3b');
  //-- Funcion clasica - Con parametros nombrados
  double resultado4a = division(dividendo: 80, divisor: 8);
  print('division(dividendo: 80, divisor: 8): $resultado4a');
  double resultado4b = division(divisor: 8, dividendo: 80);
  print('division(divisor: 8, dividendo: 80): $resultado4b');
  //-- Funciones de una sola expresion
  int resultado5 = sumarAbreviado(18, 12);
  print('sumarAbreviado(18, 12): $resultado5');
  //-- Funciones con array como parametros
  int resultado6 = sumarLista([ 10, 20, 30, 40]);
  print('sumarLista([ 10, 20, 30, 40]): $resultado6');
}

//-- Funcion clasica - Simple
int sumar(int a, int b) {
  return (a + b);
}

//-- Funcion clasica - Con parametros opcionales
int sumarMasNumeros(int a, int b, [int? c]) {
  return (a + b + (c ?? 0));
}

//-- Funcion clasica - Con parametros predeterminados
int restar(int minuendo, int sustraendo1, [int sustraendo2 = 0]) {
  return (minuendo - sustraendo1 - sustraendo2);
}

//-- Funcion clasica - Con parametros nombrados
double division({required int dividendo, required int divisor}) {
  return (dividendo / divisor);
}

//-- Funciones de una sola expresion
int sumarAbreviado(int a, int b) => (a + b);

//-- Funciones con array como parametros
int sumarLista(List<int> lista) {
  int suma = 0;
  for (int ele in lista) {
    suma += ele;
  }
  return suma;
}
