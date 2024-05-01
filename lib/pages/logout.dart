import "package:flutter/material.dart";

class LogOut extends StatelessWidget {
  const LogOut({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Log Out',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
/// this is code that im am not sure if it will work

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
   LogOut({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _authService.signOut();
            // Navigate to the login screen or any other screen after logout
            Navigator.pushReplacementNamed(context, '/login'); // Replace with your login route
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
 /// not sure what works i do apologise

import { getAuth, signOut } from "firebase/auth";

const auth = getAuth();
signOut(auth).then(() => {
  // Sign-out successful.
}).catch((error) => {
  // An error happened.
});
