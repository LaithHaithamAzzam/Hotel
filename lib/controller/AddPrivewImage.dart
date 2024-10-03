import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/controller/GetHotelHomeScreen.dart';
import 'package:hotel/controller/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/MyWidgite/Loading.dart';

class AddPrivewImage {
  AddPrivewImage(this.context);
  BuildContext context;
  Dio dio = Dio();
  addPrivewImage(File? image) async {
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image!.path),
    });
    SharedPreferences shprefs =await SharedPreferences.getInstance();
    String? token =await shprefs.getString("Token");
    String myurl = "${SERVER}""${addImage}";
    try {
      var response = await dio.post(cancelToken: canseltoken,myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${token}'
          }),
      data: formData
      );
     if(response.statusCode == 200){
       GetHotelHomeScreen(context).getHotelHomeScreen();
       Navigator.of(context).pop();
     }
    } catch (e) {
      print(e);
    }
  }
}
