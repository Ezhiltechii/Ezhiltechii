import 'package:cook_bite/base/base_state.dart';
import 'package:cook_bite/screen/food_detail_screen/food_detail_bloc.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<FoodDetailScreen> {

  late FoodDetailBloc bloc;
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider. of<FoodDetailBloc>(context);
    flickManager = FlickManager(videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")

    ));
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
          return  SafeArea(
            child: Scaffold(
                body: Column(
                  children: [
                    FlickVideoPlayer(flickManager: flickManager)
                  ],
                )
            ),
          );
        },
      ),
    );
  }
}