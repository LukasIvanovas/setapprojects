import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user_repository.dart';
import 'user_model.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';
import 'main.dart';

class ChangePassword extends StatefulWidget {

  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  @override
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();

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
            'Enter Your Current Password And Your New Password',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            controller: oldPassword,
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
              hintText: 'Current Password',
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            controller: newPassword,
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
              hintText: 'New Password',
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 20),
        MaterialButton(
          onPressed: () async {
            if (_validatePassword(newPassword.text)) {
              if (userPass == oldPassword.text) {
                await UserRepository.instance.idUpdatePassword(userDocumentId, newPassword.text);
                _showSuccessDialog(context);
              } else {
                _showIncorrectInfoDialog(context);
              }
            } else {
              // Show password requirements error message
              _showPasswordRequirementsDialog(context);
            }
          },
          color: const Color.fromARGB(255, 95, 118, 230),
          child: const Text('Reset Password'),
        ),
      ]),
    );
  }
}

bool _validatePassword(String password) {
  if (password.length < 8) return false;
  if (!password.contains(RegExp(r'[0-9]'))) return false;
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
  return true;
}

void _showPasswordRequirementsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Password Requirements"),
        content: Text(
            "Password must be at least 8 characters long and contain at least one number and one symbol."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Success"),
        content: Text("Password changed successfully!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

void _showIncorrectInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Incorrect Information"),
        content: Text(
            "The information given is incorrect."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
