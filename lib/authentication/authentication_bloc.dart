import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'authentication_event.dart';
import 'authentication_screen.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnInitialized()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedOut>(_onLoggedOut);
  }

  // Handler for AppStarted event
  void _onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    print('----------- NEW ENTRY -----------');

    bool mpinStatus = true;
    if (mpinStatus) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnAuthenticated());
    }
  }

  // Handler for LoggedOut event
  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationUnAuthenticated());
  }
}
