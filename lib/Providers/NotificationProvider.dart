import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Notification_Model.dart';

class NotificationProvider extends ChangeNotifier{
  int? counter =0;
  List<Data>? data;
  AddCountNotification(int counte) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(counte == 0){
      counter = 0;
     await prefs.setString("notification", "$counter");
    }
    else{
      counter = counter! + 1 ;
      await prefs.setString("notification", "$counter");
    }
    notifyListeners();
  }
  getdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? noti = await prefs.getString("notification");
    counter=int.parse(noti!);
    print("$counter "+ "skaljklsajsa");
    notifyListeners();
  }
  SetData(dat){
    data = dat;
    notifyListeners();
  }

}