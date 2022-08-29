import 'package:get/get.dart';

import '../controllers/movie_list_screen_controller.dart';

class MovieListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieListScreenController>(
      () => MovieListScreenController(),
    );
  }
}
