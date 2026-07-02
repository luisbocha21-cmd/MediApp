class AppointmentModel {
  final String id;
  final String pacienteId;
  final String doctorId;
  final DateTime fecha;
  final String estado;

  AppointmentModel({
    required this.id,
    required this.pacienteId,
    required this.doctorId,
    required this.fecha,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pacienteId': pacienteId,
      'doctorId': doctorId,
      'fecha': fecha.toIso8601String(),
      'estado': estado,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'],
      pacienteId: map['pacienteId'],
      doctorId: map['doctorId'],
      fecha: DateTime.parse(map['fecha']),
      estado: map['estado'],
    );
  }
}