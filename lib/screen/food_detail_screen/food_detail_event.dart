


import 'package:cook_bite/utils/base_equatable.dart';
import 'package:flutter/material.dart';

abstract class FoodDetailEvent extends BaseEquatable {}

class FoodDetailInitialEvent extends FoodDetailEvent {
  BuildContext? context;
  dynamic arguments;

  FoodDetailInitialEvent({this.context});

}