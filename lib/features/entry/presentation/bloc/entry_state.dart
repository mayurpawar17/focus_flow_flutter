// import 'package:equatable/equatable.dart';
//
// import '../../data/model/entry_model.dart';
//
// abstract class EntryState extends Equatable {
//   const EntryState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class EntryInitial extends EntryState {}
//
// class EntryLoading extends EntryState {}
//
// class EntryLoaded extends EntryState {
//   final List<EntryModel> entries;
//
//   const EntryLoaded(this.entries);
//
//   @override
//   List<Object?> get props => [entries];
// }
//
// class EntryError extends EntryState {
//   final String message;
//
//   const EntryError(this.message);
//
//   @override
//   List<Object?> get props => [message];
// }

import 'package:equatable/equatable.dart';

import '../../../summary/data/model/summary_model.dart';
import '../../data/model/entry_model.dart';

class EntryState extends Equatable {
  final List<EntryModel> entries;
  final SummaryModel? summary;
  final bool isLoading;
  final String? error;

  const EntryState({
    this.entries = const [],
    this.summary,
    this.isLoading = false,
    this.error,
  });

  EntryState copyWith({
    List<EntryModel>? entries,
    SummaryModel? summary,
    bool? isLoading,
    String? error,
  }) {
    return EntryState(
      entries: entries ?? this.entries,
      summary: summary ?? this.summary,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [entries, summary, isLoading, error];
}
