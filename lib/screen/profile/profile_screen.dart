



import 'package:cook_bite/base/base_state.dart';
import 'package:cook_bite/screen/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ProfileScreen> {
  _LoginScreenState({this.page});

  final Widget? page;
  late ProfileBloc bloc;
  final TextEditingController _credentialController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider. of<ProfileBloc>(context);
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
          return SafeArea(
            child: Scaffold(
                body: Column(
                  children: [
                    Text('Dashboard')
                  ],
                )
            ),
          );
        },
      ),
    );
  }
}