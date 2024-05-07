import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    if (_emailController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Please enter your email'),
          );
        },
      );
      return;
    }

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Password reset link sent! Check your Email'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 95, 118, 230),
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Enter Your Email and we will send you a link to change your password',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff3a57e8)),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 95, 118, 230)),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Email',
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 20),
        MaterialButton(
          onPressed: passwordReset,
          color: const Color.fromARGB(255, 95, 118, 230),
          child: const Text('Reset Password'),
        ),
      ]),
    );
  }
}
