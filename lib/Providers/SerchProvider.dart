import 'package:flutter/cupertino.dart';
import '../Models/AllHotelsSerchModel.dart';



class SerchProvider extends ChangeNotifier{
  List<Data>? data;
  bool State = false;
  ResDataSerch(List<Data>? Data){
    data = Data;
    notifyListeners();
  }
  Setstate(bool state){
    State = state;
    notifyListeners();
  }
}

