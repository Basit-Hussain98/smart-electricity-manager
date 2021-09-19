import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/adminpanel/admin_panel.dart';
import 'package:smart_electricity_manager/domain/user.dart';

import '../widgets/welcome_text.dart';
import '../widgets/input_field.dart';
import '../widgets/my_button.dart';
import '../widgets/bottom_text.dart';
import '../add_user/add_user_button.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String confirmPassword;

  AppUser user;

  _AddUserState() {
    user = new AppUser();
  }

  getName(name) {
    user.name = name;
  }


  getEmail(email) {
    user.email = email;
  }

  getPassword(password) {
    user.password = password;
  }

  getConfirmPassword(confirmPassword) {
    setState(() {
      this.confirmPassword = confirmPassword;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color(0xff6cbbc7)),
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
                    "Add User",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Welcome(),
                  SizedBox(
                    height: 25.0,
                  ),
                  InputField(false, "NAME", 50.0, callback: getName,),
                  SizedBox(
                    height: 10.0,
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(text: "Cancel", goto: AdminPanel(),),
                      SizedBox(width: 10.0,),
                      AddUserButton(user, this.confirmPassword),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
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
