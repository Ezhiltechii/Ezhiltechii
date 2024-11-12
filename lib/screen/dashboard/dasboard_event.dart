


import 'package:cook_bite/utils/base_equatable.dart';
import 'package:flutter/material.dart';

abstract class DashboardEvent extends BaseEquatable {}

class DashboardInitialEvent extends DashboardEvent {
  BuildContext? context;
  dynamic arguments;

  DashboardInitialEvent({this.context});

}
