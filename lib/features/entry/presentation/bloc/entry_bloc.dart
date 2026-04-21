import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/features/entry/data/repo/entry_repo.dart';

import 'entry_event.dart';
import 'entry_state.dart';

class EntryBloc extends Bloc<EntryEvent, EntryState> {
  final EntryRemoteDataSourceImpl repository;

  EntryBloc(this.repository) : super(const EntryState()) {
    on<FetchTodayEntries>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      try {
        final entries = await repository.getTodayEntries();
        emit(state.copyWith(entries: entries, isLoading: false));
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    });

    // on<FetchTodayEntries>((event, emit) async {
    //   emit(state.copyWith(isLoading: true, error: null));
    //
    //   try {
    //     final entries = await repository.getTodayEntries();
    //     emit(state.copyWith(entries: entries, isLoading: false));
    //   } catch (e) {
    //     emit(state.copyWith(error: e.toString(), isLoading: false));
    //   }
    // });

    on<FetchTodaySummary>((event, emit) async {
      try {
        final summary = await repository.getTodaySummary();
        emit(state.copyWith(summary: summary));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    });
  }
}
