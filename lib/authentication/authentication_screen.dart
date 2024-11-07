
import 'package:cook_bite/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationState extends BaseEquatable {}

class AuthenticationUnInitialized extends AuthenticationState {}

class AuthenticationUnAuthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class SplashScreenState extends AuthenticationState {}

class ForgotMPinState extends AuthenticationState {}

class NoInternetConnectionState extends AuthenticationState {
  final dynamic noInternetResponse;

  NoInternetConnectionState({this.noInternetResponse});

  @override
  List<Object> get props => [noInternetResponse];
}
