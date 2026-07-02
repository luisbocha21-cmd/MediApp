import 'package:flutter/material.dart';

class HomeDoctor extends StatelessWidget {
  const HomeDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Bienvenido Doctor",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Ver citas del día"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Historial de pacientes"),
            ),
          ],
        ),
      ),
    );
  }
}