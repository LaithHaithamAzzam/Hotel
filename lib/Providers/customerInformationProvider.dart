import 'package:flutter/cupertino.dart';

class customerInformationProvider extends ChangeNotifier{
  String name = '';
  String username= '';
  String token = '';
  String imageid = '';
  setUserInfo(String Name, String Token,String userName,String Imageid) {
    name = Name;
    username=userName;
    token = Token;
    imageid =Imageid;
    notifyListeners();
  }
}