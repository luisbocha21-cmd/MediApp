import 'package:flutter/material.dart';
import '../../models/appointment_model.dart';
import '../../services/appointment_service.dart';

class HomeSecretary extends StatefulWidget {
  const HomeSecretary({super.key});

  @override
  State<HomeSecretary> createState() => _HomeSecretaryState();
}

class _HomeSecretaryState extends State<HomeSecretary> {
  final AppointmentService service = AppointmentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secretaria"),
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

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(cita.doctorId),
                  subtitle: Text(cita.estado),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.check, color: Colors.green),
                        onPressed: () async {
                          await service.aprobarCita(cita.id);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () async {
                          await service.cancelarCita(cita.id);
                        },
                      ),
                    ],
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