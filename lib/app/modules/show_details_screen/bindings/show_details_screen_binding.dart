import 'package:get/get.dart';

import '../controllers/show_details_screen_controller.dart';

class ShowDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowDetailsScreenController>(
      () => ShowDetailsScreenController(),
    );
  }
}
