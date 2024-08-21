import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:sakhi_app/feature/signin/controller/sign_in_controller.dart';

import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/gradient_text.dart';
import '../../../core/theme/colors.dart';
import 'package:get/get.dart';

class OTPView extends StatefulWidget {
  OTPView({Key? key}) : super(key: key);

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final otpController = Get.put(SignInController());
  bool isTab = false;
  late Timer timer;
  int start = 60;

  @override
  void initState() {
    startTimer();

    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scaffold_image.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/saki_logo.png',
              scale: size.width * 0.01,
            ),
            SizedBox(height: size.width * 0.012),
            GradientText(
              'otp_title'.tr,
              style: TextStyle(
                fontFamily: 'RubikRegular',
                fontSize: size.width * 0.042,
                fontWeight: FontWeight.w500,
              ),
              gradient: const LinearGradient(colors: [
                lightBlueColor,
                babyBlueColor,
              ]),
            ),
            SizedBox(height: size.width * 0.058),
            TextWidget(
              text: 'otp_sent_message'.tr,
              fontSize: size.width * 0.038,
              fontWeight: FontWeight.w500,
              color: blackColor,
            ),
            SizedBox(height: size.width * 0.012),
            TextWidget(
              text: '+966${Get.parameters['phone']}',
              fontSize: size.width * 0.040,
              fontWeight: FontWeight.w400,
              color: lightBlueColor,
            ),
            SizedBox(height: size.width * 0.082),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  otpCodeWidget(
                      controller: otpController.otpCode1Controller, size: size),
                  SizedBox(width: size.width * 0.047),
                  otpCodeWidget(
                      controller: otpController.otpCode2Controller, size: size),
                  SizedBox(width: size.width * 0.047),
                  otpCodeWidget(
                      controller: otpController.otpCode3Controller, size: size),
                  SizedBox(width: size.width * 0.047),
                  otpCodeWidget(
                      controller: otpController.otpCode4Controller, size: size),
                ],
              ),
            ),
            SizedBox(height: size.width * 0.047),
            TextWidget(
              text: "0:$start",
              fontSize: size.width * 0.038,
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
            SizedBox(height: size.width * 0.082),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'otp_message_not_reveive'.tr,
                  fontSize: size.width * 0.040,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
                InkWell(
                  onTap: start != 0
                      ? null
                      : () {
                          start = 60;
                          startTimer();
                          otpController.signInByPhone(context);
                        },
                  child: TextWidget(
                    text: 'otp_resend'.tr,
                    fontSize: size.width * 0.040,
                    fontWeight: FontWeight.w400,
                    color: lightBlueColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.width * 0.187),
            ButtonWidget(
                onPressed: () {
                  otpController.validateOTP(Get.parameters['phone'].toString(), context);
                  otpController.clearText();
                },
                text: 'otp_verify'.tr)
          ],
        ),
      )),
    );
  }

  Widget otpCodeWidget(
      {required TextEditingController controller, required Size size}) {
    return SizedBox(
      width: size.width * 0.164,
      height: size.width * 0.140,
      child: TextField(
        onChanged: (value) {
          FocusScope.of(context).nextFocus();
        },
        autofocus: true,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: Platform.isIOS
            ? const TextInputType.numberWithOptions(signed: true, decimal: true)
            : TextInputType.number,
        controller: controller,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: size.width * 0.051,
            fontWeight: FontWeight.w700,
            fontFamily: 'RubikRegular',
            color: otpTextColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: controller.text.isEmpty ? otpFillColor : Colors.white,
          disabledBorder: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * 0.019),
            borderSide: BorderSide(color: otpBorderColor),
          ),
          enabledBorder: GradientOutlineInputBorder(
              borderRadius: BorderRadius.circular(size.width * 0.019),
              gradient: LinearGradient(colors: [lightBlueColor, babyBlueColor]),
              width: 1.2),
          focusedBorder: GradientOutlineInputBorder(
              borderRadius: BorderRadius.circular(size.width * 0.019),
              gradient: LinearGradient(colors: [lightBlueColor, babyBlueColor]),
              width: 1.2),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
