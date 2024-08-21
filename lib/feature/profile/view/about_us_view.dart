import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/gradient_text.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';
import 'package:get/get.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(size.width * 0.047, size.width * 0.047),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: greyColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          text: 'about_us_title'.tr,
          color: blackGreyColor,
          fontSize: size.width * 0.038,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.023),
          margin: EdgeInsets.only(top: size.width * 0.023),
          child: Column(
            children: [
              Image.asset(
                "assets/images/saki_logo.png",
                height: size.width * 0.35,
                width: size.width * 0.4,
                fit: BoxFit.cover,
              ),
              GradientText(
                "تطبيق سَخي",
                gradient: RadialGradient(
                  radius: size.width * 0.012,
                  center: Alignment.bottomLeft,
                  colors: const [
                    Color.fromRGBO(69, 148, 225, 1),
                    Color.fromRGBO(63, 195, 238, 1),
                  ],
                ),
                style: TextStyle(
                    fontSize: size.width * 0.042, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextWidget(
                text: 'about_us_content'.tr,
                fontSize: size.width * 0.04,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
