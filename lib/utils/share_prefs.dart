
import 'package:shared_preferences/shared_preferences.dart';

import 'contants.dart';


class PreferenceHelper {

  static Future<bool> getLoginDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('getTrack') ?? false;
  }

  static setTrack(bool status) async {
    // obtain shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.getTrack, status);
  }

  static setBearer(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString('bearer', value);
    }
  }

  static Future<String> getBearer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('bearer') ?? '';
  }


}

clearPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
