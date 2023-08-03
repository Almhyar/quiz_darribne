import 'package:bot_toast/bot_toast.dart';
import 'package:empty_project/UI/shared/utils.dart';
import 'package:empty_project/core/enums/operation_type.dart';
import 'package:empty_project/core/enums/request_status.dart';
import 'package:empty_project/core/utils/general_util.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  // FOR RAM (dependency injection)
  //UserRepository userRepository = Get.put(UserRepository());
  //
  Rx<RequestStatus> requestStatus = RequestStatus.DEFUALT.obs;
  RxList<OperationType> listType = <OperationType>[].obs;

  Future runFutureFunction({required Future function}) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    return checkConnection(() async {
      requestStatus.value = RequestStatus.LOADING;
      listType.add(type!);
      await function;
      requestStatus.value = RequestStatus.DEFUALT;
      listType.remove(type);
    });
  }

  Future runFullLoadingFutureFunction({
    required Future function,
  }) async {
    checkConnection(() async {
      customLoader();
      await function;
      BotToast.closeAllLoading();
    });
  }
}
