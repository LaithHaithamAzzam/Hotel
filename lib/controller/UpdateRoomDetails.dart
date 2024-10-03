import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/MyOffersModels.dart';
import 'package:hotel/Providers/MyOffersProvider.dart';
import 'package:hotel/controller/AllMyOffers.dart';
import 'package:hotel/controller/GetHotelHomeScreen.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:hotel/view/Offers/hotelOffers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class UpdateRoomDetails {

  UpdateRoomDetails(this.context);
  BuildContext context;
  Dio dio = Dio();
  updateRoomDetails(int? id , String type , double price) async {
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = prefs.getString("Token");
    String myurl = "${global.SERVER}""${global.updateRoom}";
    try {
      var response = await dio.post(cancelToken: canseltoken,myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }),
      data: {
        "id":id,
        "type":type,
        "price":price
      }
      );
      if(response.data['state']==true){
        await GetHotelHomeScreen(context).getHotelHomeScreen();
        Navigator.of(context).pop();
        Showsnack(context,"Done Edditing Room","Not Editing Room",Colors.redAccent,Colors.green,true);
      }
    } catch (e) {
      print(e);
      Navigator.of(context).pop();
      Showsnack(context,"Done Editing Room","Error Edditing Room",Colors.redAccent,Colors.green,false);

    }
  }
}