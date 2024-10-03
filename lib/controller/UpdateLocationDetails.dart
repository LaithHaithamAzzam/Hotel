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

class UpdateLocationDetails {
  UpdateLocationDetails(this.context);
  BuildContext context;
  Dio dio = Dio();
  updateLocationDetails(String detail) async {
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = prefs.getString("Token");
    String myurl = "${global.SERVER}""${global.updateLocationDetail}";
    try {
      var response = await dio.post(cancelToken: canseltoken,myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }),
      data: {
        "locationDetail":detail
      }
      );
      if(response.data['state']==true){
        print(response.data);
        await GetHotelHomeScreen(context).getHotelHomeScreen();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Showsnack(context,"Done Edditing detail","Not editing detail",Colors.redAccent,Colors.green,true);
      }
    } catch (e) {
      print(e);
      Navigator.of(context).pop();
      Showsnack(context,"Done Edditing detail","Error edditing detail",Colors.redAccent,Colors.green,false);

    }
  }
}