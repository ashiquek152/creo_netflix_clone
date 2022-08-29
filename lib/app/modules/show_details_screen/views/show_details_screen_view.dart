import 'package:creo_netflix_clone/app/data/model/movie_model.dart';
import 'package:creo_netflix_clone/app/modules/show_details_screen/widgets/details_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/show_details_screen_controller.dart';

class ShowDetailsScreenView extends GetView<ShowDetailsScreenController> {
  const ShowDetailsScreenView({this.data, Key? key}) : super(key: key);
  final MovieModel? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${data!.backdropPath}",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        data!.title != null
                            ? Text(
                                data!.title.toString(),
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            : const Text(
                                "Not available",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red),
                              ),
                        Text(
                          "⭐ ${data!.voteAverage.toString()}",
                          style: TextStyle(
                              fontSize: Get.width * 0.05, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500${data!.posterPath}"),
                                fit: BoxFit.contain),
                          ),
                          height: Get.height * 0.4,
                          width: Get.width * 0.4,
                        ),
                        SizedBox(width: Get.width * 0.02),
                        Flexible(
                          child: Text(
                            data!.overview ?? "Not availabe",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    DetailsSpanText(data: data!.id.toString(), title: "ID"),
                    DetailsSpanText(
                        data: data!.adult == true ? "Yes" : "No".toString(),
                        title: "Adult"),
                    DetailsSpanText(
                        data: data!.originalLanguage.toString(),
                        title: "Original Language"),
                    DetailsSpanText(
                        data: data!.originalTitle.toString(),
                        title: "Original Title"),
                    DetailsSpanText(
                        data: data!.popularity.toString(), title: "Popularity"),
                    DetailsSpanText(
                        data: data!.releaseDate.toString(),
                        title: "Release Date"),
                    DetailsSpanText(
                        data: data!.voteCount.toString(), title: "Vote Count"),

                        SizedBox(height: Get.height*0.02,)
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
            child: IconButton(
              tooltip: "Go Back",
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
