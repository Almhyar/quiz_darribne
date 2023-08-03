import 'package:empty_project/UI/shared/custom_widgets/custom_toast.dart';
import 'package:empty_project/app/my_app_controller.dart';
import 'package:empty_project/core/data/repositories/shared_preference_repository.dart';
import 'package:empty_project/core/enums/connectivity_status.dart';
import 'package:empty_project/core/enums/message_type.dart';
import 'package:empty_project/core/services/connectivity_service.dart';
import 'package:empty_project/core/services/location_service.dart';
import 'package:empty_project/core/services/notification_service.dart';
import 'package:get/get.dart';

SharedPreferenceRepository get storage =>
    Get.find<SharedPreferenceRepository>();

//CartService get cartService => Get.find<CartService>();
LocationService get locationService => Get.find<LocationService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
NotificationService get notificationService => Get.find<NotificationService>();
bool get isOnline =>
    Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;

// void fadeInTransition(Widget view) {
//   Get.to(view, transition: Transition.fadeIn);
// }

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    CustomToast.showMessage(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}
