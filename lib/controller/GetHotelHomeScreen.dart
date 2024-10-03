import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Providers/HotelHomeScreen_Provider.dart';
import 'package:hotel/Providers/roomTypesProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/HotelDetailsModel.dart';
import '../Providers/HotelRoomsProvider.dart';
import 'api.dart' as global;

class GetHotelHomeScreen{
  BuildContext context;
  GetHotelHomeScreen(this.context);
  getHotelHomeScreen()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String? Token = await prefs.getString("Token");
    try {
      var Res = await Dio().get("${global.SERVER}${global.getHoteldetail}",
        options: Options(
            headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token'
            }
        ),
      );
      print(Res.data);
      if(Res.data['state'] == true){
        print(Res.data);
        hotelDetail hoteldet = hotelDetail.fromJson(Res.data);
        Provider.of<HotelRoomsProvider>(context , listen: false).setHotelRooms(

            (hoteldet.data!.roomCounts).toString(),
            hoteldet.data!.detail,
            hoteldet.data!.locationDetail,
            hoteldet.data!.userId,
            hoteldet.data!.isFav,
            hoteldet.data!.imageId,
            hoteldet.data!.name,
            hoteldet.data!.minPrice,
            hoteldet.data!.rate,
            hoteldet.data!.location!.country.toString(),
            hoteldet.data!.location!.city.toString(),
            hoteldet.data!.preview
        );
        Provider.of<RoomTypesProvider>(context,listen: false).HomeScreenHotel(Res.data['data']['types']);
        Provider.of<HotelHomeScreenProvider>(context,listen: false).Setprivid(Res.data['data']['preview']);
      }
      return Res.statusCode;
    }catch (e){
      print("saljdklsajdkljsakljdklsjakld");
      print(e);
    }
  }
}