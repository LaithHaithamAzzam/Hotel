import 'package:flutter/cupertino.dart';

class SetRateProvider extends ChangeNotifier{
  int rate = 0;
  setrate(int ra){
    rate = ra;
    notifyListeners();
  }
}