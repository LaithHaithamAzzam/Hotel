import 'package:flutter/cupertino.dart';
import 'package:hotel/Models/RoomTypesCounterModel.dart';

class roomTypeCounterProvider extends ChangeNotifier {
  RoomTypesCounterModel? al;
  Data? data;
  List<Rooms>? rooms;
  roomTypeCounter(  RoomTypesCounterModel all) {
    al=all;
    data =al!.data;
    rooms=al!.data!.rooms;

    notifyListeners();
  }


}
