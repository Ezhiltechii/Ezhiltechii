
import 'dart:async';

import 'package:cook_bite/base/base_state.dart';
import 'package:cook_bite/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../rotuers.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_text.dart';
import 'landing_bloc.dart';



class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreen();
}

class _LandingScreen extends State<LandingScreen> {
  late LandingBloc bloc;
  int _current = 0;

  PageController controller = PageController();
  double currentPageValue = 0.0;
  String? _selectedCity, _location;

  int _currentPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  bool end = false;


  @override
  void initState() {
    bloc = BlocProvider.of<LandingBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

/*
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
*/

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorResource.colorE22C24,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) {
        if (state is SuccessState) {
          if (state.successResponse is String) {
            setState(() {
              // backGroundColors.add(ColorResource.color5765f2);
            });
          }
        }
      },
      child:  BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, BaseState state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is InitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 85, bottom: 40, right: 16, left: 16),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bloc.banners.length,
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      itemBuilder: (BuildContext context, int index) {
                        print('Image: ${bloc.banners[index]}');
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Display the banner image from the bloc
                            SizedBox(
                              width: 200.0,  // Set appropriate width and height
                              height: 200.0,
                              child: bloc.banners[index]

                            ),


                            SizedBox(height: 16.0), // Spacing between image and text

                            // Display the title from the bloc
                            Text(
                              bloc.titles[index],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 8.0), // Spacing between title and description

                            // Display the description from the bloc
                            Text(
                              bloc.descriptions[index],
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.dashboardScreen);
                  }, child: Text('login'))
                ],
              ),

            ),
          );
        },
      ),
    );
  }


}