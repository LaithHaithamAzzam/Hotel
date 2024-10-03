import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class AddAdminAPI {
  AddAdminAPI(this.context);

  BuildContext context;
  Dio dio = Dio();

  addAdmin(String userName, String Password) async {
    CancelToken canseltoken = CancelToken();
    if (userName.isNotEmpty && Password.isNotEmpty) {
      loding(context , canseltoken);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? Token = prefs.getString("Token");
      String myurl = "${global.SERVER}""${global.addAdmin}";
      try {
        var response = await dio.post(myurl,cancelToken: canseltoken,
            options: Options(headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token' //add token
            }),
            data: {
              "userName":userName,
              "password":Password,
            }
        );
        if(response.statusCode == 200){
          Navigator.of(context).pop();
          Showsnack(context,"Done Add Admin $userName","Error Add Admin $userName",Colors.redAccent,Colors.green,true);
        }else  if(response.statusCode == 210){
          Navigator.of(context).pop();
          Showsnack(context,"Done Add Admin $userName","Error the username $userName is already exist",Colors.redAccent,Colors.redAccent,false);
        }
      } catch (e) {
        print(e);
        Navigator.of(context).pop();
        Showsnack(context,"Done Add Admin $userName","Error Add Admin $userName",Colors.redAccent,Colors.redAccent,false);

      }
    } else {
      Showsnack(context,"Done Add Admin $userName","Not Allow Null Value $userName",Colors.redAccent,Colors.redAccent,false);
    }
  }
}