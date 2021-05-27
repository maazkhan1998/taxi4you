import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiforyou/screens/mapScreen.dart';
import 'package:taxiforyou/widgets/customtextfield.dart';

bookNow(BuildContext context) {
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController email=TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Color(0xFFdedede),
            elevation: 0.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
            titlePadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            title: Text('Jetzt Buchen',
                style: TextStyle(
                    fontFamily: 'medium',fontWeight: FontWeight.bold,letterSpacing: -0.5,
                    fontSize: ScreenUtil().setSp(20.0),
                    color: Colors.black54)),
            children: [
              SizedBox(height: ScreenUtil().setHeight(3.0)),
              CustomTextField(
                  hint: 'Name',
                  inputType: TextInputType.text,
                  controller: name),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              CustomTextField(
                  hint: 'Phone',
                  inputType: TextInputType.number,
                  controller: number),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              CustomTextField(
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  controller: email),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              LocationContainer(
                text:'Abholort*'
              ),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              LocationContainer(
                text:'Ankunftsort*'
              ),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              Container(
                padding: EdgeInsets.symmetric(horizontal:12),
                width: ScreenUtil().setWidth(283),
                height: ScreenUtil().setHeight(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFF777777),width: 0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Datum/Uhrzeit*',style: TextStyle(fontFamily: 'medium',fontSize: ScreenUtil().setSp(14.0),color: Color(0xFF888888))),
                    GestureDetector(
                      onTap: ()=>showDatePicker(
                        initialDate: DateTime.now(),
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2022)
                      ),
                                          child: Image.asset(
        'assets/calendar.png',
        height: 30.0,width: 30.0,
      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(28.0)),
              Container(
                height: ScreenUtil().setHeight(40.0),
                child: ElevatedButton(
                  child: Text('ANFRAGE ABSCHICKEN',
                      style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8))),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.5, primary: Colors.teal.shade400),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20.0),
              ),
            ],
          );
        });
  }
  class LocationContainer extends StatelessWidget {

    final String text;

    LocationContainer({this.text});

    @override
    Widget build(BuildContext context) {
      return Container(
                padding: EdgeInsets.symmetric(horizontal:12),
                width: ScreenUtil().setWidth(283),
                height: ScreenUtil().setHeight(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFF777777),width: 0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text,style: TextStyle(fontFamily: 'medium',fontSize: ScreenUtil().setSp(14.0),color: Color(0xFF888888))),
                    GestureDetector(
                      onTap: ()=>Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_)=>MapScreen()
                        )
                      ),
                                          child: Image.asset(
            'assets/location.png',
            height: 30,width: 30.0,
          ),
                    )
                  ],
                ),
              );
    }
  }