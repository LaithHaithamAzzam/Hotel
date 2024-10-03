import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/RoomTypesCounterModel.dart';
import 'package:hotel/Models/RoomTypesModel.dart';
import 'package:hotel/Providers/roomTypeCounterProvider.dart';
import 'package:hotel/Providers/roomTypesProvider.dart';
import 'package:hotel/view/MyWidgite/Loading.dart';
import 'package:provider/provider.dart';
import 'api.dart' as global;

class roomTypeCounterAPI {
  roomTypeCounterAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  roomTypeCounter(int hotelid,String type) async {
    String myurl = "${global.SERVER}""${global.getHotelRoomsByType}";
    try {
      CancelToken canseltoken = CancelToken();
      loding(context , canseltoken);
      var response = await dio.get(cancelToken: canseltoken,myurl,
          data: {"hotelId": hotelid,
          "type":type
          },
          options: Options(headers: {
            'accept': 'application/json',

          }));
      print(response);
      if(response.statusCode==200){
        Navigator.of(context).pop();
        RoomTypesCounterModel model =
            RoomTypesCounterModel.fromJson(response.data);
        Provider.of<roomTypeCounterProvider>(context, listen: false)
            .roomTypeCounter(model);
      }
      return response.statusCode;
    } catch (e) {
      Navigator.of(context).pop();
      print(e);
      print('room type counter field');
    }
  }
}
