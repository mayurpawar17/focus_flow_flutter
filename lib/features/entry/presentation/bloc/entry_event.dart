import 'package:equatable/equatable.dart';

abstract class EntryEvent extends Equatable {
  const EntryEvent();

  @override
  List<Object?> get props => [];
}

class FetchTodayEntries extends EntryEvent {}

class FetchTodaySummary extends EntryEvent {}
