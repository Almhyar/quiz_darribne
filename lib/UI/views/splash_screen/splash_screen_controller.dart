import 'package:get/get.dart';
import 'package:quiz/UI/views/main_view/main_view.dart';
import 'package:quiz/core/services/base_controller.dart';
import 'package:quiz/core/utils/general_util.dart';

import '../login_view/login_view.dart';

class SplashScreenController extends BaseController {
  @override
  void onInit() {
    if (storage.getOrderPlaced()) {
      // cartService.clearCart();
      storage.setOrderPlaced(false);
    }
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (storage.getFirstLanuch()) {
        Get.off(() => LoginView());
      } else {
        storage.getTokenInfo() != null
            ? Get.off(() => MainView())
            : Get.off(() => MainView());
      }
      storage.setFirstLanuch(false);
      // Get.back()
      //Get.to(page)
    });

    super.onInit();
  }
}
