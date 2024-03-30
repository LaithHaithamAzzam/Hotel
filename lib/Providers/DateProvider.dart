import 'dart:ffi';

import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier{
  String Dateis = "Select end and start Date";
  double sallary = 0.0 ;
  Changedate(String date){
    Dateis = date ;
    notifyListeners();
  }
  ChangeSallary(double sall){
    sallary = sall;
    notifyListeners();
  }
}