
import 'package:cook_bite/screen/dashboard/dasboard_event.dart';
import 'package:cook_bite/screen/dashboard/dasboard_screen.dart';
import 'package:cook_bite/screen/dashboard/dashboard_bloc.dart';
import 'package:cook_bite/screen/landing_screen/landing_bloc.dart';
import 'package:cook_bite/screen/landing_screen/landing_event.dart';
import 'package:cook_bite/screen/landing_screen/landing_screen.dart';
import 'package:cook_bite/screen/login_screen/login_bloc.dart';
import 'package:cook_bite/screen/login_screen/login_event.dart';
import 'package:cook_bite/screen/login_screen/login_screen.dart';
import 'package:cook_bite/screen/profile/profile_bloc.dart';
import 'package:cook_bite/screen/profile/profile_event.dart';
import 'package:cook_bite/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_screen.dart';
import 'in_progress.dart';
class AppRoutes {
  static const String loginScreen = 'login_screen';
  static const String landingScreen = 'landing_screen';
  static const String dashboardScreen = 'dashboard_screen';
  static const String profileScreen = 'profile_screen';

}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildLoginScreen();
    case AppRoutes.landingScreen:
      return _buildLandingScreen();
    case AppRoutes.dashboardScreen:
      return _buildDashboardScreen();
    case AppRoutes.profileScreen:
      return _buildProfileScreen();
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

Route<dynamic> _buildLandingScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildLandingScreen()),
  );
}

Route<dynamic> _buildDashboardScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildDashboardScreen()),
  );
}

Route<dynamic> _buildProfileScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildProfileScreen()),
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

  static Widget buildLandingScreen() {
    return BlocProvider(create: (BuildContext context) =>
    LandingBloc()..add(LandingInitialEvent()),
      child: const LandingScreen(),
    );
  }

  static Widget buildDashboardScreen() {
    return BlocProvider(create: (BuildContext context) =>
    DashboardBloc()..add(DashboardInitialEvent()),
      child: const DashboardScreen(),
    );
  }

  static Widget buildProfileScreen() {
    return BlocProvider(create: (BuildContext context) =>
    ProfileBloc()..add(ProfileInitialEvent()),
      child: const ProfileScreen(),
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