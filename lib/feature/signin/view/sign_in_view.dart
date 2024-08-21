import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sakhi_app/common/widgets/button_widget.dart';
import 'package:get/get.dart';
import 'package:sakhi_app/feature/signin/controller/sign_in_controller.dart';
import '../../../common/country_list.dart';
import '../../../common/widgets/gradient_text.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';

class SignInView extends StatefulWidget {
  SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final signInController = Get.put(SignInController());

  bool isEnabledButton = false;
  bool isArabic() {
    if (Get.locale == Locale('ar', 'SA')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: size.width * 0.234),
              Image.asset(
                'assets/images/scaffold_image.png',
                //   scale: size.width * 0.01,
                fit: BoxFit.cover,
              ),
              Center(
                child: Image.asset(
                  'assets/images/saki_logo.png',
                  scale: size.width * 0.01,
                ),
              ),
              SizedBox(height: size.width * 0.012),
              Center(
                child: GradientText(
                  'sign_in_title'.tr,
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
              ),
              SizedBox(height: size.width * 0.117),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.08, right: size.width * 0.08),
                child: TextWidget(
                  text: 'sign_in_mobile_text'.tr,
                  fontSize: size.width * 0.033,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              SizedBox(height: size.width * 0.011),
              Center(
                child: SizedBox(
                  width: size.width * 0.86,
                  child: IntlPhoneField(
                    controller: signInController.phoneNumberController,
                    flagsButtonPadding: EdgeInsets.all(size.width * 0.02),
                    initialCountryCode: 'SA',
                    textAlign: isArabic() ? TextAlign.right : TextAlign.left,
                    showDropdownIcon: false,
                    countries: country,
                    disableLengthCheck: true,
                    keyboardType: Platform.isIOS
                        ? const TextInputType.numberWithOptions(
                            signed: true, decimal: true)
                        : TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      if (signInController
                          .phoneNumberController.text.isNotEmpty) {
                        setState(() {
                          isEnabledButton = true;
                        });
                      }
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "XX XXX XXXX",
                      contentPadding: EdgeInsets.all(size.width * 0.042),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.width * 0.023),
                        borderSide: BorderSide(
                            width: size.width * 0.0047, color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.width * 0.023),
                        borderSide: BorderSide(
                            width: size.width * 0.0047, color: borderColor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.width * 0.5),
              ButtonWidget(
                onPressed: isEnabledButton
                    ? () {
                        signInController.signInByPhone(context);

                        //   Get.toNamed(UserRoutes.otpView);
                      }
                    : null,
                text: 'sign_in_button'.tr,
              )
            ],
          ),
        ),
      ),
    );
  }
}
