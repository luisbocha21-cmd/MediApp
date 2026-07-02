import 'package:flutter/material.dart';

import '../../models/appointment_model.dart';
import '../../services/appointment_service.dart';

class AppointmentList extends StatelessWidget {
  AppointmentList({super.key});

  final AppointmentService service = AppointmentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis citas"),
      ),
      body: StreamBuilder<List<AppointmentModel>>(
        stream: service.getAppointments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          final citas = snapshot.data ?? [];

          if (citas.isEmpty) {
            return const Center(
              child: Text("No hay citas registradas"),
            );
          }

          return ListView.builder(
            itemCount: citas.length,
            itemBuilder: (context, index) {
              final cita = citas[index];

              return ListTile(
                leading: const Icon(Icons.medical_services),
                title: Text(cita.doctorId),
                subtitle: Text(cita.estado),
              );
            },
          );
        },
      ),
    );
  }
}