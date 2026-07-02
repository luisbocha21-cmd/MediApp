import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/appointment_model.dart';

class AppointmentService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addAppointment(AppointmentModel appointment) async {
    await _db
        .collection('citas')
        .doc(appointment.id)
        .set(appointment.toMap());
  }

  Stream<List<AppointmentModel>> getAppointments() {
    return _db.collection('citas').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AppointmentModel.fromMap(doc.data());
      }).toList();
    });
  }

  Future<void> aprobarCita(String id) async {
    await _db.collection('citas').doc(id).update({
      'estado': 'Aprobada',
    });
  }

  Future<void> cancelarCita(String id) async {
    await _db.collection('citas').doc(id).update({
      'estado': 'Cancelada',
    });
  }
}