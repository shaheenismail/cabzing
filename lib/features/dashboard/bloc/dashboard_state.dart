import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final double revenue;
  final double percentageChange;
  final List<FlSpot> spots;
  final int bookings;
  final int invoices;

  const DashboardLoaded({
    required this.revenue,
    required this.percentageChange,
    required this.spots,
    required this.bookings,
    required this.invoices,
  });

  @override
  List<Object> get props =>
      [revenue, percentageChange, spots, bookings, invoices];
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);

  @override
  List<Object> get props => [message];
}
