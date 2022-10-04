import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class Textfieldwithicon extends StatefulWidget {
 Textfieldwithicon({required this.icondata,required this.label});
 final IconData icondata;
 final String label;
  @override
  State<Textfieldwithicon> createState() => _TextfieldwithiconState();
}

class _TextfieldwithiconState extends State<Textfieldwithicon> {
  FocusNode _textFieldFocus = FocusNode();
  Color _color = Color(0xFFfafafa);
  Color _coloricon = Color(0xFFa8a8a8);
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = Color(0xFFf2f1ff);
          _coloricon = Color(0xFF584cf4);
        });
      } else {
        setState(() {
          _color = Color(0xFFfafafa);
          _coloricon = Color(0xFFa8a8a8);
        });
      }
    });

    super.initState();
  }
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {

    return Form(
      key:_formkey,
      child:
      Container(
        //  height: MediaQuery.of(context).size.width * 0.5,
        // width: MediaQuery.of(context).size.height * 0.5,
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.all(5.0),
        child: TextFormField(
          // validator: ,
          focusNode: _textFieldFocus,
          decoration: InputDecoration(
            prefixIcon: Icon( widget.icondata,
              color: _coloricon,
            ),
            fillColor: _color,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                width: 2.0,
                color: Color(0xFF7b72f7),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
            hintText: widget.label,
            hintStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
