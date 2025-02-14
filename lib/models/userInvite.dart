// ignore_for_file: non_constant_identifier_names, file_names

class UserInvited {
  String? first_name;
  String? phone_number;

  UserInvited({this.first_name, this.phone_number});
  factory UserInvited.fromJson(Map<String, dynamic> json) {
    return UserInvited(
        first_name: json['first_name'],
        phone_number: json['phone_number']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'first_name': first_name,
      'phone_number': phone_number,
    };
  }
}
class UserInviteList {
  List<UserInvited>? userlist;

  UserInviteList({this.userlist});

  factory UserInviteList.fromJson(Map<String, dynamic> json) {
    return UserInviteList(
        userlist: json['userlist']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userlist': userlist,
    };
  }
}
