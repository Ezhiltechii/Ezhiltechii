import 'package:cook_bite/screen/dashboard/dashboard_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DashboardScreen> {
  _LoginScreenState({this.page});

  final Widget? page;
  late DashboardBloc bloc;
  final TextEditingController _credentialController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider. of<DashboardBloc>(context);
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