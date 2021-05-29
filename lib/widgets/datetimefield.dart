import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeField extends StatefulWidget {
  final String hint;
  final TextInputType inputType;
  final TextEditingController controller;

  DateTimeField(
      {@required this.hint,
      @required this.inputType,
      @required this.controller});
  @override
  _DateTimeFieldState createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<DateTimeField> {

  _getDateTime() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2021),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if(picked != null) setState(() {
      widget.controller.text = picked.toIso8601String();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(283.0),
        height: ScreenUtil().setHeight(50.0),
        child: TextField(
    controller: widget.controller,
    keyboardType: widget.inputType,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(12.0)),
      suffixIcon: GestureDetector(
        onTap: _getDateTime,
          child: Image.asset(
        'assets/calendar.png',
        width: ScreenUtil().setWidth(10.0),
        height: ScreenUtil().setHeight(10.0),
      )),
      hintText: widget.hint,
      hintStyle: TextStyle(
          fontFamily: 'medium',
          fontSize: ScreenUtil().setSp(14.0),
          color: Color(0xFF888888)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
              color: Color(0xFF777777), width: ScreenUtil().setWidth(0))),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
              color: Color(0xFF777777), width: ScreenUtil().setWidth(0))),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
              color: Color(0xFF777777), width: ScreenUtil().setWidth(0))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
              color: Color(0xFF777777), width: ScreenUtil().setWidth(0))),
    ),
        ),
      );
  }
}
