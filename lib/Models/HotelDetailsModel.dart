class hotelDetail {
  bool? state;
  Data? data;

  hotelDetail({this.state, this.data});

  hotelDetail.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? roomCounts;
  String? detail;
  String? locationDetail;
  int? userId;
  bool? isFav;
  int? imageId;
  String? name;
  String? minPrice;
  int? rate;
  Location? location;
  List<int>? preview;

  Data(
      {this.roomCounts,
        this.detail,
        this.locationDetail,
        this.userId,
        this.isFav,
        this.imageId,
        this.name,
        this.minPrice,
        this.rate,
        this.location,
        this.preview});

  Data.fromJson(Map<String, dynamic> json) {
    roomCounts = json['roomCounts'];
    detail = json['detail'];
    locationDetail = json['locationDetail'];
    userId = json['userId'];
    isFav = json['isFav'];
    imageId = json['imageId'];
    name = json['name'];
    minPrice = json['minPrice'];
    rate = json['rate'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    preview = json['preview'].cast<int>();
  }

}

class Location {
  String? country;
  String? city;

  Location({this.country, this.city});

  Location.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
  }

}