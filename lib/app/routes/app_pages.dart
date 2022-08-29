import 'package:get/get.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/bottom_navigations/bindings/bottom_navigations_binding.dart';
import '../modules/bottom_navigations/views/bottom_navigations_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movie_list_screen/bindings/movie_list_screen_binding.dart';
import '../modules/movie_list_screen/views/movie_list_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAVIGATIONS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATIONS,
      page: () => BottomNavigationsView(),
      binding: BottomNavigationsBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_LIST_SCREEN,
      page: () =>  MovieListScreenView(),
      binding: MovieListScreenBinding(),
    ),
  ];
}
