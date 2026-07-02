class AuthService {

  String? login(String email, String password) {

    email = email.trim().toLowerCase();

    if (email == "paciente@gmail.com") {
      return "paciente";
    }

    if (email == "doctor@gmail.com") {
      return "doctor";
    }

    if (email == "secretaria@gmail.com") {
      return "secretaria";
    }

    return null;

  }
  List<String> getDoctors() {
  return [
    "Dr. Carlos Pérez",
    "Dra. Ana Gómez",
    "Dr. Luis Fernández",
    "Dra. María Suárez",
  ];
}

}