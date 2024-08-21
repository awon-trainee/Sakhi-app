import 'package:flutter/material.dart';
import '../../../common/widgets/gradient_text.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';
import 'package:get/get.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final constHeight = SizedBox(
      height: size.height * 0.015,
    );
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
          text: 'term_title'.tr,
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
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.023),
          margin: EdgeInsets.only(top: size.width * 0.023),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/saki_logo.png",
                    height: size.width * 0.35,
                    width: size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                  GradientText(
                    "تطبيق سَخي",
                    gradient: RadialGradient(
                      radius: size.width * 0.012,
                      center: Alignment.bottomLeft,
                      colors: const [
                        Color.fromRGBO(69, 148, 225, 1),
                        Color.fromRGBO(63, 195, 238, 1),
                      ],
                    ),
                    style: TextStyle(
                        fontSize: size.width * 0.042,
                        fontWeight: FontWeight.w600),
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_user_policies_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_user_policies_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight, //user policies end
                  TextWidget(
                    text: 'term_definition_of_terms_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_definition_of_terms_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight, //definition of terms end
                  TextWidget(
                    text: 'term_right_to_access_services_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_right_to_access_services_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight, //Right to Access Services end
                  TextWidget(
                    text: 'term_rights_and_obligations_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_rights_and_obligations_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight, //Rights and Obligations end
                  TextWidget(
                    text: 'term_commitments_and_warranties_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_commitments_and_warranties_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight, //Commitments and Warranties end
                  TextWidget(
                    text: 'term_scope_of_license_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_scope_of_license_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight, //Scope of License end
                  TextWidget(
                    text: 'term_misuse_of_the_platform_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_misuse_of_the_platform_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight, //Misuse of the Platform end
                  TextWidget(
                    text: 'term_payment_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_payment_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight, // Payment end
                  TextWidget(
                    text: 'term_legal_liability_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_legal_liability_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight,
                  //legal liability end
                  TextWidget(
                    text: 'term_duration_of_use_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text: 'term_duration_of_use_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight, //Duration of Use end
                  TextWidget(
                    text: 'term_applicable_law_and_dispute_resolution_title'.tr,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  constHeight,
                  TextWidget(
                    text:
                        'term_applicable_law_and_dispute_resolution_content'.tr,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  constHeight,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
