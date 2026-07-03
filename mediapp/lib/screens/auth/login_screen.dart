import '../../services/auth_service.dart';
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
  final AuthService authService = AuthService();

Future<void> login() async {

  final rol = await authService.login(
    emailController.text,
    passwordController.text,
  );

  if (rol == "paciente") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>  HomePatient(),
      ),
    );
    return;
  }

  if (rol == "doctor") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomeDoctor(),
      ),
    );
    return;
  }

  if (rol == "secretaria") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>  HomeSecretary(),
      ),
    );
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Correo o contraseña incorrectos"),
    ),
  );
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