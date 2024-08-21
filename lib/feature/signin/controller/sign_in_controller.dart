


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhi_app/feature/signin/controller/service.dart';
import 'package:sakhi_app/feature/signin/model/validate_otp.dart';

import '../../../common/widgets/loading_widget.dart';
import '../../../common/widgets/snack_bar_content_widget.dart';
import '../../../core/route/app_route.dart';
import '../../../core/theme/colors.dart';
import '../model/sign_in_model.dart';

class SignInController extends GetxController{
  final AuthService service = AuthService();
  final phoneNumberController = TextEditingController();

  final otpCode1Controller = TextEditingController();
  final otpCode2Controller = TextEditingController();
  final otpCode3Controller = TextEditingController();
  final otpCode4Controller = TextEditingController();

  bool isDone = false;

  signInByPhone(BuildContext context) async {
   Get.dialog(const LoadingWidget());
    var user = SignInUser(
      phoneNumber: phoneNumberController.text,
    );
    await service.signInByPhone(
      user: user,
      onDone: (value) {
        isDone = true;

      },
      onError: (value) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            elevation: 0,
            backgroundColor: redColor,

            content: SnackBarContentWidget(
              icon: Icons.error_outline_outlined,
              text: value.substring(0,25),
              subText: value.substring(27),
            ),
            

          ),
        );

      },
      onFinally: () {
        if (isDone) {
          Get.close(1);
          Get.offNamed(UserRoutes.otpView,parameters: {'phone':phoneNumberController.text});

          isDone = false;
        } else {
          Get.close(1);
        }

      },
    );
  }


  validateOTP(String phoneNumber,BuildContext context) async {
    Get.dialog(const LoadingWidget());
    var user = ValidateOTP(
      phoneNumber: phoneNumber,
      sms: otpCode1Controller.text +otpCode2Controller.text+otpCode3Controller.text+otpCode4Controller.text
    );
    await service.validateOTP(
      user: user,
      onDone: (value) {
        isDone = true;

      },
      onError: (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            elevation: 0,
            backgroundColor: redColor,

            content: SnackBarContentWidget(
              icon: Icons.error_outline_outlined,
              text: value,
            ),


          ),
        );
      },
      onFinally: () {
        if (isDone) {
          Get.close(1);
          Get.offNamed(UserRoutes.homeView,parameters: {'phone':phoneNumberController.text});
          isDone = false;
        } else {
          Get.close(1);
        }

      },
    );
  }
  void clearText() {
    phoneNumberController.clear();
    otpCode1Controller.clear();
    otpCode2Controller.clear();
    otpCode3Controller.clear();
    otpCode4Controller.clear();
  }
  @override
  void dispose() {

    phoneNumberController.dispose();
    otpCode1Controller.dispose();
    otpCode2Controller.dispose();
    otpCode3Controller.dispose();
    otpCode4Controller.dispose();
    super.dispose();
  }
}

