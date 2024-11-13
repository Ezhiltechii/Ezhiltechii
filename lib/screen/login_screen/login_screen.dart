// ignore_for_file: always_specify_types

import 'dart:io';
import 'package:cook_bite/rotuers.dart';
import 'package:cook_bite/screen/otp_screen/otp_screen.dart';
import 'package:cook_bite/screen/otp_screen/otp_screen.dart';
import 'package:cook_bite/utils/images.dart';
import 'package:cook_bite/utils/validator.dartvalidator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/base_state.dart';
import '../../utils/custom_color.dart';
import 'login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _LoginScreenState({this.page});

  final Widget? page;
  late LoginBloc bloc;
  final TextEditingController _credentialController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);
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
    return BlocListener<LoginBloc, BaseState>(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {
        if (state is SuccessState) {
          if (state.successResponse is String) {
            // Handle success response as needed
          }
        }
      },
      child: BlocBuilder<LoginBloc, BaseState>(
        bloc: bloc,
        builder: (BuildContext context, BaseState state) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: mobileNoWidget(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget mobileNoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          ImageResources.splashScreen,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FieldValidators.phoneNOValidator,
            controller: _phoneNoController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
              ),
              labelText: "Enter Mobile No",
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          onPressed: (){
         Navigator.pushNamed(context, AppRoutes.otpScreen);
          },
          child: Text(
            "Save",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
