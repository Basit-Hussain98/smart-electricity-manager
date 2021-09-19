import 'dart:async';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class EmailSender {
  String email, password;
  EmailSender(this.email, this.password);

  Future<String> send() async {
    final Email mail = Email(
        body: 'Hi User, Welcome to Smart Electricty Manager!!! \n Here are you login credientials. \n\n Email: ' + this.email + '\n Password: ' + this.password,
        subject: 'Login Credientials - Smart Electricity Manager',
        recipients: [this.email],
        isHTML: false
    );

    try {
      await FlutterEmailSender.send(mail);
      print('success');
    } catch (error) {
      print(error.toString());
    }
  }
}