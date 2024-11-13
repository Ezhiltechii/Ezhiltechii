

import 'contants.dart';

class FieldValidators {
  static String? phoneNOValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.passwordEmpty;
    } else if (value.length != 10 || !RegExp(r'^\d{10}$').hasMatch(value)) {
      return Constants.passwordInvalid;
    }
    return null;
  }
}
