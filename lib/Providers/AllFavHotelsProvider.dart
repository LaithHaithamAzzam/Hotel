import 'package:flutter/cupertino.dart';
import '../Models/FavHotelsModel.dart';


class AllFavHotelsProvider extends ChangeNotifier{
  List<Data>? data;
  bool State = false;
  setDataFav(List<Data>? Data){
    data = Data;
    notifyListeners();
  }
  Setstate(bool state){
    State = state;
    notifyListeners();
  }
}

