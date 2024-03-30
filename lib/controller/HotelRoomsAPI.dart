import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class hotelRoomsAPI {
  hotelRoomsAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  hotelRooms() async {
    String myurl = "${global.SERVER}/";
    try {
      var response = await dio.post(myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer' //add token
          }));
      return response.statusCode;
    } catch (e) {
      print('hotel rooms field');
    }
  }
}
