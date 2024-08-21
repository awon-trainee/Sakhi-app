import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonBarController extends GetxController  with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var initialIndex = 0;

  @override
  void onInit() {
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    tabController.addListener(handleTabSelection);
    super.onInit();
  }

  void handleTabSelection() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          initialIndex = 0;
          update();
          break;
        case 1:
          initialIndex = 1;
          update();
          break;
        case 2:
          initialIndex = 2;
          update();
          break;
        case 3:
          initialIndex = 3;
          update();
          break;
          // default:
          //   initialIndex = 0;
          //   update();
      }
    }
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}