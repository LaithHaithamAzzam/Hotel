class NotificationModel {
  bool? state;
  List<Data>? data;

  NotificationModel({this.state, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  List<int>? roomNumber;
  String? startDate;
  String? endDate;

  Data({this.name, this.roomNumber, this.startDate, this.endDate});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    roomNumber = json['roomNumber'].cast<int>();
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['roomNumber'] = this.roomNumber;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}
