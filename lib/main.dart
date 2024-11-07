
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cook_bite/rotuers.dart';
import 'package:cook_bite/screen/loginScreen/login_bloc.dart';
import 'package:cook_bite/screen/loginScreen/login_screen.dart';
import 'package:cook_bite/screen/splash_screen/splash_screen.dart';
import 'package:cook_bite/utils/app_themes.dart';
import 'package:cook_bite/utils/bloc.dart';
import 'package:cook_bite/utils/custom_color.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = EchoBlocDelegate();
  runApp(
    //const MyApp()
    BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) {
        print('-----MAIN DART --------------');
        return AuthenticationBloc()..add(AppStarted());
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc? bloc;
  Timer? _timer;
  late Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // @override
  // void didChangeDependencies() async {
  //   getLocale().then((locale) {
  //     setState(() {
  //       _locale = locale;
  //     });
  //   });
  //   super.didChangeDependencies();
  // }


  @override
  void initState() {
    bloc = BlocProvider.of<AuthenticationBloc>(context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorResource.colorE22C24,
    ));
    return DynamicTheme(
      themeCollection: AppThemes().getThemeCollections(),
      builder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'Inovate',
          theme: theme,
          onGenerateRoute: getRoute,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          // supportedLocales: const [
          //   Locale('en', ''),
          //   Locale('ar', ''),
          //   Locale('hi', '')
          // ],
          // localizationsDelegates: const [
          //   AppLocalizationsDelegate(),
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },

        );
      },
    );
  }
}