class HotelHomeScreenModel {
  bool? state;
  int? roomCount;
  List<Rooms>? rooms;

  HotelHomeScreenModel({this.state, this.roomCount, this.rooms});

  HotelHomeScreenModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    roomCount = json['roomCount'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['roomCount'] = this.roomCount;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? id;
  int? roomNumber;
  bool? isBooked;

  Rooms({this.id, this.roomNumber, this.isBooked});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNumber = json['roomNumber'];
    isBooked = json['isBooked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomNumber'] = this.roomNumber;
    data['isBooked'] = this.isBooked;
    return data;
  }
}
