import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/image_widget.dart';
import 'package:sakhi_app/feature/home/controller/home_controller.dart';
import 'package:get/get.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';

class CouponDialogView extends StatefulWidget {
  final String id;
  final String image;
  CouponDialogView({Key? key, required this.image, required this.id})
      : super(key: key);

  @override
  State<CouponDialogView> createState() => _CouponDialogViewState();
}

class _CouponDialogViewState extends State<CouponDialogView> {
  var valueSelect;
  int itemId = 0;
  final homeController = Get.put(HomeController());

  var priceVloue = ['10 SAR', '25 SAR', '50 SAR', '60 SAR', '100 SAR'];
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

    return Container(
      height: size.width * 1.2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size.width * 0.086),
              topRight: Radius.circular(size.width * 0.086))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(size.width * 0.086),
                      topRight: Radius.circular(size.width * 0.086)),
                  child: ImageWidget(
                    width: size.width,
                    height: size.width * 0.5,
                    image: widget.image,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: CircleAvatar(
                      backgroundColor: blackColor.withOpacity(0.2),
                      child: Icon(
                        Icons.close,
                        size: size.width * 0.081,
                        color: blackColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.width * 0.035),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.06, right: size.width * 0.1),
              child: TextWidget(
                text: 'coupon_title'.tr,
                color: blackColor,
                fontSize: size.width * 0.028,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.width * 0.05),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.08, right: size.width * 0.1),
              child: TextWidget(
                text: 'coupon_amount'.tr,
                color: blackColor,
                fontSize: size.width * 0.033,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.08, right: size.width * 0.1),
                child: GetBuilder<HomeController>(builder: (_) {
                  return DropdownButton(

                 value: valueSelect,
                    hint: TextWidget(
                      text: 'coupon_hint'.tr,
                      color: hintCouponColor,
                      fontSize: size.width * 0.038,
                      fontWeight: FontWeight.w400,
                    ),
                    isExpanded: true,

                    onChanged: (price) {

                      setState(() {
                        valueSelect = price;


                      });
                    },
                    items: homeController.marketDetailsModel.map((value1) {
                      return DropdownMenuItem(
                        onTap: () {
                          setState(() {
                            itemId = value1['item_id'];
                          });
                        },
                        value:value1['item_id'],
                        child: TextWidget(
                          fontSize: size.width * 0.033,
                           fontWeight: FontWeight.w400,
                           color: Color(0xff1D212D),

                           text:value1['price'].toString()),
                      );
                    }).toList(),
                  );
                })),
            SizedBox(height: size.width * 0.093),
            ButtonWidget(
              onPressed: () {
                if (itemId == 0) {
                  Get.snackbar(
                      'Something went wrong', 'Please select coupon amount');
                } else {
                  homeController.marketPurchase(itemId);
                }
              },
              text: 'checkout_button'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
