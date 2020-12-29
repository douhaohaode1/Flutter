import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Common/APPTheme.dart';
import 'package:flutter_demo/Page/MainTabbar.dart';
import 'main.reflectable.dart';

void main() {

  initializeReflectable();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    home: MainTabbar(),
  ));
}
