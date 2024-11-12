
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
      child: BlocBuilder(
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
          } else if (state is SuccessState) {
            // bloc.add(GetUserProfile());
            // if (state.successResponse is String) {
            //   if (state.successResponse == Constants.showAlertDialog) {}
            //   if (state.successResponse == Constants.bioMetricLogin) {}
            // } else if (state.successResponse is int) {
            // } else if (state.successResponse is double) {
            // } else if (state.successResponse is ProfileModel) {
            //   ProfileModel? model;
            //   model = state.successResponse;
            // }
          }
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage(ImageResource.background),
                //   fit: BoxFit.fill,
                // ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xff0062DD),
                    Color(0xff2EB2FF),
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 85, bottom: 40, right: 16, left: 16),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      ImageResources.splashScreen,
                    ),
                    Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bloc.banners.length,
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        itemBuilder: (BuildContext context, int index) {
                          print('------- NEW ${bloc.banners.length}');
                        return Column(
                          children: [
                            ElevatedButton(onPressed: () {
                              Navigator.pushNamed(context,AppRoutes.loginScreen);
                            },
                                child: const Text('Login Page'))
                            // landing1Widget(),
                            // landing1Widget(),
                            // landing1Widget(),
                            // landing1Widget(),
                          ],
                        );
                      },
                      ),
                    ),
                  /*  Column(
                      children: <Widget>[
                        // CustomButton(
                        //   buttonBackgroundColor: ColorResource.colorFFFFFF,
                        //   onTap: () async {
                        //     await Navigator.pushNamed(
                        //         context, AppRoutes.loginScreen);
                        //   },
                        //   disableColor: ColorResource.colorFFFFFF,
                        //   cardShape: 50.0,
                        // ),
                         Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: CustomText(
                           'new',
                            color: ColorResource.colorE22C24,
                            onTap: () async {
                              // if(AidivaFlashSingleton.instance.iscameraPermisssionStatus == false
                              //     || AidivaFlashSingleton.instance.islocationPermisssionStatus== false){
                              //   PermissionServices.requestPermission121();
                              // }
                              // final bool value =
                              //     await PreferenceHelper.getBioMetricValue();
                              // while (Navigator.canPop(context)) {
                              //   Navigator.pop(context);
                              // }
                              await Navigator.pushNamed(
                                  context, AppRoutes.loginScreen);
                            },
                          ),
                        )
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget landing1Widget() {
    return Container(
       padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded(
          //     child: AspectRatio(
          //       aspectRatio: 1.33,
          //       child: Container(child: bloc.banners[0]),
          //     )),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bloc.banners.map((Widget url) {
                      final int index = bloc.banners.indexOf(url);
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? ColorResource.color0062DD
                              : ColorResource.color414A58.withOpacity(0.4),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    bloc.titles[0],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(
                      bloc.descriptions[0],
                      textAlign: TextAlign.center,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Widget landing2Widget() {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: AspectRatio(
                aspectRatio: 1.33,
                child: Container(child: bloc.banners[1]),
              )),
          Expanded(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: const BoxDecoration(
                    color: ColorResource.colorFFFFFF,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bloc.banners.map((Widget url) {
                        final int index = bloc.banners.indexOf(url);
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? ColorResource.color0062DD
                                : ColorResource.color414A58.withOpacity(0.4),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      bloc.titles[1],
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomText(
                        bloc.descriptions[1],
                        textAlign: TextAlign.center,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Widget landing3Widget() {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          Expanded(
              child: AspectRatio(
                aspectRatio: 1.33,
                child: Container(child: bloc.banners[2]),
              )),
          Expanded(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: const BoxDecoration(
                    color: ColorResource.colorFFFFFF,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bloc.banners.map((Widget url) {
                        final int index = bloc.banners.indexOf(url);
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? ColorResource.color0062DD
                                : ColorResource.color414A58.withOpacity(0.4),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      bloc.titles[2],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomText(
                        bloc.descriptions[2],
                        textAlign: TextAlign.center,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Widget landing4Widget() {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: AspectRatio(
                aspectRatio: 1.33,
                child: Container(child: bloc.banners[3]),
              )),
          Expanded(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: const BoxDecoration(
                    color: ColorResource.colorFFFFFF,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bloc.banners.map((Widget url) {
                        final int index = bloc.banners.indexOf(url);
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? ColorResource.color0062DD
                                : ColorResource.color414A58.withOpacity(0.4),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      bloc.titles[3],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomText(
                        bloc.descriptions[3],
                        textAlign: TextAlign.center,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Widget landing5Widget() {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: AspectRatio(
                aspectRatio: 1.33,
                child: Container(child: bloc.banners[4]),
              )),
          Expanded(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: const BoxDecoration(
                    color: ColorResource.colorFFFFFF,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bloc.banners.map((Widget url) {
                        final int index = bloc.banners.indexOf(url);
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: _currentPage == index
                            //     ? ColorResource.color0062DD
                            //     : ColorResource.color414A58.withOpacity(0.4),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      bloc.titles[4],

                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomText(
                        bloc.descriptions[4],
                        textAlign: TextAlign.center,

                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}