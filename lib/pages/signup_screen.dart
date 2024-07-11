import 'login_screen.dart';
import 'package:sample/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



// Signup Screen
class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/insta_login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.abc, size: 100),
                Text('Register Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32)),
                const SizedBox(height: 50),
                _email(),
                const SizedBox(height: 20),
                _password(),
                const SizedBox(height: 20),
                _signupButton(context),
                const SizedBox(height: 20),
                _alreadyHaveAnAccount(context),
              ],
            ),
          )
          ),
        ),

    );
  }

  // Email input
  Widget _email() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        filled: true,
        fillColor: Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Password input
  Widget _password() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        filled: true,
        fillColor: Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,

        ),
      ),
    );

  }


  // Signup button
  Widget _signupButton(BuildContext context) {

    return ElevatedButton(
      onPressed: () async {
        await AuthService().signup(
            email: _emailController.text,
            password: _passwordController.text,
            context: context);
      },
      child: const Text("Sign Up", style: TextStyle( fontSize: 14)),
    );
  }

  // Already have an account link
  Widget _alreadyHaveAnAccount(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Text(
        "I already have an account",
        style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
