import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhi_app/feature/home/controller/home_controller.dart';
import 'package:sakhi_app/feature/home/view/coupn_details.dart';
import '../../../common/widgets/store_card_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
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
    return Material(
      color: backgroundColor,
        child: GetBuilder<HomeController>(builder: (_) {
      return homeController.isLoading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: size.width * 0.234),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Image.asset(
                      'assets/images/scaffold_image.png',
                      //   scale: size.width * 0.01,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07,
                          top: size.width * 0.13,
                          right: size.width * 0.07),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.035,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person),
                          ),
                          SizedBox(width: size.width * 0.02),
                          TextWidget(
                            text: homeController.name,
                            // text: homeController.homeModel[''],
                            color: Colors.white,
                            fontSize: size.width * 0.038,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment:
                      isArabic() ? Alignment.topRight : Alignment.topLeft,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.width * 0.05),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xff9AE2FF),
                                  lowLightBlueColor
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                  size.width * 0.041)),
                          width: size.width * 0.885,
                          height: size.width * 0.308,
                          child: Stack(

                            children: [
                              Align(
                                     alignment:  isArabic() ? Alignment.bottomRight: Alignment.bottomLeft,
                                     child: ClipRRect(

                                       borderRadius:isArabic() ? BorderRadius.only(
                                            bottomRight: Radius.circular(size.width * 0.041)):
                                       BorderRadius.only(
                                           bottomLeft: Radius.circular(size.width * 0.041)),
                                       child: Image.asset(
                                         isArabic() ? 'assets/images/half_circle_right.png':'assets/images/half_circle_left.png',
                                         scale: size.width * 0.009,
                                       ),
                                     )),

                              Align(
                                  alignment: isArabic() ? Alignment.topLeft: Alignment.topRight,
                                  child: ClipRRect(
                                    
                                    borderRadius: isArabic() ?  BorderRadius.only(
                                        topLeft: Radius.circular(size.width * 0.041)):
                                    BorderRadius.only(
                                        topRight: Radius.circular(size.width * 0.041)),
                                    child: Image.asset(
                                      isArabic() ? 'assets/images/double_circle_left.png':'assets/images/double_circle_right.png',
                                      scale: size.width * 0.009,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.129,
                          top: size.width * 0.105,
                          right: size.width * 0.129,),
                      child: TextWidget(
                        text: 'total_balance'.tr,
                        color: Colors.white,
                        fontSize: size.width * 0.038,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.129,
                          top:size.width *  0.164,
                          right: size.width * 0.129,),
                      child: TextWidget(
                        // text: '',
                        text: homeController.homeModel == null
                            ? ''
                            : '${homeController.homeModel['balance']} ${'sar'.tr}',
                        color: Colors.white,
                        fontSize: homeController.homeModel == null
                            ? 0
                            : homeController.homeModel['balance']
                                        .toString()
                                        .length >=
                                    11
                                ? size.width * 0.05
                                : size.width * 0.08,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.065,
                      left: size.width * 0.061,
                      right: size.width * 0.061),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text:  homeController.homeModel == null
                            ? ''
                            :homeController.homeModel['category_name'],
                        color: darkGreyColor,
                        fontSize: size.width * 0.038,
                        fontWeight: FontWeight.w600,
                      ),
                      InkWell(
                        onTap: () {

                          homeController.getAllMarketData( homeController.homeModel['category_id'].toString());
                        },
                        child: Row(
                          children: [
                            TextWidget(
                              text: 'view_all'.tr,
                              color: darkGreyColor,
                              fontSize: size.width * 0.030,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: size.width * 0.012),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: size.width * 0.035,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.width * 0.047),

                homeController.homeModel == null
                    ? Container()
                    : Expanded(
                        child: GridView.builder(
                            padding: EdgeInsets.only(
                                left: size.width * 0.061,
                                right: size.width * 0.061),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: size.width * 0.27,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.width /
                                            1.1),
                                    crossAxisSpacing: size.width * 0.030,
                                    mainAxisSpacing: size.width * 0.030),
                            itemCount:
                                homeController.homeModel['market'].length,
                            itemBuilder: (BuildContext ctx, index) {
                              //  return const StoreCardWidget();
                              return InkWell(
                                  onTap: () {
                                    String id = "";
                                    id = homeController.homeModel['market']
                                            [index]['id']
                                        .toString();
                                    // showModalBottomSheet(
                                    //     isScrollControlled: true,
                                    //     // shape: ,
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return   CouponDialogView(
                                    //         image: homeController.homeModel['market']
                                    //         [index]['image'],
                                    //         id: id,
                                    //       );
                                    //     });
                                    Get.bottomSheet(

                                        CouponDialogView(
                                      image: homeController.homeModel['market']
                                          [index]['background_image'],
                                      id: id,
                                    ));
                                    homeController.getMarketDetailsData(id);
                                  },
                                  child: StoreCardWidget(
                                    image: homeController.homeModel['market']
                                        [index]['image'],
                                  ));
                            }),
                      ),
              ],
            )
          : Container();
    }));
  }
}
