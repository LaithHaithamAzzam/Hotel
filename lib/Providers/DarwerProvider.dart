import 'package:flutter/cupertino.dart';

class DraweProvider extends ChangeNotifier{
  bool isopen = false;
  opendrawer(bool state){
    isopen = state;
    notifyListeners();
  }
}