import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/view/AdminScreen/Admin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/HomeScreen/MainHomeScreen.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class CreateHotelAccount{
  BuildContext context;
  CreateHotelAccount(this.context);
  createHotelAccount(String name,String username,String password,int LocationID,int roomcount,double MinimumPrice,String LocationDetail,String Detail,String Roomtype,File image)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = await prefs.getString("Token");

    try {
      loding(context);
      FormData formData =FormData.fromMap({
        "name":name,
        "password":password,
        "userName":username,
        "locationDetail":LocationDetail,
        "locationId":LocationID,
        "detail":Detail,
        "roomCounts":roomcount,
        "roomDefault":Roomtype,
        "minPrice":MinimumPrice,
        "image": await MultipartFile.fromFile(image.path),
      });
      var Res = await Dio().post("${global.SERVER}${global.CreateHotel}",
        options: Options(
            headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token'
            }
        ),
        data:formData
      );
      print(Res.data);
      if(Res.data['state'] == true){
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => AdminScreen(),
            ),
                (route) => false);
      }
    }catch (e){
      Navigator.of(context).pop();
      print(e);
    }

  }
}