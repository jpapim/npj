import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
import 'forget_password.dart';

// ignore: use_key_in_widget_constructors
class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _registerUser(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      if (e is FirebaseAuthException && e.code.toString() == 'auth/email-already-exists') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Email Already Registered'),
              content: const Text('The email address is already registered. You can reset your password if needed.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // ignore: avoid_print
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _registerUser(context),
              child: const Text('Register'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text('Already have an account? Login here'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
                );
              },
              child: const Text('Forgot your password?'),
            ),
          ],
        ),
      ),
    );
  }
}
