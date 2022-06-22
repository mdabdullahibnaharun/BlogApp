import 'package:get/get.dart';

import '../controllers/my_blogs_controller.dart';

class MyBlogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBlogsController>(
      () => MyBlogsController(),
    );
  }
}
