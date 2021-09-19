import 'package:flutter/material.dart';

import '../widgets/welcome_text.dart';
import '../widgets/input_field.dart';
import '../widgets/my_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'change_password_button.dart';
class ChangePassword extends StatefulWidget {
  final Widget comeFrom;
  ChangePassword(this.comeFrom);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String oldPassword, newPassword, confirmPassword;

  getOldPassword(oldPassword) {
    setState(() {
      this.oldPassword = oldPassword;
    });

  }
  getNewPassword(newPassword) {
    setState(() {
      this.newPassword = newPassword;
    });

  }
  getConfirmPassword(confirmPassword) {
    setState(() {
      this.confirmPassword = confirmPassword;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Change Password",
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
                    height: 80.0,
                  ),
                  InputField(true, "OLD PASSWORD", 60.0, callback: getOldPassword,),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputField(true, "NEW PASSWORD", 60.0, callback: getNewPassword,),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputField(true, "CONFIRM PASSWORD", 60.0, callback: getConfirmPassword,),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(text: "Cancel", goto: widget.comeFrom,),
                      SizedBox(width: 10.0,),
                      ChangePasswordButton(this.oldPassword, this.newPassword, this.confirmPassword, goto: widget.comeFrom),
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
