import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/view/HotelScreen/HotelDateils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/LocationsModel.dart';
import '../Providers/LocationsProvider.dart';
import '../view/HotelScreen/Detail_Hotel_User.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class GetHotel{
  BuildContext context;
  GetHotel(this.context);
  getHotel(String hotelid , int heroindex)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String? Token = await prefs.getString("Token");
    try {
      loding(context);
      var Res = await Dio().get("${global.SERVER}${global.getHotel}",
        options: Options(
            headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token'
            }
        ),
        data: {
        'id':hotelid
        }
      );
      print(Res.data);
      if(Res.data['state'] == true){
        Navigator.of(context).pop();
        print(Res.data);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              Detile_Hotel(Herotag: "Hotel$heroindex"),
        ));
      }

    }catch (e){
      Navigator.of(context).pop();
      print(e);
    }

  }
}