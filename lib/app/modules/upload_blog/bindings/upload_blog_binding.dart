import 'package:get/get.dart';

import '../controllers/upload_blog_controller.dart';

class UploadBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadBlogController>(
      () => UploadBlogController(),
    );
  }
}
