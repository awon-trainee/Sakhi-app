import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';
import 'package:get/get.dart';
import '../../core/theme/colors.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
class DashedContainerWidget extends StatelessWidget {
  final String code;
  const DashedContainerWidget({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isArabic() {
      if (Get.locale == Locale('ar', 'SA')) {
        return true;
      } else {
        return false;
      }
    }

    return Center(
      child: Container(
        width: size.width * 0.727,
        height: size.width * 0.168,
        padding: isArabic() ? EdgeInsets.only(left: size.width * 0.140):EdgeInsets.only(right: size.width * 0.140),
        decoration: BoxDecoration(
          border: const DashedBorder.fromBorderSide(
              dashLength: 3, side: BorderSide(color: lightBlueColor, width: 1)),
          borderRadius: BorderRadius.circular(size.width * 0.035),
          color: whiteColor,
          shape: BoxShape.rectangle,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: size.width * 0.047),
            Container(
              width: size.width * 0.112,
              height: size.width * 0.112,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.035),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [lightBlueColor, babyBlueColor],
                ),
              ),
              child: const Icon(
                Icons.copy_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(width: size.width * 0.047),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'the_code'.tr,
                  color: darkPurpleColor,
                  fontSize: size.width * 0.038,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: size.width * 0.01),
                InkWell(
                  onTap: () async {
                    if (await canLaunchUrlString(code)) {
                      Uri myUri = Uri.parse(code);
                    // await launch(code,
                    // forceSafariVC: false, forceWebView: false, enableJavaScript: true);
                    await launchUrl(myUri);
                    } else {
                    throw 'Could not launch $code';
                    }
                  },
                  child: TextWidget(
                    text: "click_here".tr,
                    color: blueColor,
                    fontSize: size.width * 0.033,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
