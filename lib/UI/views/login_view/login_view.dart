import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz/UI/shared/colors.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_text_field.dart';
import 'package:quiz/UI/shared/utils.dart';
import 'package:quiz/UI/views/login_view/login_controller.dart';
import 'package:quiz/UI/views/main_view/main_view.dart';
import 'package:quiz/UI/views/register_view/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(10), bottom: screenWidth(10)),
                child: Center(
                    child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: screenWidth(15)),
                )),
              ),
              Center(child: SvgPicture.asset('assets/images/login.svg')),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: screenWidth(50), bottom: screenWidth(50)),
                child: Text(
                  'اسم المستخدم',
                  style: TextStyle(color: AppColors.mainPurpleColor),
                ),
              ),
              CustomTextField(
                hintText: 'اسم المستخدم',
                controller: controller.nameController,
                circularSize: 5,
                prefixIcon: Icons.person_2_outlined,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: screenWidth(50),
                    bottom: screenWidth(50),
                    top: screenWidth(30)),
                child: Text(
                  'رمز الدخول',
                  style: TextStyle(color: AppColors.mainPurpleColor),
                ),
              ),
              CustomTextField(
                hintText: 'رمز الدخول',
                controller: controller.codeController,
                circularSize: 5,
                prefixIcon: Icons.key_rounded,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(10), bottom: screenWidth(20)),
                child: Center(
                    child: CustomButton(
                  onPressed: () {
                    controller.login();
                  },
                  text: 'تسجيل الدخول',
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ليس لديك حساب ؟ ',
                    style: TextStyle(),
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: Text('أنشأ حسابك الان',
                          style: TextStyle(color: AppColors.mainPurpleColor))),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: screenWidth(5)),
                child: Center(
                    child: Text(
                  'المتابعة كزائر',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: screenWidth(28)),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
