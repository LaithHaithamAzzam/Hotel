
import 'package:flutter/material.dart';

class RoomTypesProvider extends ChangeNotifier {
  List<String>? data;
  String? value;
  RoomTypes(  List<String>? all) {
    data =all;
    notifyListeners();
  }
  setvalue(  String v) {
    value =v;
    notifyListeners();
  }
}