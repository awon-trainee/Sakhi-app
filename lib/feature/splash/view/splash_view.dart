import 'package:flutter/material.dart';

import '../controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              'assets/images/scaffold_image.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/splash_logo.gif',
              width: 1500,
              height: 600,
            ),
          ]),
        ));
  }
}
