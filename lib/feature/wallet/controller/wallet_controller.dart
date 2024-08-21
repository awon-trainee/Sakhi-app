

import 'package:get/get.dart';
import 'package:sakhi_app/feature/wallet/controller/service.dart';

import '../../../common/widgets/loading_widget.dart';

import '../../../core/route/app_route.dart';
import 'package:get_storage/get_storage.dart';

class WalletController extends GetxController{

  final AuthService service = AuthService();

  var walletModel ;
  late List<dynamic> walletDataModel = [];
  bool isLoading = false;
  bool isDone = false;
  final box = GetStorage();

  @override
  void onReady() {

    getAllWallet();
    super.onReady();
  }

  Future<List<dynamic>> getAllWallet() async {
    Get.dialog(const LoadingWidget());

    await service.allWallet(

      onDone: (value) {

        walletModel = value['data'];

        walletDataModel = value['data']['last_operation'];


        walletDataModel.sort((a, b){
          return DateTime.parse(b['date']+' '+b['time']).compareTo(DateTime.parse(a['date']+' '+a['time']));
        });


        isDone = true;
        isLoading = true;
  update();
      },
      onError: (value) {
        box.write('token', null);
        Get.toNamed(UserRoutes.signInView);
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
    return walletDataModel;
  }
}