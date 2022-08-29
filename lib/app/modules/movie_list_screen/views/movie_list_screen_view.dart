import 'package:creo_netflix_clone/app/widgets/movies_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movie_list_screen_controller.dart';

class MovieListScreenView extends GetView<MovieListScreenController> {
  const MovieListScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MoviesList(movieType: "upcoming", title: "Upcoming Movies"),
                  MoviesList(movieType: "popular", title: "Popular Movies"),
                  MoviesList(movieType: "top_rated", title: "Top Rated"),
                  MoviesList(movieType: "now_playing", title: "Now Playing"),
                ],
              ),
            ),
          ),
        ));
  }
}
