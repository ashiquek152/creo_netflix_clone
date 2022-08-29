import 'dart:developer';

import 'package:creo_netflix_clone/app/data/model/movie_model.dart';
import 'package:creo_netflix_clone/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class APIController extends GetxController {
  List<MovieModel> movieModelList = [];

  static final dio = Dio();

  static String BASE_URL = "https://api.themoviedb.org/3";
  static String API_KEY = "3c12ddf4e10d971f7c8e87cb7dada16c";
  // String Tv ="https://api.themoviedb.org/3/tv/latest?api_key=3c12ddf4e10d971f7c8e87cb7dada16c&language=en-US";

  Future<List<MovieModel>> getMovies(String movietype) async {
    try {
      final Response response =
          await dio.get("$BASE_URL/movie/$movietype?api_key=$API_KEY&language=en-US&page=1");
      if (response.statusCode == 200) {
        Iterable movies = response.data['results'];
        movieModelList = movies.map((e) => MovieModel.fromJson(e)).toList();
        log("Get movies function called");
        // print(movieModelList.first.releaseDate);
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
   Future<List<MovieModel>> getTvShows(String showType) async {
    try {
      final Response response =
        await dio.get("$BASE_URL/tv/$showType?api_key=$API_KEY&language=en-US");
      if (response.statusCode == 200) {
        Iterable movies = response.data['results'];
        movieModelList = movies.map((e) => MovieModel.fromJson(e)).toList();
        log("Get Tv shows function called");
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
