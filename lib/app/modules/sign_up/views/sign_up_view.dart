import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/global_widgets/title.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

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
                "Sign Up",
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
                controller: controller.fullName,
                decoration: InputDecoration(
                    labelText: 'Full Name',
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
                  controller.onCreateAccount();
                },
                title: "Create Account"),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text(
            "Already have an account.? Login",
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
