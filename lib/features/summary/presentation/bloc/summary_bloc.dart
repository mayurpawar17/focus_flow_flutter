// summary_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_flow_flutter/features/entry/data/repo/entry_repo.dart';
import 'package:focus_flow_flutter/features/summary/presentation/bloc/summary_event.dart';
import 'package:focus_flow_flutter/features/summary/presentation/bloc/summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final EntryRepo repository;

  SummaryBloc(this.repository) : super(SummaryInitial()) {
    on<FetchTodaySummaryEvent>(_onFetchTodaySummaryEvent);
    // on<SummaryReset>((event, emit) => emit(SummaryInitial()));
  }

  Future<void> _onFetchTodaySummaryEvent(
    FetchTodaySummaryEvent event,
    Emitter<SummaryState> emit,
  ) async {
    emit(SummaryLoading());
    try {
      final summary = await repository.getTodaySummary();
      emit(SummarySuccess(summary));
    } catch (e) {
      emit(SummaryFailure(e.toString()));
    }
  }
}
