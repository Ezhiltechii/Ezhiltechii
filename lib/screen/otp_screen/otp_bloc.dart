
import 'package:bloc/bloc.dart';
import '../../base/base_state.dart';
import 'otp_event.dart';

class OtpBloc extends Bloc<OtpEvent, BaseState> {
  OtpBloc() : super(InitialState()) {
    // Register the handler for LoginInitialEvent
    on<OtpInitialEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 1));  // Simulate async task
      emit(SuccessState(successResponse: 'success'));
    });
  }
}