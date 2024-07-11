import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore için gereken import

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firestore instance'ı

  Future<void> signup({
    required String email,
    required String password,
    required String firstName, // İsim için ek parametre
    required String lastName,  // Soyisim için ek parametre
    required String phoneNumber, // Telefon numarası için ek parametre
    required BuildContext context,
    required Function onSuccess,
    required Function onError
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null) {
        // Kullanıcı kaydı başarılıysa Firestore'a kullanıcı bilgilerini kaydet
        await _firestore.collection('users').doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber
        });

        onSuccess(); // Kayıt başarılı callback'ini çağır
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to sign up: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
      onError(e.toString()); // Hata durumunda hata callback'ini çağır
    }
  }
}
