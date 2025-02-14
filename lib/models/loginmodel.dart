// ignore_for_file: non_constant_identifier_names

class UserLogin {
  String? username;
  String? phone_number;
  String? password;

  UserLogin({
    this.username,
    this.phone_number,
    this.password,

  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        username: json['username'],
        phone_number: json['phone_number'],
        password: json['password'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'phone_number': phone_number,
      'username': username,
      'password': password,
    };
  }
}
