import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/forget_password/forget_password.dart';

import 'login_button.dart';
import '../widgets/input_field.dart';
import '../widgets/welcome_text.dart';
import '../widgets/bottom_text.dart';
import '../signup/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email, password;

  getEmail(email) {
    setState(() {
      this.email = email;
    });
  }

  getPassword(password) {
    setState(() {
      this.password = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Log In",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Welcome(),
            Text(
              "Please sign in to continue",
              style: TextStyle(
                color: Color(0xff696969),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            InputField(false, "EMAIL", 60.0, callback: getEmail,),
            SizedBox(
              height: 20.0,
            ),
            InputField(true, "PASSWORD", 60.0, callback: getPassword,),
            LoginButton(this.email, this.password),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()),
                );
              },
              child: Center(
                child: Text("Forget password?",
                  style: TextStyle(
                    color: Color(0xff6cbbc7),
                    fontWeight: FontWeight.bold,
                  ),


                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: BottomText(msg: "Don't have an account?", link: "Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
