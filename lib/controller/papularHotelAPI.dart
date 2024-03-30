import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class papularHotelAPI {
  papularHotelAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  papularHotel() async {
    String myurl = "${global.SERVER}/";
    try {
      var response = await dio.get(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer'
          }));
      return response.statusCode;
    } catch (e) {
      print('papular Hotel field');
    }
  }
}
