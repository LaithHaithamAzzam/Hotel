import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/DateProvider.dart';
import 'package:hotel/Providers/HotelRoomsProvider.dart';
import 'package:hotel/Providers/NotificationProvider.dart';
import 'package:hotel/Providers/SelectRoomsProvider.dart';
import 'package:hotel/controller/GetNotifications.dart';
import 'package:hotel/controller/GetWallet.dart';
import 'package:hotel/view/HomeScreen/Notification.dart';
import 'package:hotel/view/HotelScreen/DoneBooking.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:hotel/view/Wallet/SelectedPay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class BookingAPI {
  BookingAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  Booking(String startdate, String enddate , List<String> roomid , double total) async {
    if (startdate.isNotEmpty && enddate.isNotEmpty&& roomid.isNotEmpty) {
      CancelToken canseltoken = CancelToken();
      loding(context , canseltoken);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? Token = prefs.getString("Token");
      String myurl = "${global.SERVER}""${global.addBooking}";
      try {
        var response = await dio.post(cancelToken: canseltoken,myurl,
            options: Options(headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token' //add token
            }),
            data: {
              "startDate":startdate,
              "endDate":enddate,
              "roomId":roomid,
              "total":total
            }
        );
        if(response.statusCode == 200){
         await Getnoti(context).getnoti();
         NotificationService.showNotification("successful Booking Room".tr,"Your Room IS".tr+" ${Provider.of<SelectRoomsProvider>(context,listen: false).Rooms}");
          Provider.of<NotificationProvider>(context , listen: false).AddCountNotification(1);
          await GetWallet(context).getWallet();
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DoneBooking(),),(route) => false,);
        }else if(response.statusCode == 210){
          Navigator.of(context).pop();
          Showsnack(context,"Done Edditing detail","${response.data['data']} is Booking Another User",Colors.redAccent,Colors.redAccent,false);
        }if(response.statusCode == 250){
          Navigator.of(context).pop();
          Showsnack(context,"Done Edditing detail","Charge Your Wallet And Try Again",Colors.redAccent,Colors.redAccent,false);
        }
      } catch (e) {
        print(e);
        Navigator.of(context).pop();
        Showsnack(context,"Done Add Admin","Error Setelct Total",Colors.redAccent,Colors.green,false);

      }
    } else {
      Showsnack(context,"","Not Allow Null Value",Colors.redAccent,Colors.green,false);
    }
  }
}