// ignore_for_file: always_specify_types

import 'dart:async';
import 'dart:io';
import 'package:cook_bite/rotuers.dart';
import 'package:cook_bite/screen/otp_screen/otp_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../base/base_state.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required String phoneNumber}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  _OtpScreenState({this.page});

  final Widget? page;
  late OtpBloc bloc;
  TextEditingController _otpController = TextEditingController();
  int _timeRemaining = 30; // Timer starts at 30 seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    bloc = BlocProvider.of<OtpBloc>(context);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  // Function to start the countdown timer
  void _startTimer() {
    _timer?.cancel(); // Cancel previous timer if any
    _timeRemaining = 30; // Reset the timer to 30 seconds

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  // Function to resend OTP and restart the timer
  void _resendOtp() {
    _startTimer();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP Resent!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpBloc, BaseState>(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {
        if (state is SuccessState) {
          if (state.successResponse is String) {
            // Handle success response as needed
          }
        }
      },
      child: BlocBuilder<OtpBloc, BaseState>(
        bloc: bloc,
        builder: (BuildContext context, BaseState state) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: otpWidget(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget otpWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "OTP Verification",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 180,
                  child: Text(
                    "Enter OTP Number ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(.7),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              "8489239693",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.edit,
                  color: Colors.deepOrange,
                  size: 20,
                ),
              ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        //OTP TextField
        OtpTextField(
          numberOfFields: 5,
          borderColor: Color(0xFF512DA8),
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode){
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                }
            );
          }, // end onSubmit
        ),

        SizedBox(height: 20),

        _timeRemaining == 0
            ? InkWell(
                onTap: () {
                  _resendOtp();
                },
                child: Text(
                  'Resend OTP',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : Text(
                "Resend OTP in: $_timeRemaining seconds",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
        SizedBox(
          height: 20,
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepOrange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.dashboardScreen);
          },
          child: Text(
            "Verify and Continue",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
