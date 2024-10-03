import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/controller/AllHotelAPI.dart';
import 'package:hotel/controller/GetHotelHomeScreen.dart';
import 'package:hotel/controller/GetWallet.dart';
import 'package:hotel/controller/HotelRoomsAPI.dart';
import 'package:hotel/view/AdminScreen/Admin.dart';
import 'package:hotel/view/HotelScreen/MainHotelScreen.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';

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
      CancelToken canseltoken = CancelToken();
      loding(context , canseltoken);
      var Res = await Dio().post(cancelToken: canseltoken ,"${global.SERVER}${global.Login}",
          options: Options(
              headers: {
                'accept': 'application/json',
              }
          ),
          data: {
            "userName":userName,
            "password":password,
          });

      if(Res.statusCode == 200){
        print(Res.data);
        await prefs.setString("Name", "${Res.data['name']}");
        await prefs.setString("Token", "${Res.data['token']}");
        await prefs.setString("username", "$userName");
        await prefs.setString("Islogin", "true");
        await prefs.setString("rool", "${Res.data['roll']}");
        await prefs.setString("imageid", "${Res.data['imageId']}");
        print( "${Res.data['roll']}");
       if(Res.data['roll'] == "user"){
         await GetWallet(context).getWallet();
         await allHotelAPI(context).allHotel();
         Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("${Res.data['name']}", "${Res.data['token']}","${Res.data['userName']}","${Res.data['imageId']}");
         Navigator.of(context).pop();
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
       }else  if(Res.data['roll'] == "hotel"){

         Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("${Res.data['name']}", "${Res.data['token']}","${Res.data['userName']}","${Res.data['imageId']}");
         await GetHotelHomeScreen(context).getHotelHomeScreen();
         await hotelRoomsAPI(context).hotelRooms((DateTime.now().year-DateTime.now().month-DateTime.now().day).toString(), (DateTime.now().year-DateTime.now().month-DateTime.now().day+1).toString());
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHotelHomeScreen(),),(route) => false,);
       }else  if(Res.data['roll'] == "admin"){
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AdminScreen(),), (route) => false);
       }
        }
      else if (Res.statusCode == 210){
        Navigator.of(context).pop();
        showSnackBar(context, "Wrong User Name Or Password", Colors.redAccent, false);
      }

    }catch (e){
      Navigator.of(context).pop();
      print(e);
    }

  }
}