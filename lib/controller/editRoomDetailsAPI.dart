import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class editRoomDetailsAPI {
  editRoomDetailsAPI(this.context);
  BuildContext context;
  Dio dio = Dio();

  editRoomDetails(String roomtype, int price, image) async {
    String myurl = "${global.SERVER}";

    try {
      FormData formData = FormData.fromMap({
        "roomtype": roomtype,
        "price": price,
        'path': MultipartFile.fromBytes(image, filename: "name"),
      });
      var response = await dio.post(myurl,
          data: formData,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer' //add token
          }));
      return response.statusCode;
    } catch (e) {
      print('edit room field');
    }
  }
}
