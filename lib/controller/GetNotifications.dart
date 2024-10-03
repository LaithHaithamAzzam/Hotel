import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/MyOffersModels.dart';
import 'package:hotel/Models/Notification_Model.dart';
import 'package:hotel/Providers/MyOffersProvider.dart';
import 'package:hotel/Providers/NotificationProvider.dart';
import 'package:hotel/view/Offers/hotelOffers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class Getnoti {

  Getnoti(this.context);
  BuildContext context;
  Dio dio = Dio();
  getnoti() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = prefs.getString("Token");
    String myurl = "${global.SERVER}""${global.GetNotifications}";
    try {
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }));
      if(response.statusCode==200){
        NotificationModel notimodel = NotificationModel.fromJson(response.data);
        Provider.of<NotificationProvider>(context , listen: false).SetData(notimodel.data);
      }
    } catch (e) {
      print(e);
    }
  }
}