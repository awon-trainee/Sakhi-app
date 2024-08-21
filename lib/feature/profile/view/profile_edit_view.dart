import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sakhi_app/common/widgets/text_field_widget.dart';
import 'package:get/get.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';
import '../controller/profile_controller.dart';

class ProfileEditView extends StatefulWidget {
  final String name;
  final String mobileNumber;
  final String? email;
  final String status;
  final String monthlyInc;
  final String incomeSource;
  const ProfileEditView(
      {super.key,
      required this.name,
      required this.mobileNumber,
      required this.email,
      required this.status,
      required this.monthlyInc,
      required this.incomeSource});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final profileEditController = Get.put(ProfileController());
  String? maritalStatus;
  String? selctedItem;
  String? initalItem;

  bool isArabic() {
    if (Get.locale == const Locale('ar', 'SA')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    profileEditController.nameController.text = widget.name;
    profileEditController.emailController.text = widget.email == null ? "" : widget.email.toString();
    profileEditController.monthlyIncomeController.text = widget.monthlyInc;
    maritalStatus = widget.status;
    initalItem = widget.incomeSource;
  }
  final List<String> incomeSourceList = [
    'job'.tr,
    'freelancer'.tr,
    'other'.tr
  ];

  String getIncomeSource(String incomeSource) {

  incomeSourceList.forEach((element) { });
    return incomeSource;
  }

  final List<Country> country = [
    const Country(
      name: "Saudi Arabia",
      nameTranslations: {
        "sk": "Saudská Arábia",
        "se": "Saudi-Arábia",
        "pl": "Arabia Saudyjska",
        "no": "Saudi-Arabia",
        "ja": "サウジアラビア",
        "it": "Arabia Saudita",
        "zh": "沙特阿拉伯",
        "nl": "Saoedi-Arabië",
        "de": "Saudi-Arabien",
        "fr": "Arabie saoudite",
        "es": "Arabia Saudí",
        "en": "Saudi Arabia",
        "pt_BR": "Arábia Saudita",
        "sr-Cyrl": "Саудијска Арабија",
        "sr-Latn": "Saudijska Arabija",
        "zh_TW": "沙烏地阿拉",
        "tr": "Suudi Arabistan",
        "ro": "Arabia Saudită",
        "ar": "السعودية",
        "fa": "عربستان سعودی",
        "yue": "沙地阿拉伯"
      },
      flag: "🇸🇦",
      code: "SA",
      dialCode: "966",
      minLength: 9,
      maxLength: 9,
    ),
  ]; //available country in number field


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final constHeight = SizedBox(
      height: size.width * 0.05,
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
          text: 'profile_title'.tr,
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
          margin: EdgeInsets.only(top: size.width * 0.033),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: size.width * 0.101,
                  child: Image.asset(
                    'assets/icons/profile-icon.png',
                    height: size.height * 0.12,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.033,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: size.width * 0.08, right: size.width * 0.065),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          text: 'name_field'.tr, fontSize: size.width * 0.04),
                      SizedBox(
                        height: size.width * 0.01,
                      ),
                      TextFieldWidget(
                        hint: widget.name,
                        controller: profileEditController.nameController,
                        onChange: (_) {
                          if (profileEditController
                              .nameController.text.isNotEmpty) {
                            setState(() {});
                          }
                        },
                      ), //text field
                      constHeight,
                      TextWidget(
                          text: 'mobile_field'.tr, fontSize: size.width * 0.04),
                      SizedBox(
                        height: size.width * 0.033,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                          ),
                          child: // optimize Direction
                              phoneField(
                            country: country,
                            controller:
                                profileEditController.phoneNumberController,
                            hint: widget.mobileNumber,
                            size: size,
                          )),
                      constHeight,
                      Row(
                        //email text
                        children: [
                          TextWidget(
                              text: 'email_field'.tr,
                              fontSize: size.width * 0.04),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          TextWidget(
                            text: 'email_optional'.tr,
                            fontSize: 15,
                            color: Colors.red,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.033,
                      ),
                      TextFieldWidget(
                        type: TextInputType.emailAddress,
                        controller: profileEditController.emailController,
                        hint: widget.email,
                      ),
                      constHeight,
                      //email field
                      TextWidget(
                          text: 'marital_status'.tr,
                          fontSize: size.width * 0.04),
                      Row(
                        //row for Single and Widower
                        children: [
                          Radio(
                            //Single option
                            value: 'single',
                            groupValue: maritalStatus,
                            onChanged: (val) {
                              setState(() {
                                profileEditController.materialStatus = 'single';
                                maritalStatus = val;
                              });
                            },
                          ),
                          TextWidget(
                              text: 'single'.tr, fontSize: size.width * 0.04),
                          SizedBox(
                            height: size.width * 0.033,
                          ),
                          Radio(
                            //Widower option
                            value: 'widower',
                            groupValue: maritalStatus,
                            onChanged: (val) {
                              setState(
                                () {
                                  maritalStatus = val;
                                  profileEditController.materialStatus =
                                      'widower';
                                },
                              );
                            },
                          ),
                          TextWidget(
                              text: 'widower'.tr, fontSize: size.width * 0.04),
                        ],
                      ),
                      Row(
                        //row Divorced and Married
                        children: [
                          Radio(
                            //Divorced option

                            value: 'divorced',
                            groupValue: maritalStatus,

                            onChanged: (val) {
                              setState(() {
                                maritalStatus = val;
                                profileEditController.materialStatus =
                                    'divorced';
                              });
                            },
                          ),
                          TextWidget(
                              text: 'divorced'.tr, fontSize: size.width * 0.04),
                          Radio(
                            //Married option
                            value: 'married',
                            groupValue: maritalStatus,
                            onChanged: (val) {
                              setState(
                                () {
                                  profileEditController.materialStatus =
                                      'married';
                                  maritalStatus = val;
                                },
                              );
                            },
                          ),
                          TextWidget(
                              text: 'married'.tr, fontSize: size.width * 0.04),
                        ],
                      ),
                      TextWidget(
                          text: 'monthly_income'.tr,
                          fontSize: size.width * 0.04),
                      SizedBox(
                        height: size.width * 0.033,
                      ),
                      TextFieldWidget(
                        controller:
                            profileEditController.monthlyIncomeController,
                        hint: widget.monthlyInc,
                      ), //text field
                      constHeight,
                      TextWidget(
                          text: 'income_source'.tr,
                          fontSize: size.width * 0.04),
                      SizedBox(
                        height: size.width * 0.033,
                      ),
                      Center(
                        child: SizedBox(
                          width: size.width * 0.83,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(size.width * 0.03),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                              ),
                            ),
                            // value:'$initalItem'.tr,
                            value:'$initalItem'.tr,
                            items: incomeSourceList
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: TextWidget(
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff1D212D),

                                        text:item),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  selctedItem = val;
                                  profileEditController.incomeSource =
                                      selctedItem!;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      constHeight,
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            profileEditController.postUserData();
                            profileEditController.clearText();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            alignment: Alignment.center,
                            minimumSize:
                                Size(size.width * 0.86, size.width * 0.11),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.011),
                            ),
                          ),
                          child: TextWidget(
                              text: 'save_button'.tr,
                              fontSize: size.width * 0.04),
                        ),
                      ),
                      constHeight
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class phoneField extends StatelessWidget {
  const phoneField(
      {super.key,
      required this.country,
      required this.controller,
      this.hint,
      required this.size});
  final TextEditingController controller;
  final List<Country> country;
  final String? hint;
  final Size size;
  @override
  Widget build(BuildContext context) {
    bool isArabic() {
      if (Get.locale == Locale('ar', 'SA')) {
        return true;
      } else {
        return false;
      }
    }

    // for phone field
    return IntlPhoneField(
      //number field with country flag

      enabled: false,
      flagsButtonPadding: const EdgeInsets.all(8),
      initialCountryCode: 'SA',
      showDropdownIcon: false,
      controller: controller,
      textAlign: isArabic() ? TextAlign.start : TextAlign.left,
      countries: country,
      disableLengthCheck: true,
      keyboardType: TextInputType.number,

      decoration: InputDecoration(
        hintText: hint!.substring(4),
        contentPadding: EdgeInsets.all(size.width * 0.03),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
      ),
    );
  }
}
