// lib/screens/auth/login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/auth/signup_screen.dart';
import 'package:flutter_application_2/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.rocket_launch, size: 100, color: Colors.indigo),
                const SizedBox(height: 20),
                const Text(
                  "LifeGenie",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // --- START OF THE FIX ---

                    // 1. Get the text from the controllers
                    final String username = usernameController.text.trim();
                    final String password = passwordController.text.trim();

                    // 2. Check if either field is empty
                    if (username.isNotEmpty && password.isNotEmpty) {
                      // If both fields are filled, navigate to the home screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(username: username),
                        ),
                      );
                    } else {
                      // If any field is empty, show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter both username and password."),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                    
                    // --- END OF THE FIX ---
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignupScreen()),
                    );
                  },
                  child: const Text("Don't have an account? Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}