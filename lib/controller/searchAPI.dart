import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class SearchAPI {
  SearchAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  searchcustom(String location, String roomtype, int price) async {
    String myurl = "${global.SERVER}/";
    try {
      var response = await dio.post(myurl,
          data: {"location": location, "roomtype": roomtype, "price": price},
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer'
          }));
      return response.statusCode;
    } catch (e) {
      print('search field');
    }
  }
}
