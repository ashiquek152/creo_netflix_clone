import 'dart:developer';

import 'package:creo_netflix_clone/app/data/model/movie_model.dart';
import 'package:creo_netflix_clone/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class APIController extends GetxController {
  List<MovieModel> movieModelList = [];

  static final dio = Dio();

  static String BASE_URL = "https://api.themoviedb.org/3/movie";
  static String API_KEY = "3c12ddf4e10d971f7c8e87cb7dada16c";

  Future<List<MovieModel>> getMovies(String movietype) async {
    try {
      final Response response =
          await dio.get("$BASE_URL/$movietype?api_key=$API_KEY&language=en-US&page=1");
      if (response.statusCode == 200) {
        Iterable movies = response.data['results'];
        movieModelList = movies.map((e) => MovieModel.fromJson(e)).toList();
        log("Get movies function called");
      }
      return movieModelList;
    } on DioError catch (e) {
      snackBar(message: e.message, title: "Something went wrong");
      return movieModelList;
    } catch (e) {
      snackBar(message: "Failed to load movies", title: "Error");
      return movieModelList;
    }
  }
}
