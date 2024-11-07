import 'package:cook_bite/utils/custom_color.dart';
import 'package:flutter/material.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({Key? key}) : super(key: key);

  @override
  _InProgressScreenState createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorResource.colorE22C24,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () async {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),

      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/landing1.png'),
              const SizedBox(
                height: 10,
              ),
              Text(
                'COMING SOON',
              )
            ],
          )
      ),
    );
  }
}