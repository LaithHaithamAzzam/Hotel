
import 'package:flutter/material.dart';

class RoomTypesProvider extends ChangeNotifier {
  List<String>? data;
  List? types;
  String value = "Sweet";
  RoomTypes(List<String>? all) {
    data =all;
    notifyListeners();
  }
  HomeScreenHotel(List? type) {
    types =type;
    notifyListeners();
  }
  setvalue(String v) {
    value =v;
    print(v);
    notifyListeners();
  }
}