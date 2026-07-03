import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../models/appointment_model.dart';
import '../../services/appointment_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAppointment extends StatefulWidget {
  const CreateAppointment({super.key});

  @override
  State<CreateAppointment> createState() => _CreateAppointmentState();
}

class _CreateAppointmentState extends State<CreateAppointment> {

  final AuthService authService = AuthService();

String? doctorSeleccionado;
DateTime? fechaSeleccionada;

  final AppointmentService service = AppointmentService();

  Future<void> guardar() async {
    if (doctorSeleccionado == null || fechaSeleccionada == null) {

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Debe seleccionar un doctor y una fecha"),
    ),
  );

  return;

}
    final usuario = await FirebaseFirestore.instance
    .collection("usuarios")
    .doc(authService.getCurrentUserId())
    .get();

final nombrePaciente = usuario["nombre"];

    final cita = AppointmentModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      pacienteId: authService.getCurrentUserId() ?? "",
      doctorId: doctorSeleccionado ?? "",
      fecha: fechaSeleccionada ?? DateTime.now(),
      estado: "Pendiente",
      pacienteNombre: nombrePaciente,
    );

    await service.addAppointment(cita);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cita registrada correctamente"),
      ),
    );

    setState(() {
  doctorSeleccionado = null;
});

  }
  Future<void> seleccionarFecha() async {

  final DateTime? fecha = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  );

  if (fecha != null) {
    setState(() {
      fechaSeleccionada = fecha;
    });
  }

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Nueva cita"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

FutureBuilder<List<String>>(
  future: authService.getDoctors(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return const CircularProgressIndicator();
    }

    final doctores = snapshot.data!;

    return DropdownButtonFormField<String>(
      value: doctorSeleccionado,
      decoration: const InputDecoration(
        labelText: "Seleccione un doctor",
      ),
      items: doctores.map((doctor) {
        return DropdownMenuItem(
          value: doctor,
          child: Text(doctor),
        );
      }).toList(),
      onChanged: (valor) {
        setState(() {
          doctorSeleccionado = valor;
        });
      },
    );
  },
),
const SizedBox(height: 20),

ElevatedButton(
  onPressed: seleccionarFecha,
  child: Text(
    fechaSeleccionada == null
        ? "Seleccionar fecha"
        : "${fechaSeleccionada!.day}/${fechaSeleccionada!.month}/${fechaSeleccionada!.year}",
  ),
),

const SizedBox(height: 20),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: guardar,
              child: const Text("Guardar cita"),
            ),

          ],

        ),
      ),
    );
  }
}