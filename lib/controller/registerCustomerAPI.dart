import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/controller/AllHotelAPI.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/customerInformationProvider.dart';
import '../view/HomeScreen/MainHomeScreen.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class CreateAccount{
  BuildContext context;
CreateAccount(this.context);
  createAccount(String name , String userName , String password ,File image)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      loding(context);
      FormData formdata = FormData.fromMap({
      "userName":userName,
      "password":password,
      "name":name,
      "image" : await MultipartFile.fromFile(image.path),
      });
      var Res = await Dio().post("${global.SERVER}${global.Register}",
          options: Options(
          headers: {
            'accept': 'application/json',
          }
          ),

           data: formdata
      );
      print(Res.data);
      if(Res.data['state'] == true){
        await prefs.setString("Token", "${Res.data['token']}");
        await prefs.setString("Name", "${Res.data['name']}");
        await prefs.setString("Islogin", "true");
        await prefs.setString("rool", "user");
        await allHotelAPI(context).allHotel();
        Navigator.of(context).pop();
        Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("${Res.data['name']}", "${Res.data['token']}","$userName");
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
      }
      else{
        print("mdslklds");
      }
    }catch (e){

      print("register hotel field");
      print(e);
    }

  }
}