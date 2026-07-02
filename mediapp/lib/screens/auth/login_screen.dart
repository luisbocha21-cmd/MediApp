import 'package:flutter/material.dart';

import '../doctor/home_doctor.dart';
import '../patient/home_patient.dart';
import '../secretary/home_secretary.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {

    String email = emailController.text.trim();

    if (email == "paciente@gmail.com") {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePatient(),
        ),
      );

    } else if (email == "doctor@gmail.com") {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeDoctor(),
        ),
      );

    } else if (email == "secretaria@gmail.com") {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeSecretary(),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuario no encontrado"),
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("MediApp"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Correo",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: login,
              child: const Text("Ingresar"),
            ),

          ],

        ),
      ),
    );
  }
}