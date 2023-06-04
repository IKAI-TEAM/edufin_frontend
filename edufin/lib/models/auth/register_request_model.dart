class RegisterRequestModel {
  String fullName;
  String email;
  int phoneNumber;
  String password;
  String governmentId;
  int accountType;

  RegisterRequestModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.governmentId,
    required this.accountType,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'governmentId': governmentId,
      'accountType': accountType,
    };
  }
}
