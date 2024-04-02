import 'package:flutter/cupertino.dart';
import 'package:hotel/Models/AllHotelsModel.dart';

class allHotelProvider extends ChangeNotifier {
  List<Data>? data;
  int? favid;
    setAllHotel(  List<Data>? all) {
   data =all;
    notifyListeners();
  }
  setFav(int favid , bool status ) {
    data?[favid].isFav = status;
    notifyListeners();
  }
}
