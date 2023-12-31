import 'package:bot_toast/bot_toast.dart';
import 'package:quiz/UI/shared/colors.dart';
import 'package:quiz/UI/shared/utils.dart';
import 'package:quiz/core/enums/message_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomToast {
  static showMessage({
    required String message,
    MessageType messageType = MessageType.INFO,
  }) {
    String imageName = "info";
    Color shadowColor = AppColors.mainBlueColor;

    switch (messageType) {
      case MessageType.INFO:
        imageName = 'info';
        shadowColor = AppColors.mainBlueColor;
        break;
      case MessageType.WARNING:
        imageName = 'warning';
        shadowColor = AppColors.mainOrangeColor;
        break;
      case MessageType.REJECTED:
        imageName = 'rejected';
        shadowColor = AppColors.mainRedColor;
        break;
      case MessageType.SUCCSESS:
        imageName = 'approved';
        shadowColor = AppColors.mainColorGreen;
        break;
    }
    BotToast.showCustomText(
        duration: Duration(seconds: 5),
        toastBuilder: (value) {
          return Container(
            width: screenWidth(1.5),
            height: screenWidth(3),
            decoration: BoxDecoration(
                color: AppColors.mainWhiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ]),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(
                "assets/images/$imageName.svg",
                width: screenWidth(5),
                height: screenWidth(5),
              ),
              //(screenWidth(30)).ph,
              Text(message),
            ]),
          );
        });
  }
}
