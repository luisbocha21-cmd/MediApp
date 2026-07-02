import 'package:flutter/material.dart';

class HomePatient extends StatelessWidget {
  const HomePatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paciente"),
      ),
      body: const Center(
        child: Text(
          "Bienvenido Paciente",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}