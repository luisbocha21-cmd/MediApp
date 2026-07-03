import 'package:flutter/material.dart';
import '../appointment/create_appointment.dart';
import '../appointment/appointment_list.dart';
import '../../services/auth_service.dart';
class HomePatient extends StatelessWidget {
  HomePatient({super.key});

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
        title: const Text("Paciente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Bienvenido Paciente",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
  onPressed: () {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CreateAppointment(),
      ),
    );

  },
  child: const Text("Solicitar cita"),
),

           ElevatedButton(
  onPressed: () {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AppointmentList(),
      ),
    );

  },
  child: const Text("Ver mis citas"),
),
          ],
        ),
      ),
    );
  }
}