import 'package:flutter/cupertino.dart';

class BBProvider extends ChangeNotifier{
  int currentIndex = 0;
  setcurrentindex(int cidx){
    currentIndex = cidx;
    notifyListeners();
  }
}