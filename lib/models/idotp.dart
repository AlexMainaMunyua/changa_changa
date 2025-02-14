class UserOtp {
  int? status;
  String? message;
  String? detail;
  UserDetail? user;
  String? request_id;

  UserOtp({
    this.status,
    this.message,
    this.detail,
    this.user,
    this.request_id,
  });

  factory UserOtp.fromJson(Map<String, dynamic> json) {
    return UserOtp(
      status: json['status'],
      message: json['message'],
      detail: json['detail'],
      request_id: json['request_id'],
      user: UserDetail.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'detail': detail,
        'request_id': request_id,
        'user': user?.toJson(),
      };
}

class UserDetail {
  String? firstName;
  String? username;
  String? emailAddress;
  String? phoneNumber;
  bool? isActive;
  String? userId;
  String? title;
  String? profilePhoto;
  String? dateJoinedUtc;

  UserDetail({
    this.firstName,
    this.username,
    this.emailAddress,
    this.phoneNumber,
    this.isActive,
    this.userId,
    this.title,
    this.profilePhoto,
    this.dateJoinedUtc,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      firstName: json['first_name'],
      username: json['username'],
      emailAddress: json['email_address'],
      phoneNumber: json['phone_number'],
      isActive: json['is_active'],
      userId: json['user_id'],
      title: json['title'],
      profilePhoto: json['profile_photo'],
      dateJoinedUtc: json['date_joined_utc'],
    );
  }

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'username': username,
        'email_address': emailAddress,
        'phone_number': phoneNumber,
        'is_active': isActive,
        'user_id': userId,
        'title': title,
        'profile_photo': profilePhoto,
        'date_joined_utc': dateJoinedUtc,
      };
}
