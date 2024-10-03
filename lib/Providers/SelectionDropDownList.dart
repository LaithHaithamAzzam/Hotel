import 'package:flutter/cupertino.dart';

class SelectionDropDownList extends ChangeNotifier{
  String item = "Studio";
  SetValue(String val){
    item = val;
    notifyListeners();
  }
}