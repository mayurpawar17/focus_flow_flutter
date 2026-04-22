// import 'package:equatable/equatable.dart';
//
// import '../../data/model/today_entry_response.dart';
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

//
// class EntryState extends Equatable {
//   final List<EntryModel> entries;
//   final SummaryModel? summary;
//   final bool isLoading;
//   final String? error;
//
//   const EntryState({
//     this.entries = const [],
//     this.summary,
//     this.isLoading = false,
//     this.error,
//   });
//
//   EntryState copyWith({
//     List<EntryModel>? entries,
//     SummaryModel? summary,
//     bool? isLoading,
//     String? error,
//   }) {
//     return EntryState(
//       entries: entries ?? this.entries,
//       summary: summary ?? this.summary,
//       isLoading: isLoading ?? this.isLoading,
//       error: error,
//     );
//   }
//
//   @override
//   List<Object?> get props => [entries, summary, isLoading, error];
// }

import 'package:equatable/equatable.dart';
import 'package:focus_flow_flutter/features/entry/data/model/entry_response.dart';

import '../../data/model/today_entry_response.dart';

sealed class EntryState extends Equatable {
  const EntryState();

  @override
  List<Object?> get props => [];
}

/// 1. Initial State: The form is empty or ready for a new entry.
class EntryInitial extends EntryState {}

/// 2. Loading State: Use this when fetching an existing entry
/// or while the "Save" request is in flight.
class EntryLoading extends EntryState {}

/// 3. Content Ready/Success: The entry has been loaded or
/// created successfully.
class EntrySuccess extends EntryState {
  // final List<EntryModel> entryModel;
  final TodayEntryResponse todayEntryResponse;

  const EntrySuccess({required this.todayEntryResponse});

  @override
  List<Object?> get props => [todayEntryResponse];
}

class EntrySaveSuccess extends EntryState {
  final EntryResponse entryResponse;
  const EntrySaveSuccess({required this.entryResponse});
  @override
  List<Object?> get props => [entryResponse];
}

/// 4. Failure State: Something went wrong (Validation error,
/// Database full, Network error).
class EntryFailure extends EntryState {
  final String error;

  const EntryFailure(this.error);

  @override
  List<Object?> get props => [error];
}
