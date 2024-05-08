import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'login.dart';


class LogOutPage extends StatelessWidget {
  LogOutPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate directly to the Login widget
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login())
            );
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}


