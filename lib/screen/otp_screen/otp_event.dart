

import 'package:flutter/material.dart';

import '../../utils/base_equatable.dart';

abstract class OtpEvent extends BaseEquatable {}

class OtpInitialEvent extends OtpEvent {
  BuildContext? context;
  dynamic arguments;

  OtpInitialEvent({this.context});

}
