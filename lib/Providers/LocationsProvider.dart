import 'package:flutter/cupertino.dart';
import 'package:hotel/Models/LocationsModel.dart';

class LocationProvider extends ChangeNotifier{
  List<Data>? data;
  String Loc = "Select Location";
  int? Locid ;
  Alllocations(List<Data> Data){
    data = Data;
    notifyListeners();
  }
  Selectlocation(String location,int locid){
    Loc = location;
    Locid = locid;
    notifyListeners();
  }
}