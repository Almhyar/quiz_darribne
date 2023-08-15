class ProfileModel {
  bool? status;
  String? message;
  Data? data;
  int? code;

  ProfileModel({this.status, this.message, this.data, this.code});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? username;
  int? phone;
  String? image;

  Data({this.username, this.phone, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['image'] = this.image;
    return data;
  }
}
