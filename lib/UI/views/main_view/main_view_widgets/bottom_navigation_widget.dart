import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz/UI/shared/colors.dart';
import 'package:quiz/UI/shared/utils.dart';
import 'package:quiz/UI/views/main_view/main_view_widgets/bottom_navigation_controller.dart';
import 'package:quiz/core/enums/bottom_navigation.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigation;
  final Function(BottomNavigationEnum, int) onTap;

  const BottomNavigationWidget(
      {super.key, required this.bottomNavigation, required this.onTap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  late BottomNavigationController controller;
  @override
  void initState() {
    controller = BottomNavigationController(widget.bottomNavigation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth(1),
        height: screenWidth(6),
        color: AppColors.mainWhiteColor,
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.PROFILE, 0);
                    controller.enumType.value = BottomNavigationEnum.PROFILE;
                  },
                  imageName: "ic_profile",
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.PROFILE),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.STAR, 1);
                    controller.enumType.value = BottomNavigationEnum.STAR;
                  },
                  imageName: "ic_star",
                  isSelected:
                      controller.enumType.value == BottomNavigationEnum.STAR),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.HOME, 2);
                    controller.enumType.value = BottomNavigationEnum.HOME;
                  },
                  imageName: "ic_home",
                  isSelected:
                      controller.enumType.value == BottomNavigationEnum.HOME),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.NOTIFICATIONS, 3);
                    controller.enumType.value =
                        BottomNavigationEnum.NOTIFICATIONS;
                  },
                  imageName: "ic_notification",
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.NOTIFICATIONS),
            ],
          );
        }));
    // Stack(

    //   children: [

    //     Container(
    //       width: screenWidth(1),
    //       height: screenWidth(6),
    //       color: AppColors.mainWhiteColor,
    //     ),
    //     PositionedDirectional(
    //       bottom: screenWidth(30),
    //       child: Row(
    //         children: [
    //           Row(
    //             children: [
    //               navItem(
    //                   onTap: (){
    //                     widget.onTap(BottomNavigationEnum.PROFILE,0);
    //                   },
    //                   size: size,
    //                   imageName: "ic_profile",
    //                   isSelected: widget.bottomNavigation == BottomNavigationEnum.PROFILE),
    //               SizedBox(
    //                 width: screenWidth(6),
    //               ),
    //               navItem(
    //                   onTap: (){
    //                     widget.onTap(BottomNavigationEnum.STAR,1);
    //                   },
    //                   size: size,
    //                   imageName: "ic_star",
    //                   isSelected: widget.bottomNavigation == BottomNavigationEnum.STAR),
    //             ],
    //           ),
    //           SizedBox( width: screenWidth(6),),
    //           Row(
    //             children: [
    //               navItem(
    //                   onTap: (){
    //                     widget.onTap(BottomNavigationEnum.HOME,2);
    //                   },
    //                   size: size,
    //                   imageName: "ic_home",
    //                   isSelected: widget.bottomNavigation == BottomNavigationEnum.HOME),
    //               SizedBox(
    //                 width: screenWidth(6),
    //               ),
    //               navItem(
    //                   onTap: (){
    //                     widget.onTap(BottomNavigationEnum.NOTIFICATIONS,3);
    //                   },
    //                   size: size,
    //                   imageName: "ic_notification",
    //                   isSelected: widget.bottomNavigation == BottomNavigationEnum.NOTIFICATIONS),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget navItem({
    required String imageName,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/images/$imageName.svg",
              width: screenWidth(18),
              color: AppColors.mainPurpleColor,
            ),
            SizedBox(
              height: screenWidth(100),
            ),
            Container(
              width: screenWidth(15),
              height: screenWidth(200),
              color:
                  isSelected ? AppColors.mainPurpleColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
