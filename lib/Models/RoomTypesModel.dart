class RoomTypesModel {
  bool? state;
  List<String>? data;

  RoomTypesModel({this.state, this.data});

  RoomTypesModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['data'] = this.data;
    return data;
  }
}
