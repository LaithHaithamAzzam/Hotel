import 'package:flutter/cupertino.dart';
import 'package:hotel/Models/RoomTypesCounterModel.dart';

class SelectRoomsProvider extends ChangeNotifier{
  List<String>? Rooms = [];
  Addroom(String rooms){
    Rooms!.add(rooms);
    print(Rooms);
    notifyListeners();
  }
  remove(String rooms){
    Rooms!.remove(rooms);
    print(Rooms);
    notifyListeners();
  }
}