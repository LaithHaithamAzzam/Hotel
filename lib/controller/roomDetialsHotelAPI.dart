import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class roomDetialsHotelAPI {
  roomDetialsHotelAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  roomDetialsHotel(int roomid) async {
    String myurl = "${global.SERVER}/";
    try {
      var response = await dio.post(myurl,
          data: {"id": roomid},
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer' //add token
          }));
      return response.statusCode;
    } catch (e) {
      print('room deatials field');
    }
  }
}
