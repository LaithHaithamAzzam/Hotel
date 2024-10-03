import 'package:flutter/cupertino.dart';

class SelectRoomsOfferProvider extends ChangeNotifier{
  DateTime? Startdate;
  DateTime? Enddate;
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
  SetDate(DateTime? startdate , DateTime? enddate){
    Startdate = startdate;
    Enddate = enddate;
    notifyListeners();
  }
}