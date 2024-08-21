import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/card_contact_us.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //screen size
    final constHeight = SizedBox(
      height: size.width * 0.03,
    ); //constant height

    Future clickableUrl(String uri) async {
      if (await canLaunchUrlString(uri)) {
        // await launch(uri,
        //     forceSafariVC: false, forceWebView: false, enableJavaScript: true);
            Uri url = Uri.parse(uri);
            await launchUrl(url);
      } else {
        throw 'Could not launch $uri';
      }
    }

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
          text: 'contact_us_title'.tr,
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
        margin: EdgeInsets.only(top: size.width * 0.07),
        child: Column(
          children: [
            ContactUsCard(
              handler: () {
                clickableUrl('tel:+966552047776');
              },
              text: 'via_mobile_number'.tr,
              iconName: 'phone',
              subTitle: "+966552047776",
            ),
            constHeight,
            ContactUsCard(
              handler: () {
                clickableUrl('mailto:awon@awon.com');
              },
              text: 'via_email'.tr,
              iconName: 'mail',
              subTitle: "awon@awon.com",
            ),
            constHeight,
            ContactUsCard(
              handler: () {
                clickableUrl("https://twitter.com/awontech_1");
              },
              text: 'via_twitter'.tr,
              iconName: 'twitter',
              subTitle: "@awontech_1",
            ),
            constHeight,
            ContactUsCard(
              handler: () {
                clickableUrl(
                    "https://www.google.com/maps/dir/21.6054488,39.123145/%D8%AC%D9%85%D8%B9%D9%8A%D8%A9+%D8%B9%D9%88%D9%86+%D8%A7%D9%84%D8%AA%D9%82%D9%86%D9%8A%D8%A9+%D9%85%D9%88%D9%82%D8%B9%E2%80%AD%E2%80%AD%E2%80%AD/@21.5019805,38.8796744,9z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x15c2055a13c6fb23:0xadfa30537c8e8098!2m2!1d39.9589528!2d21.3245392?entry=ttu");
              },
              text: 'visit_location'.tr,
              iconName: 'location',
              subTitle: "مكةالمكرمة, وادي مكة, جمعية عون التقنيه",
            ),
          ],
        ),
      )),
    );
  }
}
