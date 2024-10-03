import 'package:flutter/cupertino.dart';
import 'package:hotel/Models/RoomNumperDetail.dart';

class RoomDertailProvider extends ChangeNotifier{
  RoomDetail? roomDetail;
  List<Bookings>? bookings;

  Setdate(RoomDetail roomdet ,  List<Bookings> booking){
    roomDetail = roomdet;
    bookings = booking;
    notifyListeners();
  }
}