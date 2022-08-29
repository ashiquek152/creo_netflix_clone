import 'dart:developer';

import 'package:creo_netflix_clone/app/data/api_services.dart';
import 'package:creo_netflix_clone/app/data/model/movie_model.dart';
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
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Get.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/logo.ico",
                          fit: BoxFit.cover,
                          width: 35,
                        ),
                        const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: (Get.height / 2)),
                  FutureBuilder<List<MovieModel>>(
                    future: apiController.getmovies(),
                    builder: (context, snapshot) {
                      List<MovieModel>? movieModelList = snapshot.data;
                      log(snapshot.data.toString());
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Something wrong"),
                        );
                      } else if (snapshot.hasData) {
                        return SizedBox(
                          height: Get.height * 0.4,
                          width: double.infinity,
                          child: HorizontalMoviesScrollList(
                              movieModelList: movieModelList),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalMoviesScrollList extends StatelessWidget {
  const HorizontalMoviesScrollList({
    Key? key,
    required this.movieModelList,
  }) : super(key: key);

  final List<MovieModel>? movieModelList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: movieModelList != null ? movieModelList!.length : 10,
      itemBuilder: (context, index) {
        MovieModel? data =
            movieModelList == null ? null : movieModelList![index];
        return Row(
          children: [
            Container(
              height: Get.height * 0.3,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(width: 10),
          ],
        );
      },
    );
  }
}
