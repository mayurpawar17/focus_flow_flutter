import 'package:equatable/equatable.dart';

class EntryModel extends Equatable {
  final int id;
  final String title;
  final String category;
  final int timeSpent;
  final DateTime createdAt;

  const EntryModel({
    required this.id,
    required this.title,
    required this.category,
    required this.timeSpent,
    required this.createdAt,
  });

  factory EntryModel.fromJson(Map<String, dynamic> json) {
    return EntryModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      timeSpent: json['timeSpent'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  @override
  List<Object?> get props => [id, title, category, timeSpent, createdAt];
}
