import 'package:get/get.dart';
import 'package:quiz/UI/views/main_view/main_controller.dart';
import 'package:quiz/UI/views/main_view/main_view_widgets/bottom_navigation_widget.dart';
import 'package:quiz/UI/views/main_view/important_questions_view/important_view.dart';
import 'package:quiz/UI/views/main_view/notifications_view/notifications_view.dart';
import 'package:quiz/UI/views/main_view/home_page_view/home_page_view.dart';
import 'package:quiz/UI/views/main_view/profile_view/profile_view.dart';
import 'package:quiz/core/enums/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController controller = MainController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Obx(() {
          return BottomNavigationWidget(
            bottomNavigation: controller.selected.value,
            onTap: (select, pageNumber) {
              controller.selected.value = select;
              controller.pageController.jumpToPage(pageNumber);
            },
          );
        }),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            ProfileView(),
            ImportantView(),
            HomePageView(),
            NotificationsView(),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 8.0;
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.9956692);
    path_0.cubicTo(
        size.width * 0.1023160,
        size.height * 0.6877908,
        size.width * 0.3315975,
        size.height * 0.7502392,
        size.width * 0.4827750,
        size.height * 0.7914154);
    path_0.lineTo(size.width * 0.4827800, size.height * 0.7914154);
    path_0.cubicTo(
        size.width * 0.4872275,
        size.height * 0.7926308,
        size.width * 0.4916075,
        size.height * 0.7938231,
        size.width * 0.4959150,
        size.height * 0.7949846);
    path_0.cubicTo(
        size.width * 0.5370950,
        size.height * 0.8061231,
        size.width * 0.5762375,
        size.height * 0.8183692,
        size.width * 0.6133025,
        size.height * 0.8299692);
    path_0.cubicTo(
        size.width * 0.7922475,
        size.height * 0.8859615,
        size.width * 0.9227175,
        size.height * 0.9267923,
        size.width,
        size.height * 0.7537508);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.9956692);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
