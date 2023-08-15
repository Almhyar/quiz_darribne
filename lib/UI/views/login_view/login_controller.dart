import 'package:get/get.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:quiz/UI/views/main_view/main_view.dart';
import 'package:quiz/core/data/repositories/user_repository.dart';
import 'package:quiz/core/enums/message_type.dart';
import 'package:quiz/core/services/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:quiz/core/utils/general_util.dart';

class LoginController extends BaseController {

  TextEditingController nameController = TextEditingController(text: 'mousa');
  TextEditingController codeController = TextEditingController(text: '12');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void login() {
    // if (formKey.currentState!.validate()) {
    runFullLoadingFutureFunction(
        function: UserRepository().login(
            name: nameController.text.toString(),
            code: codeController.text.toString(),
        )
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            storage.setLogIn(true);
            storage.setTokenInfo(r);
            CustomToast.showMessage(message: 'Login Done'  , messageType: MessageType.SUCCSESS);
            Get.off(MainView(), transition: Transition.cupertino);
          });
        }));
    // }
  }
}