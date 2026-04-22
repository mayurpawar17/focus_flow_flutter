import 'package:focus_flow_flutter/features/entry/data/model/today_entry_response.dart';

class EntryResponse {
  String? status;
  String? message;
  Data? data;

  EntryResponse({this.status, this.message, this.data});

  EntryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

// class Data {
//   String? category;
//   String? createdAt;
//   int? id;
//   int? timeSpent;
//   String? title;
//
//   Data({this.category, this.createdAt, this.id, this.timeSpent, this.title});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     category = json['category'];
//     createdAt = json['createdAt'];
//     id = json['id'];
//     timeSpent = json['timeSpent'];
//     title = json['title'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['category'] = this.category;
//     data['createdAt'] = this.createdAt;
//     data['id'] = this.id;
//     data['timeSpent'] = this.timeSpent;
//     data['title'] = this.title;
//     return data;
//   }
// }
