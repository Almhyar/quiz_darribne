import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_text_field.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:quiz/UI/views/main_view/main_view.dart';

import 'package:quiz/UI/shared/colors.dart';
import 'package:quiz/UI/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  TextEditingController controller = TextEditingController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                width: screenWidth(1),
                height: screenWidth(3),
                decoration: BoxDecoration(color: AppColors.mainPurpleColor),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_home.svg',
                        color: Colors.white,
                      ),
                      SizedBox(width: screenWidth(40)),
                      Text(
                        'الرئيسية',
                        style: TextStyle(
                            fontSize: screenWidth(25), color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(2.8)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
              child: CustomTextField(
                hintText: 'بحث',
                controller: controller,
                prefixIcon: Icons.search,
                suffixIcon: Icons.account_circle_outlined,
                circularSize: 6,
                fillColor: AppColors.mainGrey2Color.withOpacity(0.4),
              ),
            ),
          ),

          // Padding(
          //   padding: EdgeInsetsDirectional.only(top: screenWidth(5)),
          //   child: CarouselSlider.builder(
          //     itemCount: 3,
          //     options: CarouselOptions(
          //       reverse: false,
          //       autoPlay: true,
          //       height: screenWidth(1),
          //       enlargeCenterPage: true,
          //       viewportFraction: 0.75,
          //       enlargeStrategy: CenterPageEnlargeStrategy.scale,
          //       enlargeFactor: 0.25,
          //       onPageChanged: (index , reason) => setState(() => activeIndex = index),
          //     ),
          //     itemBuilder: (context , index , realIndex)
          //     {
          //       return Image.asset('assets/images/car.jpg');
          //     },
          //   ),
          // ),

          // InkWell(
          //   onTap: (){
          //     Get.defaultDialog(
          //       title: '',
          //       radius: 10,
          //       content: Container(
          //         child: Column(
          //           children: [
          //             SvgPicture.asset('assets/images/pop-up.svg'),
          //             Text('يرجى الاشتراك لإتمام عملية التصفح' , style: TextStyle(fontSize: screenWidth(26)),),
          //             Padding(
          //               padding: EdgeInsets.symmetric(horizontal: screenWidth(10) , vertical: screenWidth(20)),
          //               child: CustomButton(text: 'تسجيل الدخول', onPressed: (){}),
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text('ليس لديك حساب ؟ ' , style: TextStyle(),),
          //                 Text('أنشأ حسابك الان' , style: TextStyle(color: AppColors.mainPurpleColor),),
          //               ],
          //             ),
          //           ],
          //         ),
          //       )
          //     );
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 300 , right: 200),
          //     child: Container(
          //       width: 100,
          //       height: 100,
          //       decoration: BoxDecoration(
          //           color: AppColors.mainPurpleColor,
          //           borderRadius: BorderRadius.circular(5)),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
