import 'package:flutter/material.dart';

class HomeDoctor extends StatelessWidget {
  const HomeDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor"),
      ),
      body: const Center(
        child: Text(
          "Bienvenido Doctor",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}