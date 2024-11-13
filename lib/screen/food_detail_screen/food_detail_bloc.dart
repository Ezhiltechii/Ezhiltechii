
import 'package:bloc/bloc.dart';
import 'package:cook_bite/base/base_state.dart';

import 'food_detail_event.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, BaseState> {
  FoodDetailBloc() : super(InitialState()) {
    // Register the handler for LoginInitialEvent
    on<FoodDetailInitialEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 1));  // Simulate async task
      emit(SuccessState(successResponse: 'success'));
    });
  }
}