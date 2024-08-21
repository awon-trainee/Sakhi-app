import 'package:get/get.dart';
import 'package:sakhi_app/core/route/app_route.dart';
import 'package:sakhi_app/feature/profile/controller/service.dart';
import 'package:sakhi_app/feature/profile/model/profile_model.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/loading_widget.dart';
import '../../home/controller/home_controller.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final AuthService service = AuthService();
  final homeController = Get.put(HomeController());
  final box = GetStorage();
  bool isLoading = false;
  bool isDone = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController monthlyIncomeController = TextEditingController();
  String name = "";
  String id = "";
  int phoneNum = 0;
  String email = "";
  String materialStatus = "";
  String monthlyIncome = "";
  String incomeSource = "";


  logOutUser() async {
    Get.dialog(const LoadingWidget());

    await service.logout(
      onDone: (value) {

        homeController.name = '';
        homeController.id = '';
        homeController.phoneNum= '';
        homeController.email= '';
        homeController.materialStatus= '';
        homeController.monthlyIncome= '';
        homeController.incomeSource= '';
        update();
        isDone = true;
      },
      onError: (value) {
        Get.snackbar('Something went wrong', value);
      },
      onFinally: () {
        if (isDone) {
          Get.close(1);
          box.write('token', null);
          Get.offNamed(UserRoutes.signInView);
          isDone = false;

        } else {
          Get.close(1);
        }
      },
    );
  }
  deleteAccount() async {
    Get.dialog(const LoadingWidget());

    await service.delete(
      onDone: (value) {

        homeController.name = '';
        homeController.id = '';
        homeController.phoneNum= '';
        homeController.email= '';
        homeController.materialStatus= '';
        homeController.monthlyIncome= '';
        homeController.incomeSource= '';
        update();
        isDone = true;
      },
      onError: (value) {
        Get.snackbar('Something went wrong', value);
      },
      onFinally: () {
        if (isDone) {
          Get.close(1);
          box.write('token', null);
          Get.offNamed(UserRoutes.signInView);
          isDone = false;

        } else {
          Get.close(1);
        }
      },
    );
  }

  postUserData() async {
    Get.dialog(const LoadingWidget());
    late var user = ProfileModelData(
        idNumber: '1234123455',
        name: nameController.text,
        phone: phoneNumberController.text,
        email: emailController.text.isNotEmpty ? emailController.text : emailController.text.isEmpty ? null : homeController.email,
        materialStatus: materialStatus.isNotEmpty ? materialStatus : homeController.materialStatus ,
        monthlyIncome: monthlyIncomeController.text.isNotEmpty ? monthlyIncomeController.text:homeController.monthlyIncome,
        incomeSource: incomeSource.isNotEmpty ?incomeSource : homeController.incomeSource );
    await service.postUserData(
      user: user,
      onDone: (value) {
        homeController.name = value['name'];
        homeController.id = value['id_number'];
        homeController.phoneNum= value['phone'];
        homeController.email=  value['email'];
        homeController.materialStatus=  value['material_status'];
        homeController.monthlyIncome=  value['monthly_income'];
        homeController.incomeSource=  value['income_source'];
        update();
        isDone = true;
      },
      onError: (value) {
        Get.snackbar('Something went wrong', value);

      },
      onFinally: () {
        if (isDone) {
          Get.close(1);
          Get.offNamed(UserRoutes.homeView);
          isDone = false;

        } else {
          Get.close(1);
        }
      },
    );
  }
  void clearText() {
    phoneNumberController.clear();
    emailController.clear();
    nameController.clear();
    monthlyIncomeController.clear();
  }

  void dispose() {
    phoneNumberController.dispose();
    emailController.dispose();
    nameController.dispose();
    monthlyIncomeController.dispose();

    super.dispose();
  }
}
