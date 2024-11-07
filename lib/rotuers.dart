import 'package:cook_bite/screen/loginScreen/login_bloc.dart';
import 'package:cook_bite/screen/loginScreen/login_event.dart';
import 'package:cook_bite/screen/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_screen.dart';
import 'in_progress.dart';
class AppRoutes {
  static const String loginScreen = 'splash_screen';

}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildLoginScreen();
  }
  return _buildInProgressScreen();
}

Route<dynamic> _buildInProgressScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildInProgressScreen()),
  );
}

Route<dynamic> _buildLoginScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildLoginScreen()),
  );
}

class PageBuilder {
  static Widget buildInProgressScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
          BlocProvider.of<AuthenticationBloc>(context),
      child: const InProgressScreen(),
    );
  }

  static Widget buildLoginScreen() {
    return BlocProvider(create: (BuildContext context) =>
    LoginBloc()..add(LoginInitialEvent(context: context)),
      child: const LoginScreen(),
    );
  }
}
Widget addAuthBloc(BuildContext context, Widget widget) {
  print('========= add Auth data=======');
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (BuildContext context, Object? state) async {
      if (state is AuthenticationUnAuthenticated) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        await Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
      }

      if (state is AuthenticationAuthenticated) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      }
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (BuildContext context, Object? state) {
        return widget;
      },
    ),
  );
}