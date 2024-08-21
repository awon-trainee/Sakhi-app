import 'package:flutter/material.dart';
import 'package:sakhi_app/feature/home/controller/home_controller.dart';
import '../../../common/widgets/scaffold_widget.dart';
import '../../../common/widgets/store_card_widget.dart';
import '../../../core/theme/colors.dart';

import 'package:get/get.dart';

import 'coupn_details.dart';

class ViewAllProductView extends StatelessWidget {
  ViewAllProductView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldWidget(
        isBackButton: true,
        title: homeController.homeModel == null
            ? ''
            :homeController.homeModel['category_name'],
        body: GetBuilder<HomeController>(builder: (_) {
          return homeController.isLoading
              ? Column(
                  children: [
                    SizedBox(height: size.width / 10),
                    Container(
                      width: size.width * 0.888,
                      height: size.width * 0.103,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size.width * 0.234),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4.0,
                            offset: Offset(0.0, 4.0),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: homeController.searchTextController,
                        onChanged: (searchName) {
                          homeController.addSearchToList(searchName);
                        },
                        cursorColor: blackGreyColor,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: size.width * 0.02),
                          hintText: 'search_hint_field'.tr,
                          hintStyle: TextStyle(
                              color: darkGreyColor, fontSize: size.width *0.04),
                          prefixIcon: InkWell(
                            onTap: () {
                              homeController.clearSearch();
                            },
                            child: Icon(
                              Icons.search,
                              color: darkGreyColor,
                              size: size.width / 18,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: size.width / 15),
                    Expanded(
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
                                      (MediaQuery.of(context).size.width / 1.1),
                                  crossAxisSpacing: size.width * 0.030,
                                  mainAxisSpacing: size.width * 0.030),
                          itemCount: homeController.searchList.isEmpty
                              ? homeController.allMarketModel.length
                              : homeController.searchList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                                onTap: () {
                                  String id = "";
                                  id = homeController.searchList.isEmpty
                                      ? homeController.allMarketModel[index]
                                              ['id']
                                          .toString()
                                      : homeController.searchList[index]['id']
                                          .toString();
                                  Get.bottomSheet(CouponDialogView(
                                    image: homeController.searchList.isEmpty
                                        ? homeController.allMarketModel[index]
                                            ['background_image']
                                        : homeController.searchList[index]
                                            ['background_image'],
                                    id: id,
                                  ));
                                  homeController.getMarketDetailsData(id);

                                },
                                child: StoreCardWidget(
                                  image: homeController.searchList.isEmpty
                                      ? homeController.allMarketModel[index]
                                          ['image']
                                      : homeController.searchList[index]
                                          ['image'],
                                ));
                          }),
                    ),
                  ],
                )
              : Container();
        }));
  }
}
