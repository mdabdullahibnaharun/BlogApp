import 'dart:io';

import 'package:blog_app/app/data/const.dart';
import 'package:blog_app/app/data/firebase/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:blog_app/app/models/blog_model.dart';
import 'package:blog_app/app/modules/my_blogs/controllers/my_blogs_controller.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadBlogController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final FirebaseFunctions _functions = FirebaseFunctions();
  File? imageFile;

  Future<void> pickImage() async {
    try {
      ImagePicker _picker = ImagePicker();

      await _picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value != null) {
          imageFile = File(value.path);
          update();
        }
      });
    } catch (e) {
      showAlert("$e");
    }
  }

  void createBlog() async {
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      if (imageFile != null) {
        Indicator.showLoading();

        await _functions
            .uploadBlog(title.text, description.text, imageFile!)
            .then((value) {
          Indicator.closeLoading();
          showAlert("Blog created sucessfully");
          // Get.back();
          Get.toNamed(Routes.HOME);
        });
      } else {
        showAlert("Image is required");
      }
    } else {
      showAlert("All fields are required");
    }
  }

  void editBlog(BlogsModel model) async {
    Indicator.showLoading();

    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      if (imageFile == null) {
        Map<String, dynamic> map = {
          'title': title.text,
          'description': description.text,
        };

        await _functions.editBlog(model.id, map).then((value) {
          Get.toNamed(Routes.HOME);
          showAlert("Blog Updated Sucessfully");
        });
      } else {
        String imageUrl = await _functions.uploadImage(imageFile!);

        Map<String, dynamic> map = {
          'title': title.text,
          'description': description.text,
          'img': imageUrl,
        };

        await _functions.editBlog(model.id, map).then((value) {
          Get.toNamed(Routes.HOME);
          showAlert("Blog Updated Sucessfully");
        });
      }
    } else {
      showAlert("All fields are required");
    }

    Indicator.closeLoading();
    updateData();
  }

  void updateData() {
    Get.back();
    Get.toNamed(Routes.HOME);
    if (Get.isRegistered<MyBlogsController>()) {
      final controller = Get.find<MyBlogsController>();

      controller.myBlogs = [];
      Indicator.showLoading();
      controller.getMyBlogData();
    }
  }
}
