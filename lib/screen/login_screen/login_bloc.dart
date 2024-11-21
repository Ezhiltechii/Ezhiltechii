import 'package:bloc/bloc.dart';
import 'package:cook_bite/http/api_repo.dart';
import 'package:cook_bite/http/httpUrl.dart';
import 'package:cook_bite/utils/contants.dart';

import '../../base/base_state.dart';
import 'login_event.dart';
import 'login_model.dart';


class LoginBloc extends Bloc<LoginEvent, BaseState> {
  LoginBloc() : super(InitialState()) {

    // Register the handler for LoginInitialEvent
    on<LoginInitialEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 1));

      // Simulate async task
      emit(SuccessState(successResponse: 'success'));
    });

    // Register the handler for LoginAPI
    on<LoginAPI>((event, emit) async {
      emit(LoadingState());
      try {
        final dynamic returnableValues = await APIRepository().dynamicRequest(
          HttpUrl.login,
          method: ApiRequestMethod.post,
          userArguments: event.arguments,
          context: event.context,
        );
    print('========= RETURN ${returnableValues}');
        // Parse response
        final response = LoginApi.fromJson(returnableValues);
        emit(SuccessState(successResponse: response));
      } catch (error) {
       print('----- $error');
      }
    });


  }
}


