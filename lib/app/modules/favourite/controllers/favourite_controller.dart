import 'package:blog_app/app/data/firebase/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:blog_app/app/models/blog_model.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();
  final controller = Get.find<HomeController>();
  List<BlogsModel> models = [];

  void getFavouriteList() async {
    models = [];
    for (var i = 0; i < controller.favouriteList.length; i++) {
      models.add(await _functions.getBlogsById(controller.favouriteList[i]));
    }

    Indicator.closeLoading();
    update();
  }

  @override
  void onReady() {
    // ignore: todo
    // TODO: implement onReady
    super.onReady();
    Indicator.showLoading();
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    getFavouriteList();
  }
}
