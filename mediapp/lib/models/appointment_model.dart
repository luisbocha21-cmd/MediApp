class AppointmentModel {

  final String id;
  final String paciente;
  final String doctor;
  final DateTime fecha;
  final String estado;

  AppointmentModel({
    required this.id,
    required this.paciente,
    required this.doctor,
    required this.fecha,
    required this.estado,
  });

}