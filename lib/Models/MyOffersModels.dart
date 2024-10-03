class AllMyOffersModel {
  bool? state;
  List<Data>? data;

  AllMyOffersModel({this.state, this.data});

  AllMyOffersModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? newPrice;
  String? startOfferDate;
  String? endOfferDate;
  String? type;
  String? price;
  int? roomNumber;
  dynamic discount;

  Data(
      {this.id,
        this.newPrice,
        this.startOfferDate,
        this.endOfferDate,
        this.type,
        this.price,
        this.roomNumber,
        this.discount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newPrice = json['newPrice'];
    startOfferDate = json['startOfferDate'];
    endOfferDate = json['endOfferDate'];
    type = json['type'];
    price = json['price'];
    roomNumber = json['roomNumber'];
    discount = json['discount'];
  }
}
