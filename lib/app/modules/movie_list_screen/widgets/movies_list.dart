

import 'package:creo_netflix_clone/app/data/api_services.dart';
import 'package:creo_netflix_clone/app/data/model/movie_model.dart';
import 'package:creo_netflix_clone/app/widgets/horizontal_movie_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



class MoviesList extends StatelessWidget {
  MoviesList({Key? key, required this.movieType, required this.title})
      : super(key: key);
      
  final apiController = Get.put(APIController());
  final String movieType;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: apiController.getMovies(movieType),
      builder: (context, snapshot) {
        List<MovieModel>? movieModelList = snapshot.data;
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something wrong"),
          );
        } else if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.height * 0.035,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.32,
                width: double.infinity,
                child:
                    HorizontalMoviesScrollList(movieModelList: movieModelList),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
