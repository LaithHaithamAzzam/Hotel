import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Models/AllHotelsModel.dart';
import 'package:hotel/Providers/SetRateProvider.dart';
import 'package:hotel/Providers/allHotelProvider.dart';
import 'package:hotel/controller/HotelRoomsTypes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/HotelDetailsModel.dart';
import '../Providers/HotelRoomsProvider.dart';
import '../view/HotelScreen/Detail_Hotel_User.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class GetHotel{
  BuildContext context;
  GetHotel(this.context);
  getHotel(String hotelid , int heroindex , bool isserch)async{
    CancelToken canseltokens = CancelToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String? Token = await prefs.getString("Token");
    try {
      loding(context, canseltokens);
      var Res = await Dio().get(cancelToken: canseltokens,"${global.SERVER}${global.getHotel}",
        options: Options(
            headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token'
            }
        ),
        data: {
        'id':hotelid
        }
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

        try{
          Provider.of<HotelRoomsProvider>(context , listen: false).setDate(Res.data['data']['offer']['startOfferDate'],Res.data['data']['offer']['endOfferDate']);
        }
        catch (e){
          Provider.of<HotelRoomsProvider>(context , listen: false).setDate(null,null);
        }

        int rate = Res.data['data']['userRate'] == null ? 0 : Res.data['data']['userRate'];
        Provider.of<SetRateProvider>(context , listen: false).setrate(rate);
        int ratee = Provider.of<HotelRoomsProvider>(context,listen: false).rate == null?0:Provider.of<HotelRoomsProvider>(context,listen: false).rate;
        Provider.of<allHotelProvider>(context,listen: false).setRate(ratee, heroindex);
        await roomsDetialsHotelAPI(context).roomDetialsHotel(int.parse(hotelid.toString()));
        Navigator.of(context).pop();
       isserch == false ?
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              Detile_Hotel(Herotag: "Hotel$heroindex", index: heroindex,hotelid: int.parse((hotelid).toString())),
        )):Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              Detile_Hotel(isserch: isserch,Herotag: "Hotel$heroindex", index: heroindex,hotelid: int.parse((hotelid).toString())),
        ));
      }
    }catch (e){
      Navigator.of(context).pop();
      print(e);
    }

  }
}