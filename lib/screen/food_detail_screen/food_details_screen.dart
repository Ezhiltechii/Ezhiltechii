import 'package:cook_bite/base/base_state.dart';
import 'package:cook_bite/screen/food_detail_screen/food_detail_bloc.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({Key? key}) : super(key: key);

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  late FoodDetailBloc bloc;
  late FlickManager flickManager;

  List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'quantity': 0,
      'image': 'https://example.com/image1.jpg',
      'selected': false
    },
    {
      'name': 'Product 2',
      'quantity': 0,
      'image': 'https://example.com/image2.jpg',
      'selected': false
    },
    {
      'name': 'Product 3',
      'quantity': 0,
      'image': 'https://example.com/image3.jpg',
      'selected': false
    },
    {
      'name': 'Product 4',
      'quantity': 0,
      'image': 'https://example.com/image4.jpg',
      'selected': false
    },
  ];

  bool isSelectAll = false;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<FoodDetailBloc>(context);
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  void _incrementQuantity(int index) {
    setState(() {
      products[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (products[index]['quantity'] > 0) {
        products[index]['quantity']--;
      }
    });
  }

  void _toggleSelected(int index) {
    setState(() {
      products[index]['selected'] = !products[index]['selected'];
      isSelectAll = products.every((product) => product['selected']);
    });
  }

  void _toggleSelectAll(bool? value) {
    setState(() {
      isSelectAll = value ?? false;
      for (var product in products) {
        product['selected'] = isSelectAll;
      }
    });
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
                  FlickVideoPlayer(flickManager: flickManager),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    title: const Text("Select All"),
                    value: isSelectAll,
                    onChanged: _toggleSelectAll,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Expanded(child: _buildProductList())
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(products[index]['image']),
            radius: 18,
          ),
          title: Text(products[index]['name']),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.remove, size: 16, color: Colors.black),
                onPressed: () => _decrementQuantity(index),
              ),
              const SizedBox(width: 10),
              Text(products[index]['quantity'].toString()),
              const SizedBox(width: 10),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.add, size: 16, color: Colors.black),
                onPressed: () => _incrementQuantity(index),
              ),
              Checkbox(
                value: products[index]['selected'],
                onChanged: (bool? value) => _toggleSelected(index),
              ),
            ],
          ),
        );
      },
    );
  }
}
