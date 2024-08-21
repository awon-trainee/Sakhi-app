import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';
import 'package:sakhi_app/feature/home/view/home_view.dart';
import 'package:sakhi_app/feature/order/view/order_view.dart';
import 'package:sakhi_app/feature/profile/view/profile_view.dart';
import 'package:sakhi_app/feature/wallet/view/wallet_view.dart';

import '../../core/theme/colors.dart';
import '../../feature/home/controller/button_bar_controller.dart';

class ButtonBarView extends StatelessWidget {
  ButtonBarView({Key? key}) : super(key: key);

  final controller = Get.find<ButtonBarController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.tabController,
            children: <Widget>[
              HomeView(),
              OrderView(),
              WalletView(),
              ProfileView()
            ],
          ),
          bottomNavigationBar: Material(
            color: Colors.white,
            child: GetBuilder<ButtonBarController>(
                init: controller,
                builder: (_) {
                  return TabBar(
                      onTap: (int i) {
                        switch (i) {
                          case 0:
                            controller.handleTabSelection();
                            break;
                          case 1:
                            controller.handleTabSelection();

                            break;
                          case 2:
                            controller.handleTabSelection();

                            break;
                          case 3:
                            controller.handleTabSelection();
                            break;
                          default:
                          //  controller.handleTabSelection();
                        }
                      },
                      labelPadding: EdgeInsets.only(bottom: size.width * 0.028),
                      indicatorColor: Colors.transparent,
                      controller: controller.tabController,
                      unselectedLabelColor: darkGreyColor,
                      labelColor: lightBlueColor,
                      tabs: <Widget>[
                        Tab(
                          iconMargin:
                              EdgeInsets.only(bottom: size.width * 0.012),
                          icon: controller.initialIndex == 0
                              ? Image.asset(
                                  'assets/icons/home_active.png',
                                  scale: size.width * 0.009,
                                )
                              : Image.asset(
                                  'assets/icons/home.png',
                                  scale: size.width * 0.009,
                                ),
                          child: TextWidget(
                            text: 'home_bar'.tr,
                            fontSize: size.width * 0.023,
                          ),
                        ),
                        Tab(
                          iconMargin:
                              EdgeInsets.only(bottom: size.width * 0.012),
                          icon: controller.initialIndex == 1
                              ? Image.asset(
                                  'assets/icons/order_active.png',
                                  scale: size.width * 0.009,
                                )
                              : Image.asset(
                                  'assets/icons/order.png',
                                  scale: size.width * 0.009,
                                ),
                          child: TextWidget(
                            text: 'order_bar'.tr,
                            fontSize: size.width * 0.023,
                          ),
                        ),
                        Tab(
                          iconMargin:
                              EdgeInsets.only(bottom: size.width * 0.012),
                          icon: controller.initialIndex == 2
                              ? Image.asset(
                                  'assets/icons/wallet_active.png',
                                  scale: size.width * 0.009,
                                )
                              : Image.asset(
                                  'assets/icons/wallet.png',
                                  scale: size.width * 0.009,
                                ),
                          child: TextWidget(
                            text: 'walt_bar'.tr,
                            fontSize: size.width * 0.023,
                          ),
                        ),
                        Tab(
                          iconMargin:
                              EdgeInsets.only(bottom: size.width * 0.012),
                          icon: controller.initialIndex == 3
                              ? Image.asset(
                                  'assets/icons/user_active.png',
                                  scale: size.width * 0.009,
                                )
                              : Image.asset(
                                  'assets/icons/user.png',
                                  scale: size.width * 0.009,
                                ),
                          child: TextWidget(
                            text: 'profile_bar'.tr,
                            fontSize: size.width * 0.023,
                          ),
                        ),
                      ]);
                }),
          )),
    );
  }
}
