mixin Ciudadano {

  String dni = "";
  String nacionalidad = "";

  void init(String otroDni, String otraNacionalidad) {
    dni = otroDni;
    nacionalidad = otraNacionalidad;
  }

  void imprimirCiudadania() {
    print('DNI: $dni, Nacionalidad: $nacionalidad');
  }

}