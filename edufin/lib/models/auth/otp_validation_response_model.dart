import 'dart:convert';

OtpValidationResponseModel otpValidationResponseJson(String str) =>
	OtpValidationResponseModel.fromJson(json.decode(str));

class OtpValidationResponseModel {
  bool? success;
  bool? oldUser;

  OtpValidationResponseModel({this.success, this.oldUser});

  OtpValidationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    oldUser = json['OldUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['OldUser'] = this.oldUser;
    return data;
  }
}