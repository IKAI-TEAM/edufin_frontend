class RegisterResponseModel {
  String? error;
  String? message;

  RegisterResponseModel({this.error, this.message});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      error: json['error'],
      message: json['message'],
    );
  }
}