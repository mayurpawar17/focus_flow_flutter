// summary_event.dart
import 'package:equatable/equatable.dart';

sealed class SummaryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTodaySummaryEvent extends SummaryEvent {}

class SummaryReset extends SummaryEvent {}
