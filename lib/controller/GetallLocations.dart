import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel/view/HotelScreen/HotelDateils.dart';
import 'package:provider/provider.dart';
import '../Models/LocationsModel.dart';
import '../Providers/LocationsProvider.dart';
import '../view/MyWidgite/Loading.dart';
import 'api.dart' as global;

class GetAllLocations{
  BuildContext context;
  GetAllLocations(this.context);
  getAllLocations()async{
    try {
      CancelToken canseltoken = CancelToken();
      loding(context , canseltoken);
      var Res = await Dio().get(cancelToken: canseltoken,"${global.SERVER}${global.getAllLocations}",
          options: Options(
              headers: {
                'accept': 'application/json',
              }
          ),
         );
      print(Res.data);
      if(Res.data['state'] == true){
        Navigator.of(context).pop();
        Locations locmodel = Locations.fromJson(Res.data);
        Provider.of<LocationProvider>(context,listen: false).Alllocations(locmodel.data as List<Data>);
        print( Provider.of<LocationProvider>(context,listen: false).data?.elementAt(0).city);
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => HotelDetails(),));
       }

    }catch (e){
      Navigator.of(context).pop();
      print(e);
    }

  }
}