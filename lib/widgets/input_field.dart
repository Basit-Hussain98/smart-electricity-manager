import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/handle_manually/appliance_handle.dart';


// ignore: must_be_immutable
class InputField extends StatefulWidget {
  final bool isPswd;
  final String label;
  final Function callback;
  double height;

  InputField(this.isPswd, this.label, this.height, {this.callback});

  _InputFieldState inp = _InputFieldState();
  @override
  _InputFieldState createState() => inp;
}


class _InputFieldState extends State<InputField> {
 // Errors handleErrors = new Errors();
  final _text = TextEditingController();
  bool _validate = false;
  String value;
  String errorText = "";

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  handleChange(){
    if(this.widget.callback != null)
        this.widget.callback(_text.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    _text.addListener(handleChange);
    
    return Container(
      // height: widget.height,
      child: TextField(
        controller: _text,
        obscureText: widget.isPswd,
        decoration: InputDecoration(
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff6cbbc7) , width: 3.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6cbbc7), width: 3.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 3.0),
          ),

          labelStyle: TextStyle(
            color: Color(0xff6cbbc7),
            fontWeight: FontWeight.bold,
          ),
          errorStyle: TextStyle(
            color: Color(0xff6cbbc7),
            wordSpacing: 5.0,
          ),
          labelText: widget.label,
          //errorText: _validate ? errorText : null,
        ),
      ),
    );
  }
}
