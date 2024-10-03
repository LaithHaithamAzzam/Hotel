import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Providers/DateProvider.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:hotel/view/Wallet/SelectedPay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class RoomTotalAPI {
  RoomTotalAPI(this.context);

  BuildContext context;
  Dio dio = Dio();
  RoomTotal(String startdate, String enddate , List<String> roomid) async {
    if (startdate.isNotEmpty && enddate.isNotEmpty&& roomid.isNotEmpty) {
      CancelToken canseltoken = CancelToken();
      loding(context , canseltoken);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? Token = prefs.getString("Token");
      String myurl = "${global.SERVER}""${global.getBookingPrice}";
      try {
        var response = await dio.get(cancelToken: canseltoken,myurl,
            options: Options(headers: {
              'accept': 'application/json',
              'authorization': 'Bearer $Token' //add token
            }),
            data: {
              "startDate":startdate,
              "endDate":enddate,
              "roomId":roomid
            }
        );
        if(response.data['state']==true){
          print(response.data['data']);
          Provider.of<DateProvider>(context , listen: false).ChangeSallary(double.parse((response.data['data']).toString()));
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectPay(),));
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