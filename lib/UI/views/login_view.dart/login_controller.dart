import 'package:flutter/material.dart';

import 'package:quiz/core/services/base_controller.dart';

class LoginController extends BaseController {
  TextEditingController emailController =
      TextEditingController(text: 'mousa.tma.it@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'mousa2000IT');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // void login() {
  //   // if (formKey.currentState!.validate()) {
  //   runFullLoadingFutureFunction(
  //       function: UserRepository().login(
  //           email: emailController.text,
  //           password: passwordController.text)
  //           .then((value) {
  //         value.fold((l) {
  //           CustomToast.showMessage(
  //               message: l, messageType: MessageType.REJECTED);
  //         }, (r) {
  //           storage.setLogIn(true);
  //           storage.setTokenInfo(r);
  //           Get.off(MainView(), transition: Transition.cupertino);
  //         });
  //       }));
  //   // }
  // }
}
