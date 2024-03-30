import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class HotelSelectionDetialsAPI {
  HotelSelectionDetialsAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  HotelSelectionDetials(int index) async {
    String myurl = "${global.SERVER}/";
    try {
      var response = await dio.post(myurl,
          data: {"id": index},
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer'
          }));
      return response.statusCode;
    } catch (e) {
      print('Hotel Selection Details field');
    }
  }
}
