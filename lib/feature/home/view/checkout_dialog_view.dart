import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/route/app_route.dart';
import '../../../core/theme/colors.dart';

class CheckoutDialogView extends StatelessWidget {
  const CheckoutDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 1.241,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size.width * 0.086),
              topRight: Radius.circular(size.width * 0.086))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.width * 0.584,
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.width * 0.086),
                    topRight: Radius.circular(size.width * 0.086))),
          ),
          SizedBox(height: size.width * 0.070),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.0491, right: size.width * 0.0491),
            child: TextWidget(
              text: 'Noon 25 SAR',
              color: blackColor,
              fontSize: size.width * 0.0491,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: size.width * 0.035),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.0491, right: size.width * 0.0491),
            child: TextWidget(
              text: '${'gift_card'.tr} noon',
              color: darkGreyColor,
              fontSize: size.width * 0.040,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: size.width * 0.058),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.0491, right: size.width * 0.0491),
            child: TextWidget(
              text: '25 SAR',
              color: greenColor,
              fontSize: size.width * 0.0491,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: size.width * 0.093),
          ButtonWidget(
            onPressed: () {
              Get.toNamed(UserRoutes.checkoutCompletedView);
            },
            text: 'checkout_button'.tr,
          ),
        ],
      ),
    );
  }
}
