import 'package:bloc/bloc.dart';
import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<ToggleVisibilityEvent>((event, emit) {
      emit(FilterVisible());
    });

    on<ApplyFilterEvent>((event, emit) {
      emit(FilterApplied());
    });

    on<ChangeDateEvent>((event, emit) {
      emit(DateChanged(event.startDate, event.endDate));
    });

    on<ChangeStatusEvent>((event, emit) {
      emit(StatusChanged(event.status));
    });
  }
}
