// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakhi_app/common/widgets/scaffold_widget.dart';
import '../../../common/widgets/dashed_container.dart';
import '../../../common/widgets/image_widget.dart';
import '../../../common/widgets/snack_bar_content_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';
import 'package:get/get.dart';

class DetailsOrderView extends StatelessWidget {
  DetailsOrderView({Key? key}) : super(key: key);
  dynamic argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ScaffoldWidget(
        isBackButton: true,
        title: 'purchase_details_title'.tr,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Center(
                child: Container(
                  height: size.height * 1,
                  width: size.width * 0.80,
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
                      height: size.width * 0.336,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.width * 0.15),
                          Center(
                            child: TextWidget(
                              text:
                                  '${'order_number'.tr} ${argumentData[0]['id']}',
                              fontSize: size.width * 0.0514,
                              fontWeight: FontWeight.w500,
                              color: darkPurpleColor,
                            ),
                          ),
                          SizedBox(height: size.width * 0.035),
                          Center(
                            child: TextWidget(
                              text:
                                  '${argumentData[5]['marketName']}  ${argumentData[4]['amount']} ${'sar'.tr}',
                              fontSize: size.width * 0.038,
                              fontWeight: FontWeight.w400,
                              color: lightPurpleColor,
                            ),
                          ),
                          SizedBox(height: size.width * 0.012),
                          Center(
                            child: ImageWidget(
                              width: size.width * 0.355,
                              height: size.width * 0.280,
                              image: argumentData[2]['image'].toString(),
                            ),
                          ),
                          SizedBox(height: size.width * 0.082),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(text: argumentData[1]['code']),
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
                            child: DashedContainerWidget(
                              code: argumentData[1]['barcode_link'],
                            ),
                          ),
                          SizedBox(height: size.width * 0.058),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.058,
                                right: size.width * 0.058),
                            child: TextWidget(
                              text: 'purchase_details'.tr,
                              fontSize: size.width * 0.051,
                              fontWeight: FontWeight.w500,
                              color: darkPurpleColor,
                            ),
                          ),
                          SizedBox(height: size.width * 0.035),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.058,
                                right: size.width * 0.058),
                            child: Row(
                              children: [
                                TextWidget(
                                    text: '${'order_status'.tr}: ',
                                    fontSize: size.width * 0.028,
                                    fontWeight: FontWeight.w500,
                                    color: midGreyColor),
                                TextWidget(
                                  text: argumentData[3]['status'],
                                  fontSize: size.width * 0.028,
                                  fontWeight: FontWeight.w500,
                                  color: greenColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.width * 0.023),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.058,
                                right: size.width * 0.058),
                            child: Row(
                              children: [
                                TextWidget(
                                  text: '${'order_date'.tr} ',
                                  fontSize: size.width * 0.028,
                                  fontWeight: FontWeight.w500,
                                  color: midGreyColor,
                                ),
                                TextWidget(
                                  text:
                                      "${argumentData[6]['createdAt'].toString().substring(0, 10)} ${argumentData[6]['createdAt'].toString().substring(11, 16)}",
                                  fontSize: size.width * 0.028,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.70),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.width * 0.023),
                          const Divider(),
                          SizedBox(height: size.width * 0.023),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.058,
                                right: size.width * 0.058),
                            child: TextWidget(
                              text: 'inovice_details'.tr,
                              fontSize: size.width * 0.051,
                              fontWeight: FontWeight.w500,
                              color: darkPurpleColor,
                            ),
                          ),
                          SizedBox(height: size.width * 0.035),
                          Padding(
                            padding: EdgeInsets.only(
                                right: size.width * 0.058,
                                left: size.width * 0.058),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    text: argumentData[5]['marketName'],
                                    fontSize: size.width * 0.028,
                                    fontWeight: FontWeight.w500,
                                    color: midGreyColor),
                                TextWidget(
                                  text:
                                      '${argumentData[4]['amount'].toString()} ${'sar'.tr}',
                                  fontSize: size.width * 0.028,
                                  fontWeight: FontWeight.w500,
                                  color: darkPurpleColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.019),
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
