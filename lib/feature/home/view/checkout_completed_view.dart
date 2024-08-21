import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakhi_app/common/widgets/image_widget.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/dashed_container.dart';
import '../../../common/widgets/scaffold_widget.dart';
import '../../../common/widgets/separator_widget.dart';
import '../../../common/widgets/snack_bar_content_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';
import '../controller/home_controller.dart';

import 'package:get/get.dart';

class CheckoutCompletedView extends StatelessWidget {
  CheckoutCompletedView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldWidget(
        isBackButton: true,
        title: 'checkout_title'.tr,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Center(
                child: Container(
                  height: size.width * 1.5,
                  width: size.width * 0.904,
                  color: backgroundColor,
                  padding: EdgeInsets.only(top: size.width * 0.117),
                  margin: EdgeInsets.only(bottom: size.width * 0.350),
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.023),
                    ),
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.width * 0.17),
                          Center(
                            child: TextWidget(
                              text: 'checkout_thank_you'.tr,
                              fontSize: size.width * 0.051,
                              fontWeight: FontWeight.w500,
                              color: darkPurpleColor,
                            ),
                          ),
                          SizedBox(height: size.width * 0.035),
                          Center(
                            child: TextWidget(
                              text: 'checkout_message'.tr,
                              fontSize: size.width * 0.038,
                              fontWeight: FontWeight.w400,
                              color: lightPurpleColor,
                            ),
                          ),
                          SizedBox(height: size.width * 0.028),
                          Center(
                            child: TextWidget(
                              text:
                                  homeController.checkoutModel['market_name'] +
                                      ' ' +
                                      'sar'.tr +
                                      ' ' +
                                      homeController.checkoutModel['amount']
                                          .toString(),
                              fontSize: size.width * 0.043,
                              fontWeight: FontWeight.w500,
                              color: lightBlueColor,
                            ),
                          ),
                          SizedBox(height: size.width * 0.018),
                          Center(
                            child: Container(
                              width: size.width * 0.355,
                              height: size.width * 0.280,
                              decoration: BoxDecoration(
                                  // color: greenColor.withOpacity(0.25),
                                  borderRadius: BorderRadius.all(
                                Radius.circular(size.width * 0.009),
                              )),
                              child: ImageWidget(
                                width: size.width * 0.355,
                                height: size.width * 0.280,
                                image: homeController.checkoutModel['image'],
                              ),
                            ),
                          ),

                          SizedBox(height: size.width * 0.2), //0.117

                          DashedContainerWidget(
                            code:
                                homeController.checkoutModel['barcode_link'].toString(),
                          ),
                          SizedBox(height: size.width * 0.08), //0.082
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.028,
                                right: size.width * 0.028),
                            child: ButtonWidget(
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text: homeController.checkoutModel['code']
                                        .toString(),
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    elevation: 0,
                                    backgroundColor: greenColor,
                                    content: SnackBarContentWidget(
                                      icon: Icons.check_circle_outlined,
                                      text: 'copied_successfully'.tr,
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                  ),
                                );
                              },
                              text: 'copy_code_button'.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.width * 0.85),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.117,
                      height: size.width * 0.117,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: backgroundColor),
                    ),
                    const SeparatorWidget(color: whiteColor),
                    Container(
                      width: size.width * 0.117,
                      height: size.width * 0.117,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: backgroundColor),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: Image.asset(
                  'assets/images/success_image.png',
                  scale: size.width * 0.009,
                ),
              ),
            ],
          ),
        ));
  }
}
