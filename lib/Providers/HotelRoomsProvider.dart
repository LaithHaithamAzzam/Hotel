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
  double? rate;
  String? country;
  String? city;
  List<int>? preview;
  setHotelRooms(
  String RoomCounts,
  String? Detail,
  String? LocationDetail,
  int? UserId,
  bool? IsFav,
  int? ImageId,
  String? Name,
  String? MinPrice,
      double? Rate,
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
}
