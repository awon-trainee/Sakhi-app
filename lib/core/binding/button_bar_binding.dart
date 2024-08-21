import 'package:get/get.dart';
import 'package:sakhi_app/feature/home/controller/button_bar_controller.dart';




class ButtonBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ButtonBarController());
  }
}