import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://cdn3.iconfinder.com/data/icons/network-and-communications-6/130/291-128.png",
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8),
              Text(
                "Planify",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xff3a57e8),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: TextField(
                  controller: TextEditingController(),
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00f2f2f3),
                    isDense: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),

              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: TextField(
                  controller: TextEditingController(),
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Name",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00f2f2f3),
                    isDense: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),

              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: TextField(
                  controller: TextEditingController(),
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Security Question 1: What was your childhood home street address?",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00f2f2f3),
                    isDense: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),

              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: TextField(
                  controller: TextEditingController(),
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Security Question 2: What is your mother's name?",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00f2f2f3),
                    isDense: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
                child: MaterialButton(
                  onPressed: () {
                    // Add your reset password logic here
                  },
                  color: Color(0xff3a57e8),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xffffffff),
                  height: 40,
                  minWidth: 140,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
