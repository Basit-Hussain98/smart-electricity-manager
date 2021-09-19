import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/adminpanel/admin_panel.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user_panel/user_panel.dart';
import 'package:smart_electricity_manager/backend/DatabaseService.dart';

class LoginButton extends StatelessWidget {
  String email, password;
  DatabaseService databaseService;

  LoginButton(this.email, this.password) {
    databaseService = new DatabaseService();
  }

  bool isEmpty(){
    if(this.email?.isEmpty ?? true) {
      return true;
    }
    else if(this.password?.isEmpty ?? true) {
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
        else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this.email)) {
          makeAlert(context, 'invalid email');
        }
        else {
          String response = await databaseService.login(email, password);
          if (response == 'user-not-found') {
            makeAlert(context, 'user not found');
          }
          else if (response == 'wrong-password') {
            makeAlert(context, 'wrong password');
          }
          else {
            String userType = await databaseService.checkUserType();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('email', email);
            prefs.setString('password', password);
            if (userType == 'admin') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminPanel()),
              );
            }
            else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserPanel()),
              );
            }
          }

        }
      },
      child: Container(
        height: 60.0,
        width: 130.0,
        margin: EdgeInsets.only(top: 20.0, left: 200.0, right: 0.0),
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
              "Login",
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
