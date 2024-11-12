import 'package:bloc/bloc.dart';
import 'package:cook_bite/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/base_state.dart';
import '../../utils/string_resources.dart';
import 'landing_event.dart';

class LandingBloc extends Bloc<LandingEvent, BaseState> {
  late String version;
  List<Widget> banners = [];
  List<Color> backgroundColors = [];
  List<String> titles = [];
  List<String> descriptions = [];

  LandingBloc() : super(InitialState()) {
    // Register the handler for LandingInitialEvent
    on<LandingInitialEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 1));  // Simulate async task
    print('********* call the bloc');
      // Initialize the lists
      banners = [
        SvgPicture.asset(
          ImageResources.landing_one,
        ),
        SvgPicture.asset(
          ImageResources.landing_one,
        ),
        SvgPicture.asset(
          ImageResources.landing_one,
        ),
      ];

      titles = [
        StringResource.landing2Title,
        StringResource.landing2Title,
        StringResource.landing3Title,
      ];

      descriptions = [
        StringResource.landing1Description,
        StringResource.landing2Description,
        StringResource.landing3Description,
      ];
      emit(SuccessState(successResponse: 'success'));
    });
  }
}
