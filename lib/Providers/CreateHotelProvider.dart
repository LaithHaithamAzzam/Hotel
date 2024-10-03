import 'package:flutter/cupertino.dart';

class CreateHotelProvider extends ChangeNotifier{
  String? hotelname;
  String? username;
  String? password;
  AddHotel(String hname,String husername,String hpassword,){
    hotelname = hname;
    username = husername;
    password = hpassword;
    notifyListeners();
  }
}