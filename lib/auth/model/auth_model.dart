class AuthModel {
  String? emailOrPhone;
  String? password;
  String? token;
  String? id;

  AuthModel({this.emailOrPhone, this.password, this.token, this.id});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'],
      id: json['id'],
    );
  }
}
