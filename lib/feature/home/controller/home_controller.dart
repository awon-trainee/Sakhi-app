import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhi_app/common/widgets/loading_widget.dart';
import 'package:sakhi_app/feature/home/controller/service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhi_app/feature/order/controller/order_controller.dart';
import 'package:sakhi_app/feature/wallet/controller/wallet_controller.dart';

import '../../../core/route/app_route.dart';
import '../../../core/theme/colors.dart';

class HomeController extends GetxController{
  final box = GetStorage();
  final walletController = Get.put(WalletController());
  final orderController = Get.put(OrderController());
  @override
  void onReady() {

    getHomeData();
    getUserData();
    super.onReady();
  }
  final AuthService service = AuthService();
  TextEditingController searchTextController = TextEditingController();
  bool isDone = false;
  bool isLoading = false;
  var homeModel;

  List<dynamic> allMarketModel =[];
  List<dynamic> searchList =[];

  List<dynamic> marketDetailsModel =[];
  var checkoutModel;
  String name = "";
  String id = "";
  String phoneNum = '';
  String? email = "";
  String materialStatus = "";
  String monthlyIncome = "";
  String incomeSource = "";

  getUserData() async {
    Get.dialog(const LoadingWidget());

    await service.getUserData(
      onDone: (value) {

        name = value['name'];
        id = value['id_number'];
        phoneNum= value['phone'];
        email=  value['email'];
        materialStatus=  value['material_status'];
        monthlyIncome=  value['monthly_income'];
        incomeSource=  value['income_source'];

        isDone = true;
        isLoading = true;
        update();
      },
      onError: (value) {

        Get.snackbar('Something went wrong', value);

        Get.toNamed(UserRoutes.signInView);
      },
      onFinally: () {
        if (isDone) {
          Get.close(1);

          isDone = false;


        } else {
          Get.close(1);
        }
      },
    );
  }

  getHomeData() async {
    Get.dialog(const LoadingWidget());

    await service.homeData(

      onDone: (value) {

        homeModel =value['data'];



        isDone = true;
        isLoading= true;


        update();
      },
      onError: (value) {

        Get.snackbar('',value,backgroundColor:redColor,icon: Icon(
          Icons.error_outline_rounded,
        ),);
        if(value == 'Unauthenticated.'){

          Get.toNamed(UserRoutes.signInView);
        }

      },
      onFinally: () {
        if (isDone) {
          Get.close(1);
          isDone = false;

        } else {
          Get.close(1);
        }

      },
    );
  }

  getAllMarketData(String categoryId) async {
    Get.dialog(const LoadingWidget());

    await service.allMarketData(
categoryId:categoryId ,
      onDone: (value) {
        allMarketModel=value;


        isDone = true;
        isLoading= true;
        update();

      },
      onError: (value) {


        Get.toNamed(UserRoutes.signInView);
        Get.snackbar('Something went wrong', value);
      },
      onFinally: () {
        if (isDone) {
          Get.close(1);
          Get.toNamed(UserRoutes.viewAllProductView);
          isDone = false;
        } else {
          Get.close(1);
        }

      },
    );
  }

  void addSearchToList(String searchName){
    searchName = searchName.toLowerCase();
    searchList = allMarketModel.where((search) {
      var searchTitle = search['name'].toLowerCase();
      return  searchTitle.contains(searchName);
    }).toList();

    update();
  }
  void clearSearch(){
    searchTextController.clear();
    addSearchToList("");
  }
  getMarketDetailsData(String id) async {
    Get.dialog(const LoadingWidget());

    await service.marketDetailsData(
      marketID: id,
      onDone: (value) {

        marketDetailsModel = value;
        isDone = true;
        isLoading= true;

        update();

      },
      onError: (value) {
        Get.snackbar('Something went wrong', value);
      },
      onFinally: () {
        if (isDone) {
          Get.close(1);


          isDone = false;
        } else {
          Get.close(1);
        }

      },
    );
  }

  marketPurchase(int itemID) async {
    Get.dialog(const LoadingWidget());
    await service.marketPurchase(
      itemId: itemID,
      onDone: (value) {

        checkoutModel =value['data'];

        isDone = true;

        update();

      },
      onError: (value) {
        Get.snackbar('Something went wrong', value);
      },
      onFinally: () {
        if (isDone) {
          Get.close(1);
          if(checkoutModel.isEmpty){
            Get.snackbar('Something went wrong', '');
          }
          else{
            Get.offNamed(UserRoutes.checkoutCompletedView);
            getHomeData();
            walletController.getAllWallet();
            orderController.getAllOrders();
          }

          isDone = false;
        } else {
          Get.close(1);
        }

      },
    );
  }
  @override
  void dispose() {

    searchTextController.dispose();

    super.dispose();
  }
}