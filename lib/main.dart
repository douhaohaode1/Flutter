import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Theme/APPTheme.dart';
import 'package:flutter_demo/Page/MainTabbar.dart';
import 'main.reflectable.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:flutter_demo/Config/Global/GlobalManange.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

void main() {

  initializeReflectable();
  Get.changeTheme(Themes.light);

  print(ui.window.locale.languageCode);
  print(ui.window.locale.countryCode);




  // // 强制竖屏
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);


  runApp(GetMaterialApp(
    translations: GlobalManange(),
    //locale: Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
    locale: ui.window.locale  , //系统语言
    fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: Themes.light,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    home: MainTabbar(),
  ));
}
