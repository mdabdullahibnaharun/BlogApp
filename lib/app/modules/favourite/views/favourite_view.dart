import 'package:blog_app/app/data/global_widgets/app_bar.dart';
import 'package:blog_app/app/data/global_widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const CustomAppBar(title: "Favourite"),
            Expanded(
              child: GetBuilder<FavouriteController>(builder: (value) {
                if (value.models.isNotEmpty) {
                  return ListView.builder(
                    itemCount: value.models.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.sp, vertical: 5.sp),
                        child: Post(
                          isPopUpMenuEnabled: false,
                          model: value.models[index],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No Favourites available"),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
