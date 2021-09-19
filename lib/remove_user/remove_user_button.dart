import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/adminpanel/admin_panel.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electricity_manager/login/login.dart';

import '../user_panel/user_panel.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';

class RemoveUserButton extends StatelessWidget {
  String email;
  DatabaseService databaseService;

  RemoveUserButton(this.email) {
    databaseService = new DatabaseService();
  }

  bool isEmpty(){
    if(this.email?.isEmpty ?? true) {
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

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        if(this.isEmpty()){
          makeAlert(context, "input fields are empty");
        }
        else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this.email)) {
          makeAlert(context, 'invalid email');
        }
        else {
          //databaseService.sendPasswordResetEmail(this.email);
          makeAlert(context, 'You will recieve password reset email shortly.');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminPanel()),
          );
          // String response = await databaseService.login(email, password);
          // if (response == 'user-not-found') {
          //   makeAlert(context, 'user not found');
          // }
          // else if (response == 'wrong-password') {
          //   makeAlert(context, 'wrong password');
          // }
          // else {
          //   String userType = await databaseService.checkUserType();
          //   SharedPreferences prefs = await SharedPreferences.getInstance();
          //   prefs.setString('email', email);
          //   prefs.setString('password', password);
          //   if (userType == 'admin') {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => AdminPanel()),
          //     );
          //   }
          //   else {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => UserPanel()),
          //     );
          //   }
          // }

        }
      },
      child: Container(
        height: 45.0,
        width: 104.0,
        margin: EdgeInsets.only(top: 0.0, left: 10.0, right: 0.0),
        decoration: BoxDecoration(
            color: Color(0xff6cbbc7),
            borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          title: Align(
            alignment: Alignment(0.2, -0.5),
            child: Text(
              "Remove",
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
}
