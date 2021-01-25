import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

 //const Color      textThemColor         = Color(0xff3d3d3d);
 const Color      hintTextColor         = Color(0xff125683);
 const Color      appThemBackgroupColor = Color(0xffE4EFF7);
 const Color      appBarThemTextColor   = Color(0xff000A46);
 const Color      appThemTitleTextColor = Color(0xff060606);



abstract class AppColors {
 static Color white = Color(0xffffffff);
 static Color black = Color(0xff000000);
 static Color black3 = Color(0xff333333);
 static Color black9 = Color(0xff999999);
 static Color grey = Color(0xffdcdcdc);
 static Color mainBackground = Color(0xfff1f7f6);
 static Color mainColor = Color(0xff003c71);
 static Color buttonColor = Color(0xff2096f3);
 static Color buttonColor2 = Color(0xff007eff);
 static Color loginButtonLeftColor = Color(0xff003c71);
 static Color loginButtonRightColor = Color(0xff5593c9);
}

abstract class AppTextStyle{
 static TextStyle appTitleColorTextStyle = TextStyle(color: appThemTitleTextColor,fontSize: 14 ,);
 static TextStyle appThemColorTextStyle  = TextStyle(color: AppColors.mainColor,fontSize: 14 ,);
 static TextStyle appBlackColorTextStyle = TextStyle(color: Colors.black,fontSize: 14 ,);
 static TextStyle appMakeColorStyle      = TextStyle(color: Colors.red,fontSize: 21 ,);
 static TextStyle appButtonThemColor     = TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);
 static TextStyle appBarThemTextStyle    = TextStyle(color: appBarThemTextColor, fontSize: 14, fontWeight: FontWeight.bold);
 static TextStyle appButtonTextColor     = TextStyle(color: AppColors.mainColor, fontSize: 14, fontWeight: FontWeight.bold);
}


// MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
// var w=mediaQuery.size.width;//屏幕宽度
// var h=mediaQuery.size.height;//屏幕高度
// var scale =mediaQuery.devicePixelRatio;//每一个逻辑像素包含多少个原始像素
// var statusBar=mediaQuery.padding.top;//状态栏高度

class Adapt {
 static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
 static double _width = mediaQuery.size.width;
 static double _height = mediaQuery.size.height;
 static double _topbarH = mediaQuery.padding.top;
 static double _botbarH = mediaQuery.padding.bottom;
 static double _pixelRatio = mediaQuery.devicePixelRatio;
 static var _ratio;

 static init(int number){
  int uiwidth = number is int ? number : 750;
  _ratio = _width / uiwidth;
 }
 static px(number){
  if(!(_ratio is double || _ratio is int)){Adapt.init(750);}
  return number * _ratio;
 }
 static onepx(){
  return 1/_pixelRatio;
 }
 static screenW(){
  return _width;
 }
 static screenH(){
  return _height;
 }
 static padTopH(){
  return _topbarH;
 }
 static padBotH(){
  return _botbarH;
 }
}



class CommonUtils {
 static Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
 }

 static double getStatusBarHeight() {
  return MediaQueryData.fromWindow(window).padding.top;
 }

 static double getTabBarHeight(BuildContext context) {
  return MediaQueryData.fromWindow(window).padding.bottom +
      (Platform.isIOS
          ? CommonUtils.getScreenSize(context).height == 812 ||
          CommonUtils.getScreenSize(context).height == 896
          ? 49
          : 56
          : 57);
 }

 static bool strIsEmpty(String str) {
  return str == null || str == "" || !str.isNotEmpty || str == "null";
 }

 //根据中文unicode范围判断u4e00 ~ u9fa5不全
 static bool _isChinese(String str) {
  String regEx1 = "[\\u4e00-\\uFA29]+";
  String regEx2 = "[\\uE7C7-\\uE7F3]+";
  String regEx3 = "[\\u2E80-\\u2EFF]+";
  String regEx4 = "[\\u3000-\\u303F]+";
  String regEx5 = "[\\u31C0-\\u31EF]+";

  return RegExp(regEx1).hasMatch(str) ||
      RegExp(regEx2).hasMatch(str) ||
      RegExp(regEx3).hasMatch(str) ||
      RegExp(regEx4).hasMatch(str) ||
      RegExp(regEx5).hasMatch(str);
 }
}