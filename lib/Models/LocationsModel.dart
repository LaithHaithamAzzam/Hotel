class Locations {
  bool? state;
  List<Data>? data;

  Locations({this.state, this.data});

  Locations.fromJson(Map<String, dynamic> json) {
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
  String? country;
  String? city;

  Data({this.id, this.country, this.city});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    city = json['city'];
  }

}
