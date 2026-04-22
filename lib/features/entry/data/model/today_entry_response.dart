import 'package:equatable/equatable.dart';

// class EntryModel extends Equatable {
//   final int id;
//   final String title;
//   final String category;
//   final int timeSpent;
//   final DateTime createdAt;
//
//   const EntryModel({
//     required this.id,
//     required this.title,
//     required this.category,
//     required this.timeSpent,
//     required this.createdAt,
//   });
//
//   factory EntryModel.fromJson(Map<String, dynamic> json) {
//     return EntryModel(
//       id: json['id'],
//       title: json['title'],
//       category: json['category'],
//       timeSpent: json['timeSpent'],
//       createdAt: DateTime.parse(json['createdAt']),
//     );
//   }
//
//   @override
//   List<Object?> get props => [id, title, category, timeSpent, createdAt];
// }

class TodayEntryResponse {
  String? status;
  String? message;
  List<Data>? data;

  TodayEntryResponse({this.status, this.message, this.data});

  TodayEntryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? category;
  String? createdAt;
  int? id;
  int? timeSpent;
  String? title;

  Data({this.category, this.createdAt, this.id, this.timeSpent, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    createdAt = json['createdAt'];
    id = json['id'];
    timeSpent = json['timeSpent'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    data['timeSpent'] = this.timeSpent;
    data['title'] = this.title;
    return data;
  }
}
