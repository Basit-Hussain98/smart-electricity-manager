import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/remove_user/remove_user_button.dart';

import '../widgets/welcome_text.dart';
import '../widgets/input_field.dart';
import '../widgets/my_button.dart';
import '../adminpanel/admin_panel.dart';

class RemoveUser extends StatefulWidget {
  @override
  _RemoveUserState createState() => _RemoveUserState();
}

class _RemoveUserState extends State<RemoveUser> {
  String email;
  getEmail(email) {
    setState(() {
      this.email = email;
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
                    "Remove User",
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
                  Material(
                    elevation: 10.0,
                    shadowColor: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          InputField(false, "EMAIL", 60.0, callback: getEmail,),
                          SizedBox(
                            height: 30.0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MyButton(text: "Cancel", goto: AdminPanel(),),
                              SizedBox(width: 10.0,),
                              RemoveUserButton(this.email),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
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
