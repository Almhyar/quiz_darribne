import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:quiz/UI/views/login_view/login_view.dart';
import 'package:quiz/core/data/repositories/user_repository.dart';
import 'package:quiz/core/enums/message_type.dart';
import 'package:quiz/core/services/base_controller.dart';

class RegisterController extends BaseController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxString groupValue = "".obs;

  void register() {
    runFullLoadingFutureFunction(
        function: UserRepository()
            .register(
            username: nameController.text.toString(),
            phone: phoneController.text.toString(),
            collage_name: "Civil")
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: r.message!, messageType: MessageType.SUCCSESS);
            Get.off(LoginView());
          });
        }));
  }
}