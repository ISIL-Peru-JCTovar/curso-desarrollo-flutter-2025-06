class Client {

  final int? id;
  final String name;
  final String nationality;
  final String email;
  final String phone;
  final String linkedin;
  final String facebook;
  final String? photoPath;
  final bool wantsNotifications;

  Client({
    this.id,
    required this.name,
    required this.nationality,
    required this.email,
    required this.phone,
    required this.linkedin,
    required this.facebook,
    this.photoPath,
    required this.wantsNotifications,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nationality': nationality,
      'email': email,
      'phone': phone,
      'linkedin': linkedin,
      'facebook': facebook,
      'photo': photoPath,
      'wantsNotifications': wantsNotifications ? 1 : 0,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['_id'],
      name: map['nombre'],
      nationality: map['nacionalidad'],
      email: map['correo'],
      phone: map['celular'],
      linkedin: map['linkedin'],
      facebook: map['facebook'],
      photoPath: map['foto'],
      wantsNotifications: map['boletin'] == 1,
    );
  }
  
}
