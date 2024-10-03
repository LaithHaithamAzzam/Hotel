import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/AllHotelsModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/allHotelProvider.dart';
import 'api.dart' as global;

class allHotelAPI {
  allHotelAPI(this.context);
  BuildContext context;
  Dio dio = Dio();
  allHotel() async {
    SharedPreferences shprefs =await SharedPreferences.getInstance();
    String? token =await shprefs.getString("Token");
    String myurl = "${global.SERVER}""${global.getAllHotels}";
    try {
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${token}'
          }));
      print(response.data);
      AllHotelModel allHotelModel = AllHotelModel.fromJson(response.data);
      Provider.of<allHotelProvider>(context,listen: false).setAllHotel(allHotelModel.data);
      return response.statusCode;
    } catch (e) {
      print(e);
    }
  }
}
