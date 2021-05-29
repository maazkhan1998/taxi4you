import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextInputType inputType;
  final TextEditingController controller;

  CustomTextField({@required this.hint,@required this.inputType,@required this.controller});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(283.0),
      height: ScreenUtil().setHeight(50.0),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(12.0)),
          hintText: widget.hint,
          hintStyle: TextStyle(fontFamily: 'medium',fontSize: ScreenUtil().setSp(14.0),color: Color(0xFF888888)),
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
