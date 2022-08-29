import 'package:get/get.dart';

class BottomNavigationsController extends GetxController {
  // //TODO: Implement BottomNavigationsController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
  int currentPage = 0;



  swithPageIndex(index){
    currentPage=index;
    update();
  }
}
