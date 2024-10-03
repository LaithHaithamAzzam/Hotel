import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/MyOffersModels.dart';
import 'package:hotel/Providers/MyOffersProvider.dart';
import 'package:hotel/view/Offers/hotelOffers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class AllMyOffers {

  AllMyOffers(this.context);
  BuildContext context;
  Dio dio = Dio();
  allMyOffers(bool istest) async {
    CancelToken canseltoken = CancelToken();
   if(istest == false){
      loding(context , canseltoken);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = prefs.getString("Token");
    String myurl = "${global.SERVER}""${global.myOffers}";
    try {
      var response = await dio.get(cancelToken: canseltoken,myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }));
      if(response.statusCode==200){
        print(response.data);
      AllMyOffersModel myoffers = AllMyOffersModel.fromJson(response.data);
      Provider.of<MyOffersProvider>(context , listen: false).SetData(myoffers.data);
        if(istest == false){
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HotelOffers(),));
        }
      }
    } catch (e) {
      print(e);
      if(istest == false){
        Navigator.of(context).pop();
      }

    }
  }
}