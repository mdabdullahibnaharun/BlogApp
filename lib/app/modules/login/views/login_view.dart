import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:blog_app/app/data/global_widgets/title.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:blog_app/app/modules/title/views/title_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 80.h,
            ),
            const TitleLogo(),
            SizedBox(
              height: 60.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: controller.email,
                decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.blue),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.blue),
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: controller.password,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.blue),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.red),
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              function: () {
                controller.onLogin();
              },
              title: "Login",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SIGN_UP);
          },
          child: Text(
            "Don't have an account.? Register",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
