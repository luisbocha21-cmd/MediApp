class UserModel {
  final String id;
  final String nombre;
  final String correo;
  final String rol;

  UserModel({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.rol,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'correo': correo,
      'rol': rol,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nombre: map['nombre'],
      correo: map['correo'],
      rol: map['rol'],
    );
  }
}