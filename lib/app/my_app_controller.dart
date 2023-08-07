import 'package:quiz/core/enums/connectivity_status.dart';
import 'package:quiz/core/services/base_controller.dart';
import 'package:quiz/core/utils/general_util.dart';

class MyAppController extends BaseController {
  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;

  @override
  void onInit() {
    listenToConnectionStatus();
    super.onInit();
  }

  void listenToConnectionStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      connectionStatus = event;
    });
  }
}
