import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/UI/shared/colors.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:quiz/UI/shared/utils.dart';
import 'package:quiz/UI/views/main_view/main_view.dart';
import 'package:quiz/UI/views/main_view/profile_view/custom_profilel_field.dart';
import 'package:quiz/UI/views/main_view/profile_view/profile_controller.dart';
import 'package:quiz/core/enums/request_status.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        'assets/images/ic_user.svg',
                        color: Colors.white,
                      ),
                      SizedBox(width: screenWidth(40)),
                      Text(
                        'الملف الشخصي',
                        style: TextStyle(
                            fontSize: screenWidth(25), color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(2.8)),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(color: AppColors.mainBlueColor , width: screenWidth(100))
                      ),
                      child: Icon(Icons.person , size: screenWidth(2.5) , color: AppColors.mainBlueColor,)
                  ),
                  SizedBox(height: screenWidth(20),),
                  Obx((){ return controller.requestStatus == RequestStatus.LOADING ? SizedBox.shrink() : Text(controller.profile.value.data?.username ?? '' , style: TextStyle(fontSize: screenWidth(25)),);}),
                ],
              ),
            ),
          ),

          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(1.5) , start: screenWidth(18) , end: screenWidth(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CustomProfilelField(
                    text: 'المعلومات الشخصية',
                    color: AppColors.mainPurpleColor,
                    svgName: 'ic_edit',
                    lineColor: AppColors.mainPurpleColor,
                    onPressed: () {  },
                  ),

                  CustomProfilelField(
                    text: 'ارسال شكاوي',
                    color: AppColors.mainBlueColor,
                    svgName: 'ic_send',
                    lineColor: AppColors.mainBlueColor ,
                    svgColor: AppColors.mainBlueColor,
                    onPressed: () {
                      Get.defaultDialog(
                        title: '',
                        radius: 8,
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/images/feed_back.svg'),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: screenWidth(30)),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'ارسل شكوى / اقتراح',
                                    fillColor: AppColors.mainGrey2Color.withOpacity(0.5),
                                    filled: true
                                  ),
                                  maxLines: 8,
                                ),
                              ),
                              CustomButton(text: 'ارسل', onPressed: (){})
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  CustomProfilelField(
                    text: 'عن التطبيق',
                    color: AppColors.mainBlackColor,
                    svgName: 'ic_warning',
                    lineColor: AppColors.mainBlackColor,
                    onPressed: () {  },
                  ),
                  
                  SizedBox(height: screenWidth(20)),
                  
                  CustomButton(text: 'تسجيل الخروج', onPressed: (){}),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
