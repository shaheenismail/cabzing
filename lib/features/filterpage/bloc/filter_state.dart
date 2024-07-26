import 'package:equatable/equatable.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterInitial extends FilterState {}

class FilterVisible extends FilterState {}

class FilterApplied extends FilterState {}

class DateChanged extends FilterState {
  final DateTime startDate;
  final DateTime endDate;

  const DateChanged(this.startDate, this.endDate);

  @override
  List<Object?> get props => [startDate, endDate];
}

class StatusChanged extends FilterState {
  final String status;

  const StatusChanged(this.status);

  @override
  List<Object?> get props => [status];
}
