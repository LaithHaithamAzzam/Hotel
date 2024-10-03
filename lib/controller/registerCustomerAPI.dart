import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/controller/AllHotelAPI.dart';
import 'package:hotel/controller/GetWallet.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
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
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    try {
      FormData formdata = FormData.fromMap({
      "userName":userName,
      "password":password,
      "name":name,
      "image" : image.path.isNotEmpty ? await MultipartFile.fromFile(image.path) : null
      });
      var Res = await Dio().post(cancelToken: canseltoken,"${global.SERVER}${global.Register}",
          options: Options(
          headers: {
            'accept': 'application/json',
          }
          ),

           data: formdata
      );
      print(Res.data);
      if(Res.statusCode == 200){
        await prefs.setString("Token", "${Res.data['token']}");
        await prefs.setString("Name", "${Res.data['name']}");
        await prefs.setString("username", "${userName}");
        await prefs.setString("Islogin", "true");
        await prefs.setString("rool", "user");
        await prefs.setString("imageid", "${Res.data['imageId']}");
        await GetWallet(context).getWallet();
        await allHotelAPI(context).allHotel();
        Navigator.of(context).pop();
        Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("${Res.data['name']}", "${Res.data['token']}","$userName","${Res.data['imageId']}");
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
      } else if(Res.statusCode == 210){
        Navigator.of(context).pop();
      showSnackBar(context, "The User Name Already Exists", Colors.redAccent, false);
      }else{
        Navigator.of(context).pop();
        print("mdslklds");
      }
    }catch (e){
      Navigator.of(context).pop();
      print("register hotel field");
      print(e);
    }

  }
}