class ResisterModel {
  bool? status;
  String? message;
  String? data;
  int? code;

  ResisterModel({this.status, this.message, this.data, this.code});

  ResisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    data['code'] = this.code;
    return data;
  }
}