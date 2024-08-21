import 'package:flutter/material.dart';

import '../../../common/widgets/empty_widget.dart';
import '../../../common/widgets/scaffold_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/theme/colors.dart';
import 'package:get/get.dart';

import '../controller/wallet_controller.dart';

class WalletView extends StatelessWidget {
  WalletView({Key? key}) : super(key: key);
  final walletController = Get.put(WalletController());
  bool isArabic() {
    if (Get.locale == Locale('ar', 'SA')) {
      return true;
    } else {
      return false;
    }
  }

  String getDay(String day) {
    day = day.tr;
    return day;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldWidget(
      isBackButton: false,
      title: 'digital_wallet'.tr,
      body: GetBuilder<WalletController>(builder: (_) {
        return walletController.isLoading == false
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.width * 0.14),
                  Center(
                    child: Container(
                      width: size.width * 0.89,
                      height: size.width * 0.22,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size.width * 0.023),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                              'assets/images/walt_image.png'), //Cir,
                          title: Padding(
                            padding:
                                EdgeInsets.only(bottom: size.width * 0.019),
                            child: TextWidget(
                              text: walletController.walletModel['category'],
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: midGreyColor,
                            ),
                          ),

                          subtitle: TextWidget(
                            text:
                                '${walletController.walletModel['balance']} ${'sar'.tr}',
                            fontSize: size.width * 0.042,
                            fontWeight: FontWeight.w600,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.08),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.11, right: size.width * 0.11),
                    child: TextWidget(
                      text: 'latest_operations'.tr,
                      fontSize: size.width * 0.033,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(height: size.width * 0.047),

                  walletController.walletDataModel.isEmpty
                      ? Container()
                      : walletController.walletDataModel[0]['today'] == true
                          ? SizedBox(height: size.width * 0.047)
                          : Container(),
                  walletController.walletDataModel.isEmpty &&
                          walletController.isLoading
                      ? Padding(
                          padding: EdgeInsets.only(top: size.width * 0.2),
                          child: EmptyWidget(
                            image: 'walt_empty.png',
                            title: 'empty_wallet_title'.tr,
                            subtitle: 'empty_wallet_subtitle'.tr,
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount:
                                  walletController.walletDataModel.length,
                              itemBuilder: (BuildContext context, int index) {



                                return walletController.walletDataModel[index]
                                            ['today'] ==
                                        true
                                    ? Column(
                                        children: [
                                          index>=1 ?  walletController.walletDataModel[
                                          index]['date'] !=
                                              walletController
                                                  .walletDataModel[
                                              index-1]['date'] ?  Padding(
                                            padding: EdgeInsets.only(
                                                left: size.width * 0.11,
                                                right: size.width * 0.11),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                TextWidget(
                                                  text: 'today'.tr,
                                                  fontSize:
                                                  size.width * 0.028,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: darkGreyColor,
                                                ),
                                                Container(
                                                  color: dividerColor,
                                                  height: 1,
                                                  width: walletController
                                                      .walletDataModel[
                                                  index]['day'] ==
                                                      'Wednesday'
                                                      ? size.width * 0.46
                                                      : size.width * 0.47,
                                                ),
                                                TextWidget(
                                                  text: walletController
                                                      .walletDataModel[
                                                  index]['date'],
                                                  fontSize:
                                                  size.width * 0.028,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: darkGreyColor,
                                                ),
                                              ],
                                            ),
                                          ):Container():Padding(
                                            padding: EdgeInsets.only(
                                                left: size.width * 0.11,
                                                right: size.width * 0.11),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                TextWidget(
                                                  text: 'today'.tr,
                                                  fontSize:
                                                  size.width * 0.028,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: darkGreyColor,
                                                ),
                                                Container(
                                                  color: dividerColor,
                                                  height: 1,
                                                  width: walletController
                                                      .walletDataModel[
                                                  index]['day'] ==
                                                      'Wednesday'
                                                      ? size.width * 0.46
                                                      : size.width * 0.47,
                                                ),
                                                TextWidget(
                                                  text: walletController
                                                      .walletDataModel[
                                                  index]['date'],
                                                  fontSize:
                                                  size.width * 0.028,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: darkGreyColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                          index>=1 ?  walletController.walletDataModel[
                                          index]['date'] !=
                                              walletController
                                                  .walletDataModel[
                                              index-1]['date']  ?SizedBox(height: size.width * 0.047):Container():   SizedBox(height: size.width * 0.047),
                                          cardWalt(
                                              isDown: walletController.walletDataModel[index]['charity'] == null
                                                  ? true
                                                  : false,
                                              text: walletController.walletDataModel[index]
                                                      ['charity'] ??
                                                  walletController.walletDataModel[index]
                                                      ['market'],
                                              time: walletController
                                                      .walletDataModel[index]
                                                  ['time'],
                                              timeAMPM: walletController
                                                          .walletDataModel[index]
                                                              ['time']
                                                          .toString()
                                                          .substring(0, 2) >=
                                                      '12'
                                                  ? 'PM'
                                                  : 'AM',
                                              price: walletController
                                                  .walletDataModel[index]['amount'],
                                              size: size),
                                          SizedBox(height: size.width * 0.047),
                                        ],
                                      )
                                    : Column(
                                        children: [

                                          index>=1 ?  (walletController.walletDataModel[
                                          index]['date'] !=
                                              walletController
                                                  .walletDataModel[
                                              index-1]['date']) ?  Padding(
                                            padding: EdgeInsets.only(
                                                left: size.width * 0.11,
                                                right: size.width * 0.11),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                TextWidget(
                                                  text: getDay(
                                                      walletController
                                                          .walletDataModel[
                                                      index]['day']),
                                                  fontSize:
                                                  size.width * 0.028,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: darkGreyColor,
                                                ),
                                                Container(
                                                  color: dividerColor,
                                                  height: 1,
                                                  width: walletController
                                                      .walletDataModel[
                                                  index]['day'] ==
                                                      'Wednesday'
                                                      ? size.width * 0.46
                                                      : size.width * 0.47,
                                                ),
                                                TextWidget(
                                                  text: walletController
                                                      .walletDataModel[
                                                  index]['date'],
                                                  fontSize:
                                                  size.width * 0.028,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: darkGreyColor,
                                                ),
                                              ],
                                            ),
                                          ):Container():Padding(
                                            padding: EdgeInsets.only(
                                                left: size.width * 0.11,
                                                right: size.width * 0.11),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                TextWidget(
                                                  text: getDay(
                                                      walletController
                                                          .walletDataModel[
                                                      index]['day']),
                                                  fontSize:
                                                  size.width * 0.028,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: darkGreyColor,
                                                ),
                                                Container(
                                                  color: dividerColor,
                                                  height: 1,
                                                  width: walletController
                                                      .walletDataModel[
                                                  index]['day'] ==
                                                      'Wednesday'
                                                      ? size.width * 0.46
                                                      : size.width * 0.47,
                                                ),
                                                TextWidget(
                                                  text: walletController
                                                      .walletDataModel[
                                                  index]['date'],
                                                  fontSize:
                                                  size.width * 0.028,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: darkGreyColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                index>=1 ?  walletController.walletDataModel[
                                index]['date'] !=
                                walletController
                                    .walletDataModel[
                                index-1]['date']
                                              ? SizedBox(
                                                  height: size.width * 0.047)
                                              : Container():SizedBox(
                                    height: size.width * 0.047),
                                          cardWalt(
                                              isDown: walletController.walletDataModel[index]['charity'] == null
                                                  ? true
                                                  : false,
                                              text: walletController.walletDataModel[index]
                                                      ['charity'] ??
                                                  walletController.walletDataModel[index]
                                                      ['market'],
                                              time: walletController
                                                      .walletDataModel[index]
                                                  ['time'],
                                              timeAMPM: walletController
                                                          .walletDataModel[index]
                                                              ['time']
                                                          .toString()
                                                          .substring(0, 2) >=
                                                      '12'
                                                  ? 'PM'
                                                  : 'AM',
                                              price: walletController
                                                  .walletDataModel[index]['amount'],
                                              size: size),
                                          SizedBox(height: size.width * 0.047),
                                        ],
                                      );
                              }),
                        ),

                ],
              );

      }),
    );
  }
}

Widget cardWalt(
    {required bool isDown,
    required String text,
    required String time,
    required String timeAMPM,
    required dynamic price,
    required Size size}) {
  return Center(
    child: Container(
      width: size.width * 0.82,
      height: size.width * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * 0.023),
      ),
      child: Center(
        child: ListTile(
          leading: Container(
            width: size.width * 0.096,
            height: size.width * 0.096,
            decoration: BoxDecoration(
              color: isDown
                  ? redColor.withOpacity(0.25)
                  : greenColor.withOpacity(0.25),
              borderRadius: BorderRadius.circular(size.width * 0.023),
            ),
            child: isDown
                ? Image.asset(
                    'assets/icons/up_right_arrow.png',
                    color: redColor,
                    scale: size.width * 0.01,
                  )
                : Image.asset(
                    'assets/icons/down_left_arrow.png',
                    color: greenColor,
                    scale: size.width * 0.01,
                  ),
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: size.width * 0.019),
            child: TextWidget(
              text: text,
              fontSize: size.width * 0.028,
              fontWeight: FontWeight.w500,
              color: blackColor,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: size.width * 0.012),
                child: TextWidget(
                  text: '$time $timeAMPM',
                  fontSize: size.width * 0.028,
                  fontWeight: FontWeight.w400,
                  color: midGreyColor,
                ),
              ),
              TextWidget(
                text: isDown ? '-$price' : '+$price',
                fontSize: size.width * 0.033,
                fontWeight: FontWeight.w500,
                color: isDown ? redColor : greenColor,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

extension on String {
  operator >(String other) {
    return double.parse(this) > double.parse(other);
  }

  operator >=(String other) {
    return double.parse(this) >= double.parse(other);
  }

  operator <(String other) {
    return double.parse(this) < double.parse(other);
  }

  operator <=(String other) {
    return double.parse(this) <= double.parse(other);
  }
}
