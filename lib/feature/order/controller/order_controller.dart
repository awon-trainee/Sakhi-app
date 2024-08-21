import 'package:get/get.dart';
import 'package:sakhi_app/feature/order/controller/service.dart';

import 'package:get_storage/get_storage.dart';

import '../../../common/widgets/loading_widget.dart';
class OrderController extends GetxController{

  final AuthService service = AuthService();

@override
  void onReady() {
  getAllOrders();
    super.onReady();
  }
  late List<dynamic> orderModel = [];
  bool isLoading = false;
  bool isDone = false;

  final box = GetStorage();


  Future<List<dynamic>> getAllOrders() async {
    Get.dialog(const LoadingWidget());

    await service.allOrders(

      onDone: (value) {

        orderModel = value;

        orderModel.sort((a, b){
          return DateTime.parse(b['created_at']).compareTo(DateTime.parse(a['created_at']));
        });

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
    return orderModel;
  }

}