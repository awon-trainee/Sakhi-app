import 'package:flutter/material.dart';
import 'package:sakhi_app/feature/profile/controller/FAQs_controller.dart';
import 'package:get/get.dart';
import '../../../common/widgets/text_widget.dart';

import '../../../core/theme/colors.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //screen size
    final controller = Get.put(FAQsController());

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
          text: 'faqs_title'.tr,
          color: blackGreyColor,
          fontSize: size.width * 0.038,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: size.width * 0.071),
          height: size.height,
          width: size.width,
          color: backgroundColor,
          child: ListView.builder(
            itemCount: controller.question!.length,
            itemBuilder: (_, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                ),
                elevation: 0,
                margin: EdgeInsets.only(
                    top: size.width * 0.05,
                    right: size.width * 0.06,
                    left: size.width * 0.06),
                child: ExpansionTile(
                  textColor: blackColor,
                  iconColor: blackColor,
                  collapsedIconColor: blackColor,
                  childrenPadding: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    bottom: size.width * 0.03,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  title: TextWidget(
                    text: controller.question![index].header!.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextWidget(
                      text: controller.question![index].body!.tr,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
