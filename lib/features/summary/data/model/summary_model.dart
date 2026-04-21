import 'package:equatable/equatable.dart';

class SummaryModel extends Equatable {
  final String insight;
  final String summary;
  final int totalTasks;

  const SummaryModel({
    required this.insight,
    required this.summary,
    required this.totalTasks,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      insight: json['insight'],
      summary: json['summary'],
      totalTasks: json['totalTasks'],
    );
  }

  @override
  List<Object?> get props => [insight, summary, totalTasks];
}
