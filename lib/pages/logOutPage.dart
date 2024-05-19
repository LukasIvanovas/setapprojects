import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'login.dart';


class LogOutPage extends StatelessWidget {
  LogOutPage({super.key});

  void toLogout (BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Login())
    );
  }


  @override

  void initState() {}
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => toLogout(context));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        
      ),
    );
  }
}



