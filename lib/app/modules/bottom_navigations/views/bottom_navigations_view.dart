import 'package:creo_netflix_clone/app/modules/bottom_navigations/views/downloads.dart';
import 'package:creo_netflix_clone/app/modules/bottom_navigations/views/settings.dart';
import 'package:creo_netflix_clone/app/modules/home/views/home_view.dart';
import 'package:creo_netflix_clone/app/modules/movie_list_screen/views/movie_list_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_navigations_controller.dart';
import 'package:bottom_bar/bottom_bar.dart';

class BottomNavigationsView extends GetView<BottomNavigationsController> {
  BottomNavigationsView({Key? key}) : super(key: key);

  final _pageController = PageController();
  final _bottomController = Get.put(BottomNavigationsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationsController>(builder: (context) {
      return Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            HomeView(),
             const MovieListScreenView(),
            const DownloadsView(),
            const SettingsView()
          ],
          onPageChanged: (index) {
            _bottomController.swithPageIndex(index);
          },
        ),
        bottomNavigationBar: BottomBar(
          backgroundColor: Colors.black,
          selectedIndex: _bottomController.currentPage,
          onTap: (int index) {
            _pageController.jumpToPage(index);
            _bottomController.swithPageIndex(index);
          },
          items: const <BottomBarItem>[
            BottomBarItem(
              
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              title: Text('Home'),
              activeColor: Color.fromARGB(255, 255, 19, 2),
            ),
            BottomBarItem(
              icon: Icon(Icons.list, size: 25),
              title: Text('Shows'),
              activeColor: Color.fromARGB(255, 255, 19, 2),
            ),
            BottomBarItem(
              icon: Icon(Icons.download, size: 25),
              title: Text('Downloads'),
              activeColor: Color.fromARGB(255, 255, 19, 2),
            ),
            BottomBarItem(
              icon: Icon(Icons.settings, size: 25),
              title: Text('Settings'),
              activeColor: Color.fromARGB(255, 255, 19, 2),
            ),
          ],
        ),
      );
    });
  }
}
