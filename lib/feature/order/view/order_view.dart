import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhi_app/common/widgets/empty_widget.dart';
import 'package:sakhi_app/common/widgets/scaffold_widget.dart';
import '../../../common/widgets/image_widget.dart';
import '../../../common/widgets/text_widget.dart';
import '../../../core/route/app_route.dart';
import '../../../core/theme/colors.dart';
import '../controller/order_controller.dart';

class OrderView extends StatelessWidget {
  OrderView({Key? key}) : super(key: key);
  final ordersController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldWidget(
        isBackButton: false,
        title: 'order'.tr,
        body: Center(
          child: Container(
            height: size.height,
            width: size.width * 0.888,
            padding: EdgeInsets.only(top: size.width * 0.1),
            color: backgroundColor,
            child: GetBuilder<OrderController>(
              builder: (_) {
                return ordersController.orderModel.isEmpty &&
                        ordersController.isLoading
                    ? EmptyWidget(
                        image: 'orders_empty.png',
                        title: 'empty_order_title'.tr,
                        subtitle: 'empty_order_subtitle'.tr)
                    : ListView.builder(
                        itemCount: ordersController.orderModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              SizedBox(height: size.width * 0.01),
                              Card(
                                elevation: 0,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.023),
                                ),
                                child: SizedBox(
                                  width: size.width,
                                  height: size.width * 0.35,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: size.width * 0.058),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: size.width * 0.01),
                                          child: ImageWidget(
                                            width: size.width * 0.21,
                                            height: size.width * 0.21,
                                            image: ordersController
                                                .orderModel[index]['image']
                                                .toString(),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,

                                          children: [
                                            TextWidget(
                                              text: ordersController
                                                      .orderModel[index]
                                                  ['market_name'],
                                              color: midGreyColor,
                                              fontSize: size.width * 0.038,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                                height: size.width * 0.012),
                                            TextWidget(
                                              text:
                                                  '${ordersController.orderModel[index]['amount']} ${'sar'.tr}',
                                              color: blackColor,
                                              fontSize: size.width * 0.038,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(
                                                height: size.width * 0.012),
                                            Row(
                                              children: [
                                                TextWidget(
                                                  text: "${'placed_on'.tr} ",
                                                  color: midGreyColor,
                                                  fontSize: size.width * 0.028,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                TextWidget(
                                                  text:
                                                      "${ordersController.orderModel[index]['created_at'].toString().substring(0, 10)} ${ordersController.orderModel[index]['created_at'].toString().substring(11, 16)}",
                                                  color: blackColor,
                                                  fontSize: size.width * 0.028,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height: size.width * 0.012),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    UserRoutes.detailsOrderView,
                                                    arguments: [
                                                      {
                                                        "id": ordersController
                                                                .orderModel[
                                                            index]['id']
                                                      },
                                                      {
                                                        "barcode_link": ordersController
                                                                .orderModel[
                                                            index]['barcode_link']
                                                      },
                                                      {
                                                        "image":
                                                            ordersController
                                                                    .orderModel[
                                                                index]['image']
                                                      },
                                                      {
                                                        "status": ordersController
                                                                            .orderModel[
                                                                        index][
                                                                    'status'] ==
                                                                'completed'
                                                            ? 'completed'.tr
                                                            : ''
                                                      },
                                                      {
                                                        "amount":
                                                            ordersController
                                                                    .orderModel[
                                                                index]['amount']
                                                      },
                                                      {
                                                        "marketName":
                                                            ordersController
                                                                        .orderModel[
                                                                    index]
                                                                ['market_name']
                                                      },
                                                      {
                                                        "createdAt":
                                                            ordersController
                                                                    .orderModel[
                                                                index]['created_at']
                                                      }
                                                    ]);
                                              },
                                              child: TextWidget(
                                                text: 'show_details'.tr,
                                                color: lightBlueColor,
                                                fontSize: size.width * 0.028,
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: size.width * 0.164,
                                          height: size.width * 0.065,
                                          decoration: BoxDecoration(
                                              color:
                                                  greenColor.withOpacity(0.25),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    size.width * 0.014),
                                              )),
                                          child: Center(
                                            child: TextWidget(
                                              text: ordersController
                                                              .orderModel[index]
                                                          ['status'] ==
                                                      'completed'
                                                  ? 'completed'.tr
                                                  : '',
                                              color: greenColor,
                                              fontSize: size.width * 0.023,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
              },

            ),
          ),
        ));
  }
}
