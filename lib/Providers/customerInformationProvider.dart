import 'package:flutter/cupertino.dart';

class customerInformationProvider extends ChangeNotifier{
  String name = '';
  String username= '';
  String token = '';
  setUserInfo(String Name, String Token,String userName) {
    name = Name;
    username=userName;
    token = Token;
    notifyListeners();
  }
}