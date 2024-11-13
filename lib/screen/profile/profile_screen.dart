



import 'package:cook_bite/base/base_state.dart';
import 'package:cook_bite/screen/profile/profile_bloc.dart';
import 'package:cook_bite/widgets/customTextFormField.dart';
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
                appBar: AppBar(
                  title: const Text("Profile"),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 60,
                                child: Icon(Icons.person),// Adjust size as needed
                                // backgroundImage: AssetImage('assets/avatar_placeholder.png'), // Replace with your asset
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle camera icon tap
                                  },
                                  child: const CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.blueAccent,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),

                        SizedBox(height: 30,),

                        const CustomTextForm(
                          hintText: 'Enter username',
                          labelText: 'UserName',
                          // focusNode: ,

                        ),

                        const SizedBox(height: 25,),

                        const CustomTextForm(
                          hintText: 'Enter Mobile',
                          labelText: 'Mobile Number',
                          // focusNode: ,

                        ),

                        const SizedBox(height: 25,),

                        const CustomTextForm(
                          hintText: 'Enter Gender',
                          labelText: 'Gender',
                          // focusNode: ,

                        ),

                        const SizedBox(height: 25,),

                        const CustomTextForm(
                          hintText: 'Enter Email Address',
                          labelText: 'EmailAddress',
                          // focusNode: ,

                        ),

                        const SizedBox(height: 25,),

                        const CustomTextForm(
                          hintText: 'Enter DOB',
                          labelText: 'Date of Birth',
                          // focusNode: ,

                        ),

                        const SizedBox(height: 25,),
                        ElevatedButton(
                          onPressed: () {
                            // Your onPressed logic here
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 50), // Set width and height
                            backgroundColor: Colors.orange, // Set the background color of the button
                            shape: RoundedRectangleBorder( // Optional: Rounded corners
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white), // Optional: Set text color
                          ),
                        )

                      ],
                    ),
                  ),
                )
            ),
          );
        },
      ),
    );
  }
}