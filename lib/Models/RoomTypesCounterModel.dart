class RoomTypesCounterModel {
  bool? state;
  Data? data;

  RoomTypesCounterModel({this.state, this.data});

  RoomTypesCounterModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? roomsCount;
  List<Rooms>? rooms;

  Data({this.roomsCount, this.rooms});

  Data.fromJson(Map<String, dynamic> json) {
    roomsCount = json['roomsCount'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomsCount'] = this.roomsCount;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? id;
  int? roomNumber;
  String? price;

  Rooms({this.id, this.roomNumber, this.price});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNumber = json['roomNumber'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomNumber'] = this.roomNumber;
    data['price'] = this.price;
    return data;
  }
}
