import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // Kullanıcı null ise, hemen döndür
      return null;
    }

    try {
      DocumentSnapshot snapshot = await _firestore.collection('users').doc(currentUser.uid).get();
      return snapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    // Çıkış işleminden sonra LoginScreen'e yönlendirme
    Navigator.of(context).pushReplacementNamed('/'); // LoginScreen path
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        //automaticallyImplyLeading: false, // Geri gitme butonunu kaldırır
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error fetching user data"));
          }
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text('First Name'),
                        subtitle: Text(snapshot.data?['firstName'] ?? 'Not available'),
                      ),
                      ListTile(
                        title: Text('Last Name'),
                        subtitle: Text(snapshot.data?['lastName'] ?? 'Not available'),
                      ),
                      ListTile(
                        title: Text('Phone Number'),
                        subtitle: Text(snapshot.data?['phoneNumber'] ?? 'Not available'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _signOut,
                    child: Text('Log Off', style: TextStyle(fontSize: 16)),

                  ),
                )
              ],
            );
          }
          return Center(child: Text("No user data found or user not logged in"));
        },
      ),
    );
  }
}
