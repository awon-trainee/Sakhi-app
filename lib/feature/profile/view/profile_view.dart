import 'package:flutter/material.dart';

import 'package:sakhi_app/feature/profile/view/profile_edit_view.dart';
import '../../../core/theme/colors.dart';
import '../../../common/widgets/card_profile_widget.dart';
import '../../../common/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/route/app_route.dart';
import '../../home/controller/home_controller.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final profileController = Get.put(HomeController());
  final logOutController = Get.put(ProfileController());

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    SizedBox(
      height: size.width * 0.047,
    ); //constant height
    bool isArabic() {
      if (Get.locale == Locale('ar', 'SA')) {
        return true;
      } else {
        return false;
      }
    }

    return Material(
      color: backgroundColor,
      child: Center(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/scaffold_image.png',
                      //   scale: size.width * 0.01,
                      fit: BoxFit.cover,
                    ),
                    TextWidget(
                      text: 'profile_title'.tr,
                      color: whiteColor,
                      fontSize: size.width * 0.054,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: size.width * 0.02),
                  height: size.width * 0.26,
                  width: size.width * 0.82,
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    margin: EdgeInsets.symmetric(vertical: size.width * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                    ),
                    child: GetBuilder<ProfileController>(
                      builder: (_) {
                        return ListTile(
                          isThreeLine: true,
                          leading: Padding(
                            padding: isArabic()
                                ? EdgeInsets.only(right: size.width * 0.028)
                                : EdgeInsets.only(left: size.width * 0.028),
                            child: Image.asset(
                              'assets/icons/profile-icon.png',
                              height: size.height * 0.12,
                              fit: BoxFit.cover,
                            ),
                          ),

                          title: Padding(
                            padding: EdgeInsets.only(
                              top: size.width * 0.07,
                            ),
                            child: TextWidget(
                              //name title
                              text: profileController.name,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: semiBlueColor,
                            ),
                          ),
                          // titleAlignment: ListTileTitleAlignment.top,
                          subtitle: Column(
                            //Id number
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // TextWidget(
                              //   text: 'id'.tr,
                              //   fontWeight: FontWeight.w400,
                              //   fontSize: size.width * 0.033,
                              // ),
                              // SizedBox(
                              //   height: size.height * 0.001,
                              // ),
                              // TextWidget(
                              //   text: profileController.id,
                              //   fontSize: size.width * 0.033,
                              //   fontWeight: FontWeight.w400,
                              //   color: blackColor,
                              // )
                            ],
                          ),
                          trailing: isArabic()
                              ? IconButton(
                                  //arrow button
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: size.width * 0.06,
                                    color: Color(0xff4F4F4F),
                                  ),

                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        //route to meal screen

                                        builder: ((context) => ProfileEditView(
                                            name: profileController.name,
                                            mobileNumber:
                                                profileController.phoneNum,
                                            email: profileController.email == ""
                                                ? null
                                                : profileController.email,
                                            status: profileController
                                                .materialStatus,
                                            monthlyInc:
                                                profileController.monthlyIncome,
                                            incomeSource: profileController
                                                .incomeSource)),
                                      ),
                                    );
                                  },
                                  splashRadius: size.width * 0.04,
                                  color: blackColor,
                                )
                              : IconButton(
                                  //arrow button
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: size.width * 0.06,
                                    color: Color(0xff4F4F4F),
                                  ),

                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        //route to meal screen
                                        builder: ((context) => ProfileEditView(
                                            name: profileController.name,
                                            mobileNumber:
                                                profileController.phoneNum,
                                            email: profileController.email,
                                            status: profileController
                                                .materialStatus,
                                            monthlyInc:
                                                profileController.monthlyIncome,
                                            incomeSource: profileController
                                                .incomeSource)),
                                      ),
                                    );
                                  },
                                  splashRadius: size.width * 0.04,
                                  color: blackColor,
                                ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.width * 0.07,
                ),
                CardProfileWidget(
                  onTap: () {
                    if (isArabic()) {
                      var local = Locale('en', 'US');
                      Get.updateLocale(local);
                      saveLanguage('en', 'US');
                    } else {
                      var local = Locale('ar', 'SA');
                      Get.updateLocale(local);
                      saveLanguage('ar', 'SA');
                    }
                  },
                  iconName: 'ArEn',
                  text: 'change_language'.tr,
                ),
                SizedBox(
                  height: size.width * 0.047,
                ),
                CardProfileWidget(
                  onTap: () {
                    Get.toNamed(UserRoutes.aboutUsView);
                  },
                  iconName: 'doc',
                  text: 'about_us'.tr,
                ),
                SizedBox(
                  height: size.width * 0.047,
                ),
                CardProfileWidget(
                  onTap: () {
                    Get.toNamed(UserRoutes.termsAndCondition);
                  },
                  iconName: 'doc',
                  text: 'terms'.tr,
                ),
                SizedBox(
                  height: size.width * 0.047,
                ),
                CardProfileWidget(
                  onTap: () {
                    Get.toNamed(UserRoutes.faqsView);
                  },
                  iconName: 'question',
                  text: 'FAQs'.tr,
                ),
                SizedBox(
                  height: size.width * 0.047,
                ),
                CardProfileWidget(
                  onTap: () {
                    Get.toNamed(UserRoutes.contactUsView);
                  },
                  iconName: 'chat',
                  text: 'contact_us'.tr,
                ),
                SizedBox(
                  height: size.width * 0.12,
                ),
                OutlinedButton(
                  onPressed: () {
                    box.write('token', null);
                    Get.offNamed(UserRoutes.signInView);
                  },
                  style: OutlinedButton.styleFrom(
                    alignment: Alignment.center,
                    minimumSize: Size(size.width * 0.86, size.width * 0.11),
                    side: const BorderSide(color: lightBlueColor, width: 1),
                    foregroundColor: lightBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.011),
                    ),
                  ),
                  child: TextWidget(
                    text: 'logout_button'.tr,
                    fontSize: size.width * 0.033,
                    color: lightBlueColor,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context_d) {
                        return AlertDialog(

                          actions: [

                            OutlinedButton(
                              onPressed: () {
Get.back();
                              },
                              style: OutlinedButton.styleFrom(


                                alignment: Alignment.center,
                                minimumSize: Size(size.width * 0.20, size.width * 0.08),
                                side: const BorderSide(color: lightBlueColor, width: 1),
                                backgroundColor: lightBlueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size.width * 0.011),
                                ),
                              ),
                              child: TextWidget(
                                text:
                                "الغاء",
                                fontSize: size.width * 0.033,
                                color: Colors.white,),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                logOutController.deleteAccount();
                              },
                              style: OutlinedButton.styleFrom(
                                alignment: Alignment.center,
                                minimumSize: Size(size.width * 0.20, size.width * 0.08),
                                side: const BorderSide(color: redColor, width: 1),
                                foregroundColor: redColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size.width * 0.011),
                                ),
                              ),
                              child: TextWidget(
                                text:
                                "حذف حسابي",
                                fontSize: size.width * 0.033,
                                color: redColor,),
                            ),

                          ],
                          title:  Center(
                            child: TextWidget(
                              fontWeight: FontWeight.w500,
                              text:
                              "هل أنت متأكد من حذف حسابك ؟",
                              fontSize: size.width * 0.04,
                              color: lightBlueColor,),
                          ),
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          scrollable: true,

                        );
                      },
                    );
                  },
                  child: TextWidget(
                    text: 'deleteAccount'.tr,
                    fontSize: size.width * 0.033,
                    color: redColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> saveLanguage(String? lang, String? code) async {
    final box = GetStorage();
    await box.write('lang', lang);
    await box.write('code', code);
    return true;
  }
}
