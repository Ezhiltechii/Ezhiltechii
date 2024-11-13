import 'package:cook_bite/rotuers.dart';
import 'package:cook_bite/screen/dashboard/dashboard_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
          Size size = MediaQuery.of(context).size;
          List<Image> carouselItems = [
            Image.network(
                'https://media.istockphoto.com/id/2013848574/photo/the-internet-was-attacked-worldwide-causing-a-major-disruption-3d-rendering.jpg?s=1024x1024&w=is&k=20&c=K8oj4_CY3_RIo-EVfdlsLMNIqb8Pwe9RHq2HJFA7Vko='),
            Image.network(
                'https://media.istockphoto.com/id/2098359215/photo/digital-marketing-concept-businessman-using-laptop-with-ads-dashboard-digital-marketing.jpg?s=1024x1024&w=is&k=20&c=q6RTyRcP6Lli25bBXmKz3F3sIAVSu5PthcuOiAniHzE='),
            Image.network(
                'https://media.istockphoto.com/id/2013848574/photo/the-internet-was-attacked-worldwide-causing-a-major-disruption-3d-rendering.jpg?s=1024x1024&w=is&k=20&c=K8oj4_CY3_RIo-EVfdlsLMNIqb8Pwe9RHq2HJFA7Vko='),
          ];

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Dashboard'),
                actions: [
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.profileScreen);
                    },
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    ),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Other widgets
                    CarouselSlider(
                      items: carouselItems,
                      options: CarouselOptions(
                        height: size.height * 0.2,
                        // Customize the height of the carousel
                        autoPlay: true,
                        // Enable auto-play
                        enlargeCenterPage: true,
                        // Increase the size of the center item
                        enableInfiniteScroll: true,
                        // Enable infinite scroll
                        onPageChanged: (index, reason) {
                          // Optional callback when the page changes
                          // You can use it to update any additional UI components
                        },
                      ),
                    ),
                    Text('Categories'),
                    SizedBox(
                      height: 180, // Set height for the ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6, // Number of cards
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Card(
                                elevation: 5,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, AppRoutes.detailScreen);
                                  },
                                  child: Container(
                                    width: 140, // Customize card width
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          'https://images.unsplash.com/photo-1432139555190-58524dae6a55?q=80&w=1476&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with actual image URLs
                                          height: 120, // Adjust image height
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Category ${index + 1}', // Text under the image
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Other widgets
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }
}