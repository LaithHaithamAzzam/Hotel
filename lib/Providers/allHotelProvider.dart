import 'package:flutter/cupertino.dart';
import 'package:hotel/Models/AllHotelsModel.dart';

class allHotelProvider extends ChangeNotifier {
  List<Data>? data;
    setAllHotel(  List<Data>? all) {
   data =all;
    notifyListeners();
  }
}
