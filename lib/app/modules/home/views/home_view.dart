import 'package:blog_app/app/data/global_widgets/post.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  Future<void> _refresh() async {
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "B",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "l",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.lime,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "o",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "g",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        " A",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "p",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "p",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                    icon: Icon(
                      Icons.account_box,
                      size: 25.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (value) {
                  if (value.blogs.isNotEmpty) {
                    return RefreshIndicator(
                      onRefresh: _refresh,
                      child: ListView.builder(
                        controller: controller.controller,
                        itemCount: value.blogs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.sp, vertical: 5.sp),
                            child: Post(
                              isPopUpMenuEnabled: false,
                              model: value.blogs[index],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("No Blogs Available."),
                    );
                  }
                },
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return SizedBox(
                  height: 60.h,
                  child: const CircularProgressIndicator.adaptive(),
                );
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () {
              Get.toNamed(Routes.UPLOAD_BLOG);
            },
            label: Row(
              children: [
                Icon(
                  Icons.post_add,
                  size: 24.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Create Blog",
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
