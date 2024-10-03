import 'package:flutter/cupertino.dart';
import '../Models/MyOffersModels.dart';
class MyOffersProvider extends ChangeNotifier{
  List<Data>? data;
  SetData(List<Data>? Data){
    data = Data;
    notifyListeners();
  }
}