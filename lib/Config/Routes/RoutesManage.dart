
import 'package:flutter/material.dart';
import 'package:flutter_demo/Page/SetupPage.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Page/HomePage.dart';
import 'package:flutter_demo/Page/HomePage1.dart';
import 'package:flutter_demo/Page/HomePage2.dart';
import 'package:flutter_demo/Page/NotebookPage.dart';
import 'package:flutter_demo/Modules/Translation/TranslationPage.dart';
import 'package:flutter_demo/Page/WelcomePage.dart';
import 'package:flutter_demo/Page/MinePage.dart';
import 'package:flutter_demo/Page/NotificationPage.dart';
import 'package:flutter_demo/Page/SetupPage.dart';
import 'package:flutter_demo/Animations/LoadStuff.dart';
import 'package:flutter_demo/Animations/ParticleBackGround.dart';
import 'package:flutter_demo/Animations/TypeWeiter.dart';
import 'package:flutter_demo/Animations/FancyBackground.dart';
import 'package:flutter_demo/Animations/PositionedTransition.dart';
import 'package:flutter_demo/Animations/FadeTransition.dart';
import 'package:flutter_demo/Animations/ScaleAnimation.dart';
import 'package:flutter_demo/Animations/AnimatedPhysical.dart';
import 'package:flutter_demo/Animations/AnimatedDefaultTextStyle.dart';
import 'package:flutter_demo/Animations/Moving.dart';
import 'package:flutter_demo/Animations/Transform.dart';
import 'package:flutter_demo/Animations/SlideTranstionWidget.dart';
import 'package:flutter_demo/Widget/TextspanWidget.dart';
import 'package:flutter_demo/Modules/Learn/LearnPage.dart';
import 'package:flutter_demo/Modules/History/HistoryPage.dart';
import 'package:flutter_demo/Modules/decontamination/decontamination_page.dart';
import 'package:flutter_demo/Modules/decontamination/decontamination_update_page.dart';
import 'package:flutter_demo/Modules/decontamination/qr_code_scanner_page.dart';


abstract class Routes {

  static const Initial = '/';
  static const NextScreen = '/NextScreen';
  static const NextScreen1 = '/NextScreen1';
  static const Welcome = '/Welcome';
  static const Translation = '/Translation';
  static const Notebook = '/Notebook';
  static const MinePage = '/MinePage';
  static const NotificationPage = '/NotificationPage';
  static const SetupPage = '/SetupPage';
  static const LoadStuff = '/LoadStuff';
  static const ParticleBackGround = '/ParticleBackGround';
  static const TypeWeiter = '/TypeWeiter';
  static const FancyBackground = '/FancyBackground';
  static const PositionedTran = '/PositionedTran';
  static const FadeTran = '/FadeTran';
  static const ScaleAnimationExample = '/ScaleAnimationExample';
  static const AnimatedPhysical = '/AnimatedPhysical';
  static const AnimatedDefaultTextStyle = '/AnimatedDefaultTextStyle';
  static const MoveObjectAnimation = '/MoveObjectAnimation';
  static const TransformExample = '/TransformExample';
  static const SlideTranstionWidget = '/SlideTranstionWidget';
  static const TextspanWidget = '/TextspanWidget';
  static const LearnPage = '/LearnPage';
  static const HistoryPage = '/HistoryPage';
  static const DecontaminationPage = '/DecontaminationPage';
  static const DecontaminationUpdatePage = '/DecontaminationUpdatePage';
  static const QRSeannerView = '/QRSeannerView';


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
    GetPage(
      name: Routes.MinePage,
      page: () => MinePage(),
    ),
    GetPage(
      name: Routes.NotificationPage,
      page: () => NotificationPage(),
    ),
    GetPage(
      name: Routes.SetupPage,
      page: () => SetupPage(),
    ),
    GetPage(
      name: Routes.LoadStuff,
      page: () => LoadStuff(),
    ),
    GetPage(
      name: Routes.ParticleBackGround,
      page: () => ParticleBackGround(),
    ),
    GetPage(
      name: Routes.TypeWeiter,
      page: () => TypeWeiter(),
    ),
    GetPage(
      name: Routes.FancyBackground,
      page: () => FancyBackground(),
    ),
    GetPage(
      name: Routes.PositionedTran,
      page: () => PositionedTran(),
    ),
    GetPage(
      name: Routes.FadeTran,
      page: () => FadeTran(),
    ),
    GetPage(
      name: Routes.ScaleAnimationExample,
      page: () => ScaleAnimationExample(),
    ),
    GetPage(
      name: Routes.AnimatedPhysical,
      page: () => AnimatedPhysicalModelPage(),
    ),
    GetPage(
      name: Routes.AnimatedDefaultTextStyle,
      page: () => AnimatedDefaultTextStyleExample(),
    ),
    GetPage(
      name: Routes.MoveObjectAnimation,
      page: () => MoveObjectAnimation(),
    ),
    GetPage(
      name: Routes.TransformExample,
      page: () => TransformExample(),
    ),
    GetPage(
      name: Routes.SlideTranstionWidget,
      page: () => SlideTranstionWidget(),
    ),
    GetPage(
      name: Routes.TextspanWidget,
      page: () => TextspanWidget(),
    ),
    GetPage(
      name: Routes.LearnPage,
      page: () => LearnPage(),
    ),
    GetPage(
      name: Routes.HistoryPage,
      page: () => HistoryPage(),
    ),
    GetPage(
      name: Routes.DecontaminationPage,
      page: () => DecontaminationPage(),
    ),
    GetPage(
      name: Routes.DecontaminationUpdatePage,
      page: () => DecontaminationUpdatePage(),
    ),

  ];
}


