class LoginModel {
  bool? status;
  String? message;
  Data? data;
  String? token;
  int? code;

  LoginModel({this.status, this.message, this.data, this.token, this.code});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? username;
  String? collage;

  Data({this.username, this.collage});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    collage = json['collage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['collage'] = this.collage;
    return data;
  }
}
