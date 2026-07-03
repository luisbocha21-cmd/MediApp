import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String?> login(String email, String password) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      DocumentSnapshot doc =
          await _db.collection('usuarios').doc(cred.user!.uid).get();

      if (doc.exists) {
        return doc['rol'];
      }

      return null;
    } catch (e) {
      return null;
    }
  }
  String? getCurrentUserId() {
  return _auth.currentUser?.uid;
}

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<List<String>> getDoctors() async {
    QuerySnapshot datos = await _db
        .collection('usuarios')
        .where('rol', isEqualTo: 'doctor')
        .get();

    return datos.docs
        .map((e) => e['nombre'].toString())
        .toList();
  }
}