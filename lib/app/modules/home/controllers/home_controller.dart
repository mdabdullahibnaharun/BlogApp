import 'package:blog_app/app/data/firebase/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:blog_app/app/models/blog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();
  final ScrollController controller = ScrollController();
  List<BlogsModel> blogs = [];
  List favouriteList = [];
  var isLoading = false.obs;

  void getData() async {
    blogs.addAll(await _functions.getBlogs());

    update();
  }

  @override
  void onReady() {
    // ignore: todo
    // TODO: implement onReady
    super.onReady();
    Indicator.showLoading();
  }

  Future<void> getFavouriteList() async {
    favouriteList = await _functions.getFavouriteList();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
    getFavouriteList();
    _functions.isLoading.listen((p) {
      isLoading.value = p;
    });
    controller.addListener(() {
      double maxScrollPoint = controller.position.maxScrollExtent;
      double currentPosition = controller.position.pixels;
      double height20 = Get.size.height * 0.20;

      if (maxScrollPoint - currentPosition <= height20) {
        getData();
      }
    });
  }
}
