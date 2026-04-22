import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/features/entry/data/repo/entry_repo.dart';

import 'entry_event.dart';
import 'entry_state.dart';

class EntryBloc extends Bloc<EntryEvent, EntryState> {
  final EntryRepo repository;

  EntryBloc(this.repository) : super(EntryInitial()) {
    on<FetchTodayEntriesEvent>(_onFetchTodayEntriesEvent);
    on<SaveTodayEntryEvent>(_onSaveTodayEntryEvent);
  }

  Future<void> _onFetchTodayEntriesEvent(
    FetchTodayEntriesEvent event,
    Emitter<EntryState> emit,
  ) async {
    emit(EntryLoading());

    try {
      final todayEntryResponse = await repository.getTodayEntries();
      emit(EntrySuccess(todayEntryResponse: todayEntryResponse));
    } catch (e) {
      emit(EntryFailure(e.toString()));
    }
  }

  Future<void> _onSaveTodayEntryEvent(
    SaveTodayEntryEvent event,
    Emitter<EntryState> emit,
  ) async {
    emit(EntryLoading());
    try {
      final entryRequest = event.entryRequest;
      final entryResponse = await repository.saveTodayEntry(entryRequest);
      emit(EntrySaveSuccess(entryResponse: entryResponse));
    } catch (e) {
      emit(EntryFailure(e.toString()));
    }
  }
}
