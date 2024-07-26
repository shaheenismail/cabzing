import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<FetchDashboardData>(_onFetchDashboardData);
  }

  Future<void> _onFetchDashboardData(
      FetchDashboardData event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());

    try {
      await Future.delayed(Duration(seconds: 2));

      double revenue = 278000.00;
      double percentageChange = 21.0;
      List<FlSpot> spots = [
        FlSpot(1, 1000),
        FlSpot(2, 3945),
        FlSpot(3, 3000),
        FlSpot(4, 1500),
        FlSpot(5, 2800),
        FlSpot(6, 2500),
        FlSpot(7, 1900),
        FlSpot(8, 1200),
      ];
      int bookings = 123;
      int invoices = 10232;

      emit(DashboardLoaded(
        revenue: revenue,
        percentageChange: percentageChange,
        spots: spots,
        bookings: bookings,
        invoices: invoices,
      ));
    } catch (error) {
      emit(DashboardError('Failed to fetch data'));
    }
  }
}
