import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart' as global;

class bookingRoomAPI {
  bookingRoomAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  bookingRoom(int hotelID, String roomtype, int numberOfRoom,
      String bookingDate) async {
    String myurl = "${global.SERVER}";
    try {
      var response = await dio.post(myurl,
          data: {
            "id": hotelID,
            "roomtype": roomtype,
            "numberofroom": numberOfRoom,
            'date': bookingDate
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
