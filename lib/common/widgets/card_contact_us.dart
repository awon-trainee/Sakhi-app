import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';
import '../../core/theme/colors.dart';
import 'package:get/get.dart';

class ContactUsCard extends StatelessWidget {
  final String iconName;
  final String text;
  final String subTitle;
  final VoidCallback handler;
  const ContactUsCard(
      {super.key,
      required this.text,
      required this.iconName,
      required this.subTitle,
      required this.handler});

  @override
  Widget build(BuildContext context) {
    bool isArabic() {
      if (Get.locale == Locale('ar', 'SA')) {
        return true;
      } else {
        return false;
      }
    }

    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: handler,
      child: Container(
        height: size.width * 0.22,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.width * 0.023)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: size.width * 0.056),
                Image.asset('assets/icons/$iconName.png',
                    scale: size.width * 0.005),
                SizedBox(width: size.width * 0.047),
                Container(
                  padding: isArabic() == false
                      ? EdgeInsets.only(
                          right: size.width * 0.06, top: size.width * 0.05)
                      : EdgeInsets.only(
                          left: size.width * 0.06, top: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          fontWeight: FontWeight.w500,
                          color: greyColor,
                          text: text,
                          fontSize: size.width * 0.04),
                      SizedBox(
                        height: size.width * 0.005,
                      ),
                      TextWidget(
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                          text: subTitle,
                          fontSize: size.width * 0.04),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
