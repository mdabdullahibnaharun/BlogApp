import 'package:get/get.dart';

import '../controllers/title_controller.dart';

class TitleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TitleController>(
      () => TitleController(),
    );
  }
}
