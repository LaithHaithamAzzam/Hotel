import 'package:flutter/cupertino.dart';

class SelectRoomsProvider extends ChangeNotifier{
  List<String>? Rooms = [];
  List<String>? roomid = [];
  Addroom(String rooms,String id){
    Rooms!.add(rooms);
    roomid!.add(id);
    print(Rooms);
    print(roomid);
    notifyListeners();
  }
  remove(String rooms,String id){
    Rooms!.remove(rooms);
    roomid!.remove(id);
    print(Rooms);
    print(roomid);
    notifyListeners();
  }
}