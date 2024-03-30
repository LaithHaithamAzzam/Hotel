import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class addFavouriteAPI {
  addFavouriteAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  addFavourite(int hotelID) async {
    String myurl = "${global.SERVER}/";
    try {
      var response = await dio.post(myurl,
          data: {
            "id": hotelID,
          },
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer' //add token
          }));
      return response.statusCode;
    } catch (e) {
      print('booking room field');
    }
  }
}
