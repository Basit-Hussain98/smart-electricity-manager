
import 'dart:convert';
import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/domain/user.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';


import '../adminpanel/admin_panel.dart';
import '../utils/EmailSender.dart';
//import 'package:flutter_email_sender/flutter_email_sender.dart';

//import 'package:http/http.dart' as http;




class AddUserButton extends StatelessWidget {
  AppUser user;
  String confirmPass;
  DatabaseService databaseService;

  AddUserButton(this.user, this.confirmPass) {
    databaseService = new DatabaseService();
  }

  bool isEmpty(){
    if(user.name?.isEmpty ?? true) {
      return true;
    }
    else if(user.email?.isEmpty ?? true) {
      return true;
    }
    else if(user.password?.isEmpty ?? true) {
      return true;
    }
    else if(this.confirmPass?.isEmpty ?? true)  {
      return true;
    }
    else
      return false;
  }

  void makeAlert(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        if(this.isEmpty()){
          makeAlert(context, "input fields are empty");
        }
        else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(user.email)) {
          makeAlert(context, 'invalid email');
        }
        else if(user.password != this.confirmPass) {
          makeAlert(context, 'invalid confirm password');
        }
        else {
          String response = await databaseService.registerUser(user);
          if (response == 'VALID_USER') {
            EmailSender emailSender = EmailSender(user.email, user.password);
            await emailSender.send();
            // final Email mail = Email(
            //   body: 'Hi User, Welcome to Smart Electricty Manager!!! \n Here are you login credientials. \n\n Email: ' + user.email + '\n Password: ' + user.password,
            //   subject: 'Login Credientials - Smart Electricity Manager',
            //   recipients: [user.email],
            //   isHTML: false
            // );
            // await FlutterEmailSender.send(mail);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminPanel()),
            );
          }
          else if (response == 'ERROR_EMAIL_ALREADY_IN_USE'){
            makeAlert(context, 'Email already exists');
          }
          else if (response == 'ERROR_WEAK_PASSWORD') {
            makeAlert(context, 'password is too weak');
          }
        }
      },
      child: Container(
        height: 45.0,
        width: 100.0,
        margin: EdgeInsets.only(top: 5.0, left: 40.0, right: 0.0),
        decoration: BoxDecoration(
            color: Color(0xff6cbbc7),
            borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          title: Align(
            alignment: Alignment(0.0, -0.4),
            child: Text(
              "Add",
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

// Future<http.Response> addUser(admin)  async {
//   final response = http.post(
//   Uri.parse('http://192.168.10.9:3000/adduser'),
//   headers: <String, String>{
//     'Content-Type': 'application/json; charset=UTF-8',
//
//   },
//   body: jsonEncode(<String, String>{
//     'name': admin.name,
//     'username': admin.username,
//     'email': admin.email,
//     'password': admin.password,
//     'role': 'admin',
//     }),
//     );
//     return response;
//
// }
}

