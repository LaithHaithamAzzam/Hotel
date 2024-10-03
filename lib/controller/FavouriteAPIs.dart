import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/SerchProvider.dart';
import 'package:hotel/view/MyWidgite/Loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/allHotelProvider.dart';
import 'api.dart' as global;

class FavouriteAPIs {
  FavouriteAPIs(this.context);
  BuildContext context;
  Dio dio = Dio();
  addFavourite(int hotelID , int Dataindex , bool isserch) async {
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = prefs.getString("Token");
    String myurl = "${global.SERVER}""${global.addFav}";
    try {
      var response = await dio.post(cancelToken: canseltoken,myurl,
          data: {
            "hotelId": hotelID,
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }));
      print(response.data);
      if(response.statusCode==200){
        Navigator.of(context).pop();
        if(isserch == true){

        }
        else{
          Provider.of<allHotelProvider>(context , listen:  false).setFav(Dataindex,true);
        }

      }
    } catch (e) {

    }
  }


  DeleteFavourite(int hotelID , int? dataindex , bool isserch) async {
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = prefs.getString("Token");
    String url = "${global.SERVER}""${global.deleteFav}";
    try {
      var response = await dio.post(cancelToken: canseltoken,url,
          data: {
            "hotelId": hotelID,
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }));
      print(response.data);
      if(response.statusCode==200){
        Navigator.of(context).pop();
        if(isserch == true){

        }
        else{
          Provider.of<allHotelProvider>(context , listen:  false).setFav(dataindex!,false);
        }

      }
    } catch (e) {

    }
  }
}