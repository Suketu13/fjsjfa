import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class datefield extends StatefulWidget {
  // datefield(this.formkey);

  datefield({required this.icondata,required this.label});
  final IconData icondata;
  final String label;


  @override
  State<datefield> createState() => _datefieldState();
}

class _datefieldState extends State<datefield> {
  @override
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
  TextEditingController _date=TextEditingController();
  DateTime pickeddate=DateTime(0);

  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0, bottom: 10.0),
      child: Form(
        key: _formkey,
        child: TextFormField(
          focusNode: _textFieldFocus,
          // validator: (value){
          //
          // },
          controller: _date,
          onSaved: (value) {},
          onTap: () async {
            DateTime? pickeddate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1991),
                lastDate: DateTime(2100));
            if (pickeddate.toString() != null) {
              var formattedDate =
                  DateFormat('EEEE, MMM d, yyyy').format(pickeddate!);
              setState(() {
                _date.text = formattedDate;
                print("date=====>${_date.text}");
              });
            }
          },
          // focusNode: _textFieldFocus,
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.calendar_month_outlined,
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
            hintText: 'Date',
            hintStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
