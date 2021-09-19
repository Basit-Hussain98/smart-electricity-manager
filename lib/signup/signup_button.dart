
import 'dart:convert';
import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';
import 'package:smart_electricity_manager/domain/admin.dart';

import '../adminpanel/admin_panel.dart';

//import 'package:http/http.dart' as http;




class SignupButton extends StatelessWidget {
  Admin admin;
  String confirmPass;
  DatabaseService databaseService;

  SignupButton(this.admin, this.confirmPass) {
    databaseService = new DatabaseService();
  }

  bool isEmpty(){
    if(admin.name?.isEmpty ?? true) {
      return true;
    }
    // else if(admin.username?.isEmpty ?? true) {
    //   return true;
    // }
    else if(admin.email?.isEmpty ?? true) {
      return true;
    }
    else if(admin.password?.isEmpty ?? true) {
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
        else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(admin.email)) {
          makeAlert(context, 'invalid email');
        }
        else if(admin.password != this.confirmPass) {
          makeAlert(context, 'invalid confirm password');
        }
        else {
          String response = await databaseService.register(admin);
          if (response == 'VALID_USER') {
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
        height: 50.0,
        width: 150.0,
        margin: EdgeInsets.only(top: 5.0, left: 180.0, right: 0.0),
        decoration: BoxDecoration(
            color: Color(0xff6cbbc7),
            borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          title: Align(
            alignment: Alignment(1.2, -0.2),
            child: Text(
              "Sign Up",
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

