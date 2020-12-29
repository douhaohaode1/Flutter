import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Common/APPTheme.dart';
import 'package:flutter_demo/Page/MainTabbar.dart';
import 'main.reflectable.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';

void main() {

  initializeReflectable();
  Get.changeTheme(Themes.light);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    //initialRoute: '/',
    theme: Themes.light,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    home: MainTabbar(),
  ));
}
