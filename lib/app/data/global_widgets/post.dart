import 'package:blog_app/app/models/blog_model.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Post extends StatelessWidget {
  final BlogsModel model;
  final bool isPopUpMenuEnabled;
  final Function? edit, delete;

  const Post(
      {required this.isPopUpMenuEnabled,
      required this.model,
      this.edit,
      this.delete,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.BLOG_DETAIL_SCREEN, arguments: model);
      },
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 220.h,
          width: 100.w,
          child: Column(
            children: [
              //Image.
              Container(
                height: 155.h,
                width: 330.w,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(model.image),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.topRight,
                child: isPopUpMenuEnabled
                    ? Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: PopupMenuButton(
                          onSelected: (value) {
                            if (value == 0) {
                              edit!();
                            } else if (value == 1) {
                              delete!();
                            }
                          },
                          child: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              child: Text("Edit"),
                              value: 0,
                            ),
                            const PopupMenuItem(
                              child: Text("Delete"),
                              value: 1,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),

              SizedBox(
                height: 5.h,
              ),

              Text(
                model.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
