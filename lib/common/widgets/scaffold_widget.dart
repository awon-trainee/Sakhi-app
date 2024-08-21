import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';
import 'package:get/get.dart';
import '../../core/theme/colors.dart';

class ScaffoldWidget extends StatelessWidget {
  final String title;
  final Widget body;
  final bool isBackButton;
  const ScaffoldWidget(
      {Key? key,
      required this.title,
      required this.body,
      required this.isBackButton})
      : super(key: key);
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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        leading: isBackButton
            ? isArabic()
                ? InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: blackGreyColor,
                    ))
                : InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: blackGreyColor,
                    ))
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(size.width * 0.047, size.width * 0.047),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextWidget(
          text: title,
          color: blackGreyColor,
          fontSize: size.width * 0.038,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: body,
    );
  }
}
