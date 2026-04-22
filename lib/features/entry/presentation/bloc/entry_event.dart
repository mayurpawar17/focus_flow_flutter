import 'package:equatable/equatable.dart';

import '../../data/model/entry_request.dart';

abstract class EntryEvent extends Equatable {
  const EntryEvent();

  @override
  List<Object?> get props => [];
}

class FetchTodayEntriesEvent extends EntryEvent {}

class SaveTodayEntryEvent extends EntryEvent {
  final EntryRequest entryRequest;

  const SaveTodayEntryEvent(this.entryRequest);

  @override
  List<Object?> get props => [entryRequest];
}
