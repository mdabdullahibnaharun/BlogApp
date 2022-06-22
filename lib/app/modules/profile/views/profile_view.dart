import 'package:blog_app/app/data/const.dart';
import 'package:blog_app/app/data/firebase/firebase_auth.dart';
import 'package:blog_app/app/data/global_widgets/tiles.dart';
import 'package:blog_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:blog_app/app/modules/login/controllers/login_controller.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "B",
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "l",
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.lime,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "o",
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "g",
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " A",
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "p",
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "p",
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Icon(
                  Icons.account_box_rounded,
                  size: 80.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Tile(
                  title: "My Blogs",
                  icon: Icons.edit_note,
                  function: () {
                    Get.toNamed(Routes.MY_BLOGS);
                  },
                ),
                Tile(
                  title: "Favourite",
                  icon: Icons.favorite_border_sharp,
                  function: () {
                    Get.toNamed(Routes.FAVOURITE);
                  },
                ),
                Tile(
                  title: "Log Out",
                  icon: Icons.logout_sharp,
                  function: () {
                    _authentication.logOut();
                  },
                ),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: GestureDetector(
                    onDoubleTap: () async {

                      try {
                        final Uri _url =
                            Uri.parse('https://github.com/mdabdullahibnaharun');
                        if (await launchUrl(_url)) {
                          showAlert('Could not launch $_url');
                        }
                      } catch (e) {
                        print(e.toString());
                      }

                    },
                    child: Center(
                      child: Column(
                        children: [
                          const Icon(Icons.engineering),
                          Text(
                            "Developer.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Md. Abdullah Ibna Harun",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
