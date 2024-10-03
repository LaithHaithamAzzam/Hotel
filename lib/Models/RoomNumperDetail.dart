class RoomNumperDetail {
  bool? state;
  RoomDetail? roomDetail;
  List<Bookings>? bookings;

  RoomNumperDetail({this.state, this.roomDetail, this.bookings});

  RoomNumperDetail.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    roomDetail = json['roomDetail'] != null
        ? new RoomDetail.fromJson(json['roomDetail'])
        : null;
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
  }

}

class RoomDetail {
  int? roomNumber;
  String? type;
  String? price;

  RoomDetail({this.roomNumber, this.type, this.price});

  RoomDetail.fromJson(Map<String, dynamic> json) {
    roomNumber = json['roomNumber'];
    type = json['type'];
    price = json['price'];
  }
}

class Bookings {
  String? startDate;
  String? endDate;

  Bookings({this.startDate, this.endDate});

  Bookings.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    endDate = json['endDate'];
  }
}
