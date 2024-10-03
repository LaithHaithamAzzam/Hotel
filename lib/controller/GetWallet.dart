import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Providers/MyWallet_Provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart' as global;

class GetWallet {
  GetWallet(this.context);
  BuildContext context;
  Dio dio = Dio();
  getWallet() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? Token = prefs.getString("Token");
      String myurl = "${global.SERVER}""${global.getWallet}";
      try {
        var response = await dio.get(myurl,
            options: Options(headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token' //add token
            }),
        );
        print(response.data);
        if(response.data['state']==true){
          Provider.of<WalletProvider>(context , listen: false).ChargeWallet(double.parse((response.data['data']).toString()));
        }
      } catch (e) {
        print(e);
      }
  }
}