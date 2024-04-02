import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/HotelHomeScreenModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/HotelHomeScreen_Provider.dart';
import 'api.dart' as global;

class hotelRoomsAPI {
  hotelRoomsAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  hotelRooms(String Startdate , String Enddate) async {
    String myurl = "${global.SERVER}""${global.hotelRooms}";
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? Token = await prefs.getString("Token");
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }),
      data: {
        "startDate":Startdate,
        "endDate":Enddate
      }
      );
      print(response.statusCode);
      if(response.statusCode==200){
        print(response.data);
        HotelHomeScreenModel HHSModel = HotelHomeScreenModel.fromJson(response.data);
        Provider.of<HotelHomeScreenProvider>(context , listen: false).RoomsHome(HHSModel.roomCount, HHSModel.rooms);
      }
      return response.statusCode;
    } catch (e) {
      print('hotel rooms field');
    }
  }
}
