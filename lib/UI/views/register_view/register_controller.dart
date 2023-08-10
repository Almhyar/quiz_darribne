import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/services/base_controller.dart';

class RegisterController extends BaseController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxString groupValue = "".obs;
}
