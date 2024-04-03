import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/RoomTypesModel.dart';
import 'package:hotel/Providers/roomTypesProvider.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;

class roomsDetialsHotelAPI {
  roomsDetialsHotelAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  roomDetialsHotel(int hotelid) async {
    String myurl = "${global.SERVER}""${global.getHotelRoomTypes}";
    try {
      var response = await dio.get(myurl,
          data: {"hotelId": hotelid},
          options: Options(headers: {
            'accept': 'application/json',
          }));
      print(response);
      RoomTypesModel model = RoomTypesModel.fromJson(response.data);
      Provider.of<RoomTypesProvider>(context,listen: false).RoomTypes(model.data);
      return response.statusCode;
    } catch (e) {
      print(e);
      print('room deatials field');
    }
  }
}
