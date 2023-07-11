// ignore_for_file: file_names

class ComplainModel {
  String? message;
  Data? data;

  ComplainModel({this.message, this.data});

  ComplainModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? complaintName;
  String? complaintMessage;

  Data({this.id, this.userId, this.complaintName, this.complaintMessage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    complaintName = json['complaint_name'];
    complaintMessage = json['complaint_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['complaint_name'] = complaintName;
    data['complaint_message'] = complaintMessage;
    return data;
  }
}
