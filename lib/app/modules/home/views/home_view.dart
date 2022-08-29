import 'package:creo_netflix_clone/app/data/api_services.dart';
import 'package:creo_netflix_clone/app/modules/home/widgets/top_section.dart';
import 'package:creo_netflix_clone/app/modules/movie_list_screen/widgets/movies_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final apiController = Get.put(APIController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Image.asset(
              "assets/HomeBG.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const TopSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: (Get.height * 0.6)),
                  MoviesList(movieType: "now_playing", title: "Now Playing")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
