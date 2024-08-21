import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/constant/keys.dart';
import '../../../core/route/app_route.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    // if (getStorage.read(Keys.token) == null) {
    //   Future.delayed(const Duration(seconds: 2), () {
    //     Get.offNamed(UserRoutes.signInView);
    //   });
    // } else {
    //   Future.delayed(const Duration(seconds: 2), () {
    //     Get.offNamed(UserRoutes.homeView);
    //   });
    // }
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(UserRoutes.homeView);
    });
  }
}
