
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Page/HomePage.dart';
import 'package:flutter_demo/Page/HomePage1.dart';
import 'package:flutter_demo/Page/HomePage2.dart';
import 'package:flutter_demo/Page/NotebookPage.dart';
import 'package:flutter_demo/Page/TranslationPage.dart';
import 'package:flutter_demo/Page/WelcomePage.dart';


abstract class Routes {

  static const Initial = '/';
  static const NextScreen = '/NextScreen';
  static const NextScreen1 = '/NextScreen1';
  static const Welcome = '/Welcome';
  static const Translation = '/Translation';
  static const Notebook = '/Notebook';
}

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.Initial,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.NextScreen,
      page: () => HomePage1(),
    ),
    GetPage(
      name: Routes.Welcome,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: Routes.Translation,
      page: () => TranslationPage(),
    ),
    GetPage(
      name: Routes.Notebook,
      page: () => NotebookPage(),
    ),
  ];

}