

// ignore_for_file: always_specify_types

import 'dart:io';
import 'package:cook_bite/screen/otp_screen/otp_bloc.dart';
import 'package:cook_bite/utils/images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/base_state.dart';
import '../../utils/custom_color.dart';
import '../login_screen/login_bloc.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required String phoneNumber}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  _OtpScreenState({this.page});

  final Widget? page;
  late OtpBloc bloc;
  final TextEditingController _credentialController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<OtpBloc>(context);
  }

  @override
  void dispose() {
    _credentialController.dispose();
    _passwordController.dispose();
    _phoneNoController.dispose();
    super.dispose();
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
                  child: Text('New Datas'),
                )
              ),

          );
        },
      ),
    );
  }

  Widget otpWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
Text('uyuyu')
        ],
      ),

    );

  }

}
