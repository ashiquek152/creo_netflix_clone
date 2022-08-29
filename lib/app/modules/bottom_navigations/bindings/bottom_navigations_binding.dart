import 'package:get/get.dart';

import '../controllers/bottom_navigations_controller.dart';

class BottomNavigationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationsController>(
      () => BottomNavigationsController(),
    );
  }
}
