import 'package:bloc/bloc.dart';
import 'package:cook_bite/base/base_state.dart';
import 'package:cook_bite/screen/dashboard/dasboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, BaseState> {
  DashboardBloc() : super(InitialState()) {
    // Register the handler for LoginInitialEvent
    on<DashboardInitialEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 1));  // Simulate async task
      emit(SuccessState(successResponse: 'success'));
    });
  }
}
