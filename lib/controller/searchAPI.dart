import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Models/AllHotelsSerchModel.dart';
import 'package:hotel/Providers/SerchProvider.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/HomeScreen/HotelsSerch.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class SearchAPI {
  SearchAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  searchcustom(String? country, String? city, int? price) async {
    if(country!.isEmpty && city!.isEmpty && price == 0){
      Navigator.of(context).pop();
      showSnackBar(context, "Not Allow Null Serch", Colors.redAccent, false);
    }else{
      CancelToken canseltoken = CancelToken();
      loding(context , canseltoken);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? Token = prefs.getString("Token");
      String myurl = "${global.SERVER}/search";

      try {
        var response = await dio.get(cancelToken: canseltoken,myurl,
            data: {"country": country, "city": city, "price": price},
            options: Options(headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token'
            }));
        print(response);

        if(response.statusCode==200){
          AllHotelsSerchModel serchmod = AllHotelsSerchModel.fromJson(response.data);
          Provider.of<SerchProvider>(context,listen: false).ResDataSerch(serchmod.data);
          Provider.of<SerchProvider>(context,listen: false).Setstate(true);
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HotelSerch(),));


        }
        return response.statusCode;
    }catch (e) {
        print('search field');
      }
    }
  }
}
