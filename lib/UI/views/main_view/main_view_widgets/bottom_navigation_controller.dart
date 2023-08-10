import 'package:get/get.dart';
import 'package:quiz/core/enums/bottom_navigation.dart';
import 'package:quiz/core/services/base_controller.dart';

class BottomNavigationController extends BaseController {
  BottomNavigationController(BottomNavigationEnum type) {
    enumType.value = type;
  }
  Rx<BottomNavigationEnum> enumType = BottomNavigationEnum.HOME.obs;
}
