import 'package:flutter/material.dart';
import '../../models/appointment_model.dart';
import '../../services/appointment_service.dart';
import '../../services/auth_service.dart';

class HomeDoctor extends StatelessWidget {
  HomeDoctor({super.key});

  final AppointmentService service = AppointmentService();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
  IconButton(
    icon: const Icon(Icons.logout),
    onPressed: () async {
      await authService.logout();

      if (!context.mounted) return;

      Navigator.pop(context);
    },
  ),
],
        title: const Text("Doctor"),
      ),
      body: StreamBuilder<List<AppointmentModel>>(
        stream: service.getAppointments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final citas = snapshot.data!
              .where((c) => c.estado == "Aprobada")
              .toList();

          if (citas.isEmpty) {
            return const Center(
              child: Text("No hay citas aprobadas"),
            );
          }

          return ListView.builder(
            itemCount: citas.length,
            itemBuilder: (context, index) {
              final cita = citas[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(cita.doctorId),
                  subtitle: Text(
                    "${cita.pacienteId}\n${cita.estado}",
                  ),
                  isThreeLine: true,
                  trailing: ElevatedButton(
                    onPressed: () async {
                      await service.atenderCita(cita.id);
                    },
                    child: const Text("Atender"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}