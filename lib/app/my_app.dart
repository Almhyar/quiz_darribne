import 'package:bot_toast/bot_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/UI/views/login_view.dart/login_view.dart';
import 'package:quiz/UI/views/register_view/register_view.dart';
import 'package:quiz/UI/views/splash_screen/splash_screen_view.dart';
import 'package:quiz/core/enums/connectivity_status.dart';
import 'package:quiz/core/translation/app_translation.dart';
import 'package:quiz/core/utils/general_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (context) =>
          connectivityService.connectivityStatusController.stream,
      initialData: ConnectivityStatus.ONLINE,
      child: GetMaterialApp(
          defaultTransition:
              GetPlatform.isAndroid ? Transition.fadeIn : Transition.cupertino,
          transitionDuration: Duration(milliseconds: 300),
          translations: AppTranlation(),
          locale: getLocal(),
          fallbackLocale: getLocal(),
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: TextTheme(bodyMedium: GoogleFonts.alexandria())),
          title: 'Flutter Demo',
          home: const LoginView()),
    );
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else {
    return Locale('en', 'US');
  }
}
