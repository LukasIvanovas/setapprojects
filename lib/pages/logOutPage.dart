import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

class LogOutPage extends StatelessWidget {
  LogOutPage({super.key});

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
            NavigatorState navigator = Navigator.of(context);
            await _authService.signOut();
            navigator.pushReplacementNamed('../beforeLogin/login.dart');
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
 /// not sure what works i do apologise

