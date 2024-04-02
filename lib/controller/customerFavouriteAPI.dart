import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class customerFavouriteAPI {
  customerFavouriteAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  customerFavourite() async {
    String myurl = "${global.SERVER}";
    try {
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer' //add token
          }));
      return response.statusCode;
    } catch (e) {
      print('favourite field');
    }
  }
}
