import 'package:blog_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void isLoggedIn() {
    if (_auth.currentUser != null) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  @override
  void onReady() {

    super.onReady();
    isLoggedIn();
  }
}
