
import 'package:flutter/material.dart';
import 'package:flutter_demo/Page/HomePage.dart';
import 'package:flutter_demo/Page/HomePage1.dart';

class MainTabbar extends StatefulWidget {

  MainTabbar({Key key}) : super(key: key);

  _MainTabbar createState() => _MainTabbar();
}

class _MainTabbar extends State<MainTabbar> {

  int cureentIndex = 0;

  final  List listTabs = [HomePage() , HomePage1() , HomePage1() , HomePage1() ];

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
          BottomNavigationBarItem(icon: Icon(Icons.language_sharp),label :'第一页', ),
          BottomNavigationBarItem(icon: Icon(Icons.note_add_outlined), label: '第二页',),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard_outlined),label: '第三页',),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:'第四页',),
        ],
      ),
    );
  }
}