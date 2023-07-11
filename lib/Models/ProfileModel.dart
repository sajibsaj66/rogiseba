// ignore_for_file: file_names

class ProfileModel {
  String? data;
  List<User>? user;

  ProfileModel({this.data, this.user});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  int? userId;
  String? userProfilePhotoUrl;
  int? userAge;
  int? bloodGroupId;
  int? point;
  String? userEmail;
  String? gender;
  String? name;
  String? phoneNumber;
  String? ownReferCode;
  String? referCode;
  String? dateOfBirth;
  String? password;
  String? bloodGroupName;

  User(
      {this.id,
      this.userId,
      this.userProfilePhotoUrl,
      this.userAge,
      this.bloodGroupId,
      this.point,
      this.userEmail,
      this.gender,
      this.name,
      this.phoneNumber,
      this.ownReferCode,
      this.referCode,
      this.dateOfBirth,
      this.password,
      this.bloodGroupName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userProfilePhotoUrl = json['user_profile_photo_url'];
    userAge = json['user_age'];
    bloodGroupId = json['blood_group_id'];
    point = json['point'];
    userEmail = json['user_email'];
    gender = json['gender'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    ownReferCode = json['own_refer_code'];
    referCode = json['refer_code'];
    dateOfBirth = json['date_of_birth'];
    password = json['password'];
    bloodGroupName = json['blood_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['user_profile_photo_url'] = userProfilePhotoUrl;
    data['user_age'] = userAge;
    data['blood_group_id'] = bloodGroupId;
    data['point'] = point;
    data['user_email'] = userEmail;
    data['gender'] = gender;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['own_refer_code'] = ownReferCode;
    data['refer_code'] = referCode;
    data['date_of_birth'] = dateOfBirth;
    data['password'] = password;
    data['blood_group_name'] = bloodGroupName;
    return data;
  }
}
