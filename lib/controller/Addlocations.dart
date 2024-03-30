import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/HotelScreen/Detail_Hotel_User.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class AddLocationsAPI{
  BuildContext context;
  AddLocationsAPI(this.context);
  addLocation(String country , String city)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = await prefs.getString("Token");
    print(Token);
    try {
      loding(context);
      var Res = await Dio().post("${global.SERVER}${global.addLocation}",
          options: Options(
              headers: {
                'accept': 'application/json',
                'authorization': 'Bearer $Token'
              }
          ),
          data: {
            'country':country,
            'city':city
          }
      );
      print(Res.data);
      if(Res.data['state'] == true){
        Navigator.of(context).pop();
        print(Res.data);
        Showsnack(context,"Done Add Location","Not Add Locations",Colors.redAccent,Colors.green,true);
      }

    }catch (e){
      Navigator.of(context).pop();
      Showsnack(context,"Done Add Location","Error Add Locations",Colors.redAccent,Colors.green,false);
      print(e);
    }

  }
}