import 'package:flutter/material.dart';

class BottomBarProvider with ChangeNotifier{
  int pageNo=0;
  bool visibility = true;

  updatePageNo(int index){
    pageNo=index;
    notifyListeners();
  }
}