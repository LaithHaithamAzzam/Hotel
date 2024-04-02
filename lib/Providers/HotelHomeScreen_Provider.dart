import 'package:flutter/cupertino.dart';

import '../Models/HotelHomeScreenModel.dart';

class HotelHomeScreenProvider extends ChangeNotifier{
  int? roomCount;
  List<Rooms>? rooms;
  RoomsHome( int? RoomCount ,   List<Rooms>? Rooms) {
    roomCount = RoomCount;
    rooms = Rooms;
    notifyListeners();
  }
}