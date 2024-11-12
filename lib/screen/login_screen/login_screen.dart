// ignore_for_file: always_specify_types

import 'dart:io';
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

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider. of<LoginBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {
        if (state is SuccessState) {
          if (state.successResponse is String) {}
        }
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, BaseState state) {
          return const SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Text('Nio')
                ],
              )
            ),
          );
        },
      ),
    );
  }
}