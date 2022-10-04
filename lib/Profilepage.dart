
import 'package:demo2/Gender.dart';
import 'package:demo2/Name.dart';
import 'package:demo2/TextfieldWithicon.dart';
import 'package:flutter/material.dart';
import 'package:demo2/constants.dart';

import 'date field.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {

  @override
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
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          leading: BackButton(
            color: Textcolor,
          ),
          title: Text(
            "Fill Your Profile",
            style: TextStyle(
                fontSize: 28.0,
                fontFamily: "inter" "sans serif",
                fontWeight: FontWeight.bold,
                color: Textcolor),
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 130.0,
                height: 130.0,
                decoration: BoxDecoration(
                  // color: buttonbackcolor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Stack(
                  alignment: Alignment(0.35, 0.5),
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://cdn1.iconfinder.com/data/icons/basic-ui-set-v5-user-outline/64/Account_profile_user_avatar_rounded-512.png",
                      ),
                      backgroundColor: Colors.white,
                      radius: 100.0,
                    ),
                    Container(
                      //alignment: Alignment(-1, -1),
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        //color: buttonbackcolor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(
                        // Icons.format_color_fill.
                        Icons.edit,
                        size: 45,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Name(label: 'Name'),
            Textfieldwithicon(icondata: Icons.phone, label: 'Phone number'),
            gender(label: 'Gender'),
            datefield(icondata: Icons.calendar_month_outlined, label: 'Date'),
          ],
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => ButtonState();
}

 class ButtonState extends State<Button> {
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

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}