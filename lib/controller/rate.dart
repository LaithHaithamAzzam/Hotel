import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/MyOffersModels.dart';
import 'package:hotel/Providers/MyOffersProvider.dart';
import 'package:hotel/Providers/allHotelProvider.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:hotel/view/Offers/hotelOffers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class RateAPI {

  RateAPI(this.context);
  BuildContext context;
  Dio dio = Dio();
  Rate(int? rate , int? idhotel) async {
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = prefs.getString("Token");
    String myurl = "${global.SERVER}""${global.rate}";
    try {
      var response = await dio.post(cancelToken: canseltoken,myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }),
      data:
      {
        "rate":rate,
        "hotelId":idhotel
      }
      );
      if(response.statusCode==200) {
        Navigator.of(context).pop();
        Showsnack(context,"Done Rated Hotel $rate","Error Rated as $rate",Colors.redAccent,Colors.green,true);
      }
    } catch (e) {
      print(e);
      Showsnack(context,"Done Rated Hotel $rate","Error Rated as $rate",Colors.redAccent,Colors.redAccent,false);
      Navigator.of(context).pop();
    }
  }
}