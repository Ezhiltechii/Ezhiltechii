import 'package:bloc/bloc.dart';

import '../../base/base_state.dart';
import 'login_event.dart';

// class LoginBloc extends Bloc<LoginEvent, BaseState> {
//   LoginBloc() : super(InitialState());
//
//   @override
//   Stream<BaseState> mapEventToState(LoginEvent event) async* {
//     if (event is LoginInitialEvent) {
//       yield LoadingState();
//       yield SuccessState(successResponse: 'success');
//     }
//   }
// }

class LoginBloc extends Bloc<LoginEvent, BaseState> {
  LoginBloc() : super(InitialState()) {
    // Register the handler for LoginInitialEvent
    on<LoginInitialEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 1));  // Simulate async task
      emit(SuccessState(successResponse: 'success'));
    });
  }
}