


import 'package:bloc/bloc.dart';
import 'package:cook_bite/base/base_state.dart';
import 'package:cook_bite/screen/profile/profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, BaseState> {
  ProfileBloc() : super(InitialState()) {
    // Register the handler for LoginInitialEvent
    on<ProfileInitialEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 1));  // Simulate async task
      emit(SuccessState(successResponse: 'success'));
    });
  }
}