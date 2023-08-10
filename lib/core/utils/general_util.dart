import 'package:flutter/material.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:quiz/app/my_app_controller.dart';
import 'package:quiz/core/data/repositories/shared_preference_repository.dart';
import 'package:quiz/core/enums/connectivity_status.dart';
import 'package:quiz/core/enums/message_type.dart';
import 'package:quiz/core/services/connectivity_service.dart';
import 'package:quiz/core/services/location_service.dart';
import 'package:quiz/core/services/notification_service.dart';
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

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
