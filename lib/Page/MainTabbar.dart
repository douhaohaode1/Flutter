
import 'package:flutter/material.dart';
import 'package:flutter_demo/Page/HomePage.dart';
import 'package:flutter_demo/Page/HomePage1.dart';
import 'package:flutter_demo/Page/MinePage.dart';
import 'package:flutter_demo/Modules/Translation/TranslationPage.dart';
import 'package:get/get.dart';



class MainTabbar extends StatefulWidget {

  MainTabbar({Key key}) : super(key: key);

  _MainTabbar createState() => _MainTabbar();
}

class _MainTabbar extends State<MainTabbar> {

  int cureentIndex = 0;

  final  List listTabs = [HomePage() , TranslationPage() , HomePage1() , MinePage() ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: this.listTabs[this.cureentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            this.cureentIndex = index;
          });
        },
        currentIndex: this.cureentIndex,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.language_sharp),label :'HomePage'.tr, ),
          BottomNavigationBarItem(icon: Icon(Icons.note_add_outlined), label: 'First'.tr,),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard_outlined),label: 'Second'.tr,),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:'Mine'.tr,),
        ],
      ),
    );
  }
}