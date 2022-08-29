import 'package:creo_netflix_clone/app/data/model/movie_model.dart';
import 'package:creo_netflix_clone/app/modules/show_details_screen/views/show_details_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(ShowDetailsScreenView(data: data));
              },
              child: Container(
                height: Get.height * 0.3,
                width: Get.width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500${data!.posterPath}"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        );
      },
    );
  }
}
