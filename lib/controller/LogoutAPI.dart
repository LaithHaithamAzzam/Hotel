import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:hotel/view/SplashScreen/LoginAndRegister.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class Logout {

  Logout(this.context);
  BuildContext context;
  Dio dio = Dio();
  logout() async {
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = prefs.getString("Token");
    String myurl = "${global.SERVER}""${global.logout}";
    try {
      var response = await dio.post(cancelToken: canseltoken,myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $Token' //add token
          }),
      );
      if(response.statusCode==200) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginAndRegisterScreen(),));
        await prefs.clear();
      }
    } catch (e) {

      Showsnack(context,"Done Rated Hotel","Error Logout Please Try Again",Colors.redAccent,Colors.redAccent,false);
      Navigator.of(context).pop();

    }
  }
}