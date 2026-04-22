// summary_state.dart
import 'package:equatable/equatable.dart';
import 'package:focus_flow_flutter/features/summary/data/model/summary_model.dart';

sealed class SummaryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SummaryInitial extends SummaryState {}

class SummaryLoading extends SummaryState {}

class SummarySuccess extends SummaryState {
  final SummaryModel summaryModel;

  SummarySuccess(this.summaryModel);

  @override
  List<Object?> get props => [summaryModel];
}

class SummaryFailure extends SummaryState {
  final String message;

  SummaryFailure(this.message);

  @override
  List<Object?> get props => [message];
}
