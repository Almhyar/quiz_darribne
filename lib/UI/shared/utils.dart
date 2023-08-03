import 'package:bot_toast/bot_toast.dart';
import 'package:empty_project/UI/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

double screenWidth(double perecent) {
  return Get.size.width / perecent;
}

double screenHeight(double perecent) {
  return Get.size.height / perecent;
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return Container(
        width: screenWidth(5),
        height: screenWidth(5),
        decoration: BoxDecoration(
            color: AppColors.mainBlackColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: SpinKitCircle(color: AppColors.mainOrangeColor),
      );
    });

// double get taxAmount => 0.18;
// double get deliveryAmount => 0.1;


