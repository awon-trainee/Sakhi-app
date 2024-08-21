import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';
import 'package:get/get.dart';
import '../../core/theme/colors.dart';

class CardProfileWidget extends StatelessWidget {
  final String iconName;
  final String text;
  final VoidCallback? onTap;

  const CardProfileWidget(
      {Key? key, required this.iconName, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.width * 0.130,
        width: size.width * 0.818,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.width * 0.023)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: size.width * 0.056),
                Image.asset(
                  'assets/icons/$iconName.png',
                  scale: 1.5,
                ),
                SizedBox(width: size.width * 0.047),
                TextWidget(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff054A8D),
                    text: text,
                    fontSize: size.width * 0.033),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.033, left: size.width * 0.033),
              child: Row(
                children: [
                  text == 'change_language'.tr ?TextWidget(
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                      text: 'translate'.tr,
                      fontSize: size.width * 0.033):Container(),
                  SizedBox(width: size.width * 0.03),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff4F4F4F),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
