import 'package:demo2/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class gender extends StatefulWidget {
  // gender({Key? key}) : super(key: key);
  gender({required this.label});
  final String label;

  @override
  State<gender> createState() => _genderState();
}

class _genderState extends State<gender> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _date=TextEditingController();
    DateTime pickeddate=DateTime(0);
    List data = [
      'Male',
      'Female',
      'Other',
    ];
    String? dropdownvalue;
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
    return Padding(
      padding: const EdgeInsets.only(top:15.0,left:5.0,right:5.0,bottom: 10.0),
      child: DropdownButtonFormField(
        focusNode: _textFieldFocus,
        decoration: InputDecoration(
          fillColor: _color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              width: 2.0,
              color: Color(0xFF7b72f7),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,

          ),
        ),
        hint: Text('GENDER'),
        value: dropdownvalue,
        items: data.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            dropdownvalue = newValue as String?;
          });
        },
        icon: Icon(
          Icons.arrow_drop_down_sharp,
          color: dividertextcolor,
        ),
      ),
    );
  }
}
