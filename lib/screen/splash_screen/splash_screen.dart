
import 'dart:async';

import 'package:cook_bite/rotuers.dart';
import 'package:cook_bite/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String version = '';

  @override
  void initState() {
    _loadLoginScreen();
    super.initState();
  }

  _loadLoginScreen() {
    Timer(Duration(seconds: 5), () {
      // After 5 seconds, navigate to the next screen
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      Navigator.pushNamed(context, AppRoutes.landingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                ImageResources.splashScreen,
                // width: 100,
                // height: 100,
              )
            ),
          ],
        ),
      ),
    );
  }

}
