import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/controller/AllMyOffers.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/SelectRoomsOfferProvider.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class AddOfferAPI{
  BuildContext context;
  AddOfferAPI(this.context);
  addOffer(double offerDiscount , List<String> rooms , String startDate , String endDate)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Token = await prefs.getString("Token");
    CancelToken canseltoken = CancelToken();
    print(Token);
    try {
      loding(context , canseltoken);
      var Res = await Dio().post(cancelToken: canseltoken,"${global.SERVER}${global.addOffer}",
          options: Options(
              headers: {
                'accept': 'application/json',
                'authorization': 'Bearer $Token'
              }
          ),
        data: {
        'roomNumber':rooms,
          'startDate':startDate,
          'endDate':endDate,
          'discount':offerDiscount
        }
      );
      if(Res.statusCode == 200){
        Provider.of<SelectRoomsOfferProvider>(context , listen: false).Rooms!.clear();
        Provider.of<SelectRoomsOfferProvider>(context , listen: false).Startdate = null;
        Provider.of<SelectRoomsOfferProvider>(context , listen: false).Enddate = null;
        await AllMyOffers(context).allMyOffers(true);
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Showsnack(context,"Done Add Offers","Not Add offers",Colors.redAccent,Colors.green,true);

      }
      if(Res.statusCode == 210){
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Showsnack(context,"Done Add Offers","Room  ${Res.data['data']}  is Has offer in this date",Colors.redAccent,Colors.green,false);
      }
    }catch (e){
      Navigator.of(context).pop();
      Showsnack(context,"Done Add offers","Error Add offers",Colors.redAccent,Colors.green,false);
      print(e);
    }
  }
}