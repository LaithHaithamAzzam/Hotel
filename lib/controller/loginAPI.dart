import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/controller/AllHotelAPI.dart';
import 'package:hotel/view/AdminScreen/Admin.dart';
import 'package:hotel/view/HotelScreen/HotelProfile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/customerInformationProvider.dart';
import '../view/HomeScreen/MainHomeScreen.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class LoginAccount{
  BuildContext context;
  LoginAccount(this.context);
  loginAccount(String userName , String password)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      loding(context);
      var Res = await Dio().post("${global.SERVER}${global.Login}",
          options: Options(
              headers: {
                'accept': 'application/json',
              }
          ),
          data: {
            "userName":userName,
            "password":password,
          });

      if(Res.data['state'] == true){
        print(Res.data);
        await prefs.setString("Name", "${Res.data['user'][0]}");
        await prefs.setString("Token", "${Res.data['token']}");
        await prefs.setString("username", "$userName");
        await prefs.setString("Islogin", "true");
        await prefs.setString("rool", "${Res.data['user']['roll']}");
        print( "${Res.data['user']['roll']}");

       if(Res.data['user']['roll'] == "user"){
         await allHotelAPI(context).allHotel();
         Navigator.of(context).pop();
         Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("${Res.data['user'][0]}", "${Res.data['token']}","$userName");
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
       }else  if(Res.data['user']['roll'] == "hotel"){
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HotelProfile(),), (route) => false);
       }else  if(Res.data['user']['roll'] == "admin"){
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AdminScreen(),), (route) => false);
       }
        }
      else{
        Navigator.of(context).pop();
      }

    }catch (e){
      Navigator.of(context).pop();
      print(e);
    }

  }
}