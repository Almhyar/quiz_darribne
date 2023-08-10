import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/enums/bottom_navigation.dart';
import 'package:quiz/core/services/base_controller.dart';

class MainController extends BaseController {
  PageController pageController = PageController(initialPage: 2);
  late Rx<BottomNavigationEnum> selected = BottomNavigationEnum.HOME.obs;

  void onClick(BottomNavigationEnum select, int pageNumber) {
    selected.value = select;
    pageController.jumpToPage(pageNumber);
  }
}
