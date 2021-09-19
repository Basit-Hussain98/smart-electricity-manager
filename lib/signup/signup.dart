

import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/domain/admin.dart';

import '../widgets/welcome_text.dart';
import '../widgets/input_field.dart';
import 'signup_button.dart';
import '../widgets/bottom_text.dart';
import '../login/login.dart';

class SignUp extends StatefulWidget {

  
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String confirmPassword;
  Admin admin;
  String errorText = "";
  bool isValidName, isValidUsername, isValidEmail, isValidPassword, isValidConfirmPassword;
 // InputField confirmPass, username, email;
  _SignUpState(){
    admin = new Admin();
    isValidName = isValidUsername = isValidEmail = isValidPassword = isValidConfirmPassword = true;
  }

  getName(name) {
    admin.name = name;
  }


  getEmail(email) {
    admin.email = email;
  }

  getPassword(password) {
    admin.password = password;
  }

  getConfirmPassword(confirmPassword) {
    setState(() {
      this.confirmPassword = confirmPassword;
    });
  }

  // getError(error){
  //   if (error == 'check confirm password') {
  //     this.confirmPass.validatePassword(admin.password);
  //   }
  //   if(error == "username already exist"){
  //     username.validateUsername(false);
  //   }
  //   else{
  //     username.validateUsername(true);
  //   }
  //   if(error == 'Email already exists'){
  //     print('Email already exists');
  //     email.emailAlreadyExists(true);
  //   }
  //   else {
  //     email.emailAlreadyExists(false);
  //   }
  // }

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
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Welcome(),
                  Text(
                    "Please sign up to continue",
                    style: TextStyle(
                      color: Color(0xff696969),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  InputField(false, "NAME", 50.0, callback: getName,),
                  SizedBox(
                    height: 10.0,
                  ),
                  // InputField(false, "USERNAME", 50.0, callback: getUsername,),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  InputField(false, "EMAIL", 50.0, callback: getEmail,),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputField(true, "PASSWORD", 50.0, callback: getPassword,),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputField(true, "CONFIRM PASSWORD", 50.0, callback: getConfirmPassword,),
                  SizedBox(
                    height: 10.0,
                  ),
                  SignupButton(admin, this.confirmPassword),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(child: Text(this.errorText, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: BottomText(
                        msg: "Already have account?", link: "Sign in"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
