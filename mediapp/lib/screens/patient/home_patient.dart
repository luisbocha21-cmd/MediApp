import 'package:flutter/material.dart';
import '../appointment/create_appointment.dart';
import '../appointment/appointment_list.dart';
class HomePatient extends StatelessWidget {
  const HomePatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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