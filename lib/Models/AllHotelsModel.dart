class AllHotelModel {
  bool? state;
  List<Data>? data;

  AllHotelModel({this.state, this.data});

  AllHotelModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? locationDetail;
  int? userId;
  bool? isFav;
  int? imageId;
  String? name;
  String? minPrice;
  int? rate;
  Location? location;
  bool? isOffer;

  Data(
      {this.locationDetail,
        this.userId,
        this.isFav,
        this.imageId,
        this.name,
        this.minPrice,
        this.rate,
        this.location,
        this.isOffer});

  Data.fromJson(Map<String, dynamic> json) {
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
    isOffer = json['isOffer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locationDetail'] = this.locationDetail;
    data['userId'] = this.userId;
    data['isFav'] = this.isFav;
    data['imageId'] = this.imageId;
    data['name'] = this.name;
    data['minPrice'] = this.minPrice;
    data['rate'] = this.rate;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['isOffer'] = this.isOffer;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}
