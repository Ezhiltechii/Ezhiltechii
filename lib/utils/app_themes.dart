import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';

import 'custom_color.dart';



/// The app's themes.
/// This class is just there to connect readable names
/// to integer theme IDs.
class AppThemes {
  static const int darkBlue = 0;
  static const int lightOrange = 1;

  ThemeCollection getThemeCollections() {
    final ThemeData base = ThemeData.light();
    final ButtonThemeData darkButtonTheme =
    base.buttonTheme.copyWith(buttonColor: ColorResource.colorF58220);
    final FloatingActionButtonThemeData darkFABTheme =
        base.floatingActionButtonTheme;
    return ThemeCollection(themes: {
      AppThemes.darkBlue: ThemeData(
          buttonTheme: darkButtonTheme,
          primaryColor: ColorResource.colorE02E23,
          textTheme: AppThemes().basicTextTheme(base.textTheme),
          floatingActionButtonTheme: darkFABTheme.copyWith(
              backgroundColor: ColorResource.colorF58220), colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(
            0xff020E36,
            <int, Color>{
              50: Color(0xff020E36),
              100: Color(0xff020E36),
              200: Color(0xff020E36),
              300: Color(0xff020E36),
              400: Color(0xff020E36),
              500: Color(0xff020E36),
              600: Color(0xff020E36),
              700: Color(0xff020E36),
              800: Color(0xff020E36),
              900: Color(0xff020E36),
            },
          )).copyWith(background: ColorResource.color020e36)),
      AppThemes.lightOrange: ThemeData(
          primarySwatch: const MaterialColor(
            0xffFDF3E6,
            <int, Color>{
              50: Color(0xffFDF3E6),
              100: Color(0xffFDF3E6),
              200: Color(0xffFDF3E6),
              300: Color(0xffFDF3E6),
              400: Color(0xffFDF3E6),
              500: Color(0xffFDF3E6),
              600: Color(0xffFDF3E6),
              700: Color(0xffFDF3E6),
              800: Color(0xffFDF3E6),
              900: Color(0xffFDF3E6),
            },
          ),
          buttonTheme: darkButtonTheme,
          textTheme: AppThemes().basicTextTheme(base.textTheme),
          floatingActionButtonTheme: darkFABTheme.copyWith(
              backgroundColor: ColorResource.colorFDF3E6)),
    });
  }

  static String toStr(int themeId) {
    switch (themeId) {
      case darkBlue:
        return 'Dark Blue';
      case lightOrange:
        return 'Light Orange';

      default:
        return 'Unknown';
    }
  }

  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
      //Used for font size of 6

    );
  }
}
