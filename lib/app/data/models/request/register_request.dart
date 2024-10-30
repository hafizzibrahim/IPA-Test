import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  String name;
  String email;
  int gender;
  int provinceId;
  String password;
  String passwordConfirmation;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.gender,
    required this.provinceId,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        provinceId: json["province_id"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "province_id": provinceId,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
