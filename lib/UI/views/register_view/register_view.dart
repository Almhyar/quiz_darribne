import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/UI/shared/colors.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_text.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_text_button.dart';
import 'package:quiz/UI/shared/custom_widgets/custom_text_field.dart';
import 'package:quiz/UI/shared/utils.dart';
import 'package:quiz/UI/views/login_view.dart/login_view.dart';
import 'package:quiz/UI/views/main_view/main_view.dart';
import 'package:quiz/UI/views/register_view/register_controller.dart';
import 'package:quiz/core/utils/general_util.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterController controller = RegisterController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(25)),
        child: ListView(
          children: [
            (screenWidth(20)).ph,
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset("assets/images/ic_back.svg")),
                (screenWidth(3.5)).pw,
                CustomText(
                  content: "إنشاء حساب",
                  fontSize: screenWidth(20),
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            (screenWidth(10)).ph,
            Center(child: SvgPicture.asset("assets/images/signup.svg")),
            (screenWidth(15)).ph,
            CustomText(
              content: "اسم المستخدم",
              fontSize: screenWidth(20),
              fontWeight: FontWeight.bold,
              colorText: AppColors.mainPurpleColor.withOpacity(0.5),
            ),
            CustomTextField(
              hintText: "اسم المستخدم",
              controller: controller.nameController,
              circularSize: 5,
              prefixIcon: Icons.person_2_outlined,
            ),
            (screenWidth(20)).ph,
            CustomText(
              content: "رقم الموبايل",
              fontSize: screenWidth(20),
              fontWeight: FontWeight.bold,
              colorText: AppColors.mainPurpleColor.withOpacity(0.5),
            ),
            CustomTextField(
              hintText: "رقم الموبايل",
              controller: controller.phoneController,
              circularSize: 5,
              prefixIcon: Icons.phone_enabled_outlined,
              typeInput: TextInputType.phone,
            ),
            (screenWidth(20)).ph,
            CustomText(
              content: "اختر الاختصاص",
              fontSize: screenWidth(20),
              fontWeight: FontWeight.bold,
              colorText: AppColors.mainPurpleColor.withOpacity(0.5),
            ),
            Obx(() {
              return Row(
                children: [
                  Radio(
                      value: "الطب البشري",
                      activeColor: AppColors.mainPurpleColor,
                      groupValue: controller.groupValue.value,
                      onChanged: (newValue) =>
                          controller.groupValue.value = newValue.toString()),
                  CustomText(content: "الطب البشري"),
                  Radio(
                      value: "طب الأسنان",
                      activeColor: AppColors.mainPurpleColor,
                      groupValue: controller.groupValue.value,
                      onChanged: (newValue) =>
                          controller.groupValue.value = newValue.toString()),
                  CustomText(content: "طب الأسنان"),
                  Radio(
                      value: "كلية الصيدلة",
                      activeColor: AppColors.mainPurpleColor,
                      groupValue: controller.groupValue.value,
                      onChanged: (newValue) =>
                          controller.groupValue.value = newValue.toString()),
                  CustomText(content: "كلية الصيدلة")
                ],
              );
            }),
            Obx(() {
              return Row(
                children: [
                  Radio(
                      value: "الهندسة المعلوماتية",
                      activeColor: AppColors.mainPurpleColor,
                      groupValue: controller.groupValue.value,
                      onChanged: (newValue) =>
                          controller.groupValue.value = newValue.toString()),
                  CustomText(
                    content: "الهندسة المعلوماتية",
                    fontSize: screenWidth(31),
                  ),
                  Radio(
                      value: "الهندسة المعمارية",
                      activeColor: AppColors.mainPurpleColor,
                      groupValue: controller.groupValue.value,
                      onChanged: (newValue) =>
                          controller.groupValue.value = newValue.toString()),
                  CustomText(
                    content: "الهندسة المعمارية",
                    fontSize: screenWidth(31),
                  ),
                  Radio(
                      value: "التمريض",
                      activeColor: AppColors.mainPurpleColor,
                      groupValue: controller.groupValue.value,
                      onChanged: (newValue) =>
                          controller.groupValue.value = newValue.toString()),
                  CustomText(
                    content: "التمريض",
                    fontSize: screenWidth(31),
                  )
                ],
              );
            }),
            (screenWidth(20)).ph,
            CustomButton(
                text: "إنشاء حساب",
                onPressed: () {
                  Get.to(MainView());
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(content: "لديك حساب؟"),
                CustomTextButton(
                  onPressed: () {
                    Get.off(LoginView());
                  },
                  text: "تسجيل الدخول",
                  colorText: AppColors.mainPurpleColor,
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
