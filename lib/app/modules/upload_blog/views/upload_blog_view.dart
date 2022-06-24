import 'package:blog_app/app/data/global_widgets/app_bar.dart';
import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:blog_app/app/data/global_widgets/text_field.dart';
import 'package:blog_app/app/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/upload_blog_controller.dart';

// ignore: must_be_immutable
class UploadBlogView extends GetView<UploadBlogController> {
  BlogsModel? model = Get.arguments;

  @override
  Widget build(BuildContext context) {
    if (model != null) {
      controller.title = TextEditingController(text: model!.title);
      controller.description = TextEditingController(text: model!.description);
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomAppBar(
                title: model == null ? "Create Blog" : "Update Blog",
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 200.h,
                width: 300.w,
                alignment: Alignment.center,
                color: Colors.white30,
                child: GetBuilder<UploadBlogController>(
                  builder: (value) {
                    if (value.imageFile != null) {
                      return Image.file(value.imageFile!);
                    } else {
                      return CustomButton(
                          function: () {
                            controller.pickImage();
                          },
                          title: "Select Image");
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ReusableTextField(
                isMultiline: false,
                hintText: "Title",
                controller: controller.title,
              ),
              SizedBox(
                height: 20.h,
              ),
              ReusableTextField(
                hintText: "Description",
                controller: controller.description,
                isMultiline: true,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60.h,
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: CustomButton(
            function: () {
              if (model == null) {
                controller.createBlog();
              } else {
                controller.editBlog(model!);
              }
            },
            title: model == null ? "Create Blog" : "Update Blog",
          ),
        ),
      ),
    );
  }
}
