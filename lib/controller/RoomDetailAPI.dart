import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/AllHotelsModel.dart';
import 'package:hotel/Models/RoomNumperDetail.dart';
import 'package:hotel/Providers/RoomDertailProvider.dart';
import 'package:hotel/view/HotelScreen/UpdateRoom.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/allHotelProvider.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class RoomDetailAPI {
  RoomDetailAPI(this.context);
  BuildContext context;
  Dio dio = Dio();
  roomDetailAPI(int roomid) async {
    CancelToken canseltoken = CancelToken();
    loding(context , canseltoken);
    SharedPreferences shprefs =await SharedPreferences.getInstance();
    String? token =await shprefs.getString("Token");
    String myurl = "${global.SERVER}""${global.roomDetail}";
    try {
      var response = await dio.get(cancelToken: canseltoken,myurl,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': 'Bearer ${token}'
          }),
      data: {
        "roomId":roomid
      }
      );
      print(response.data);
      if(response.statusCode == 200){
        RoomNumperDetail roomdetail = RoomNumperDetail.fromJson(response.data);
         Provider.of<RoomDertailProvider>(context , listen: false).Setdate(roomdetail.roomDetail!, roomdetail.bookings!);
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateRoom(roomid:roomid , Tex: (Provider.of<RoomDertailProvider>(context , listen: false).roomDetail!.price).toString()),));
      }
      return response.statusCode;
    } catch (e) {
      Navigator.of(context).pop();
    }
  }
}
