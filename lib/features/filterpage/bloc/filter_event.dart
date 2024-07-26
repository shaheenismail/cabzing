import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class ToggleVisibilityEvent extends FilterEvent {}

class ApplyFilterEvent extends FilterEvent {}

class ChangeDateEvent extends FilterEvent {
  final DateTime startDate;
  final DateTime endDate;

  const ChangeDateEvent(this.startDate, this.endDate);

  @override
  List<Object?> get props => [startDate, endDate];
}

class ChangeStatusEvent extends FilterEvent {
  final String status;

  const ChangeStatusEvent(this.status);

  @override
  List<Object?> get props => [status];
}
