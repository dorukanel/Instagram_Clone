import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signup({required String email, required String password, required BuildContext context}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      print("Signed up user: ${user?.uid}");
      // Optionally navigate to the home screen after successful signup
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } catch (e) {
      print(e.toString());
      // Handle errors here, e.g., show a dialog or a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to sign up: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
