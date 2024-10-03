import 'package:flutter/cupertino.dart';


class HotelRoomsProvider extends ChangeNotifier{
  String? roomCounts;
  String? detail;
  String? locationDetail;
  int? userId;
  bool? isFav;
  int? imageId;
  String? name;
  String? minPrice;
  dynamic rate;
  String? country;
  String? city;
  List<int>? preview;
  String? StartDate;
  String? EndDate;
  setHotelRooms(
  String RoomCounts,
  String? Detail,
  String? LocationDetail,
  int? UserId,
  bool? IsFav,
  int? ImageId,
  String? Name,
  String? MinPrice,
      dynamic? Rate,
  String Country,
  String City,
  List<int>? Preview,
      ) {
     roomCounts = RoomCounts;
     detail =Detail;
     locationDetail = LocationDetail;
     userId = UserId;
     isFav = IsFav;
     imageId = ImageId;
     name = Name;
     minPrice = MinPrice;
     rate = Rate;
     country = Country;
     city = City;
     preview = Preview;
    notifyListeners();
  }
  setDate(String? start,String? end){
    StartDate = start;
    EndDate = end;
    notifyListeners();
  }
}
