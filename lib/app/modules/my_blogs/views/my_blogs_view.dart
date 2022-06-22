import 'package:blog_app/app/data/global_widgets/app_bar.dart';
import 'package:blog_app/app/data/global_widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/my_blogs_controller.dart';

class MyBlogsView extends GetView<MyBlogsController> {
  const MyBlogsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const CustomAppBar(title: "My Blogs"),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: GetBuilder<MyBlogsController>(
                builder: (value) {
                  if (value.myBlogs.isNotEmpty) {
                    return ListView.builder(
                      itemCount: value.myBlogs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.sp,
                            vertical: 5.sp,
                          ),
                          child: Post(
                            edit: () {
                              controller.editBlog(value.myBlogs[index]);
                            },
                            delete: () {
                              controller.deleteBlog(value.myBlogs[index].id);
                            },
                            isPopUpMenuEnabled: true,
                            model: value.myBlogs[index],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("No Blogs Available"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
