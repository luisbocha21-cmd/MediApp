import 'package:flutter/material.dart';

class HomeSecretary extends StatelessWidget {
  const HomeSecretary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secretaria"),
      ),
      body: const Center(
        child: Text(
          "Bienvenido Secretaria",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}