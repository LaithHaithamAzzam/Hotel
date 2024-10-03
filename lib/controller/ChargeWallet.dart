import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class ChargeWallet {
  ChargeWallet(this.context);

  BuildContext context;
  Dio dio = Dio();

  chargeWallet(String userName, String amount) async {
    if (userName.isNotEmpty && amount.isNotEmpty) {
      CancelToken canseltoken = CancelToken();
      loding(context , canseltoken);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? Token = prefs.getString("Token");
      String myurl = "${global.SERVER}""${global.updateWallet}";
      try {
        var response = await dio.post(cancelToken: canseltoken,myurl,
            options: Options(headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token' //add token
            }),
            data: {
              "userName":userName,
              "amount":amount,
            }
        );
        if(response.statusCode==200){
          Navigator.of(context).pop();
          Showsnack(context,"Done Charge $userName to $amount" ,"Error Charge $userName to $amount",Colors.redAccent,Colors.green,true);
        }else if(response.statusCode==210){
          Navigator.of(context).pop();
          Showsnack(context,"Done Charge $userName to $amount" ,"$userName ${(response.data['data'])} ",Colors.redAccent,Colors.green,false);
        }
      } catch (e) {
        print(e);
        Navigator.of(context).pop();
        Showsnack(context,"Done Charge $userName to $amount","ErrorCharge $userName to $amount",Colors.redAccent,Colors.green,false);

      }
    } else {
      Showsnack(context,"Done Add Admin $userName","Not Allow Null Value",Colors.redAccent,Colors.green,false);
    }
  }
}