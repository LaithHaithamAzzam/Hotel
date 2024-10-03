import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/view/AdminScreen/Admin.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
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
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    try {

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
        "image": image.path.isNotEmpty ? await MultipartFile.fromFile(image.path) : null,
      });
      var Res = await Dio().post(cancelToken: canseltoken,"${global.SERVER}${global.CreateHotel}",
        options: Options(
            headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token'
            }
        ),
        data:formData
      );

      if(Res.statusCode == 200){
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => AdminScreen(),
            ),
                (route) => false);
      }else if(Res.statusCode == 210){
        Navigator.of(context).pop();
        Showsnack(context,"Done Add Admin $username","Error the username $username is already exist",Colors.redAccent,Colors.redAccent,false);
      }
    }catch (e){
      Navigator.of(context).pop();
      Showsnack(context,"Done Add Admin $username","Error Enknow",Colors.redAccent,Colors.redAccent,false);

    }

  }
}