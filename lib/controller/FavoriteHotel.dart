import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Models/AllHotelsModel.dart';
import 'package:hotel/view/MyWidgite/Loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/FavHotelsModel.dart';
import '../Providers/AllFavHotelsProvider.dart';
import '../Providers/allHotelProvider.dart';
import 'api.dart' as global;

class FavouriteHotels {

  FavouriteHotels(this.context);
  BuildContext context;
  Dio dio = Dio();
  showFev() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = prefs.getString("Token");
    String myurl = "${global.SERVER}""${global.favHotel}";
    try {
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }));
      if(response.statusCode==200){
        print(response.data);
        FavHotels fav= FavHotels.fromJson(response.data);
        Provider.of<AllFavHotelsProvider>(context , listen: false).setDataFav(fav.data);
        Provider.of<AllFavHotelsProvider>(context,listen: false).Setstate(true);
      }
    } catch (e) {

    }
  }
}