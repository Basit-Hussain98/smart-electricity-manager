import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'logo.dart';
import 'home_buttons.dart';
import 'logo_text.dart';
import '../login/login.dart';
import '../signup/signup.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),
          LogoText(),
          HomeButtons("Login", Icons.login_rounded, Login()),
          HomeButtons("Sign Up", Icons.account_box, SignUp()),
        ],
      ),
    );
  }
}
