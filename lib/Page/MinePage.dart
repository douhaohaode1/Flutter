import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo/Widget/HeardWidget.dart';
import 'package:flutter_demo/Widget/GridViewCardWidget.dart';


class MinePage extends StatelessWidget{

   @override
   Widget build(BuildContext context) {

     return Scaffold(

         appBar:  AppBar(
           title: Text('Mine'.tr),
           actions : <Widget> [
             IconButton(
                icon: Icon(Icons.notification_important),
                onPressed: (){
                Get.toNamed(Routes.NotificationPage);
             },
           ),
             IconButton(
               icon: Icon(Icons.settings),
               onPressed: (){
                 Get.toNamed(Routes.SetupPage);
               },
             ),
           ],
         ),
          body:  ListView(
              padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
              children: <Widget>[
                MeHeader(),
                //MeHeader(), final GridViewCardType type;
                //   final String heardTitle;
                //   final List <String> itemModels;
                //   final int length;
                GridViewCard(type: GridViewCardType.non,
                             //heardTitle:"活动",
                             itemModels: ["收藏","历史","笔记","考分","排行","测试","记录","看看"],
                             length: 4,
                            ),
                GridViewCard(type: GridViewCardType.heard,
                  heardTitle:"活动",
                  itemModels: ["收藏","历史","笔记"],
                  length: 3,
                ),
                GridViewCard(type: GridViewCardType.heard,
                  heardTitle:"活动",
                  itemModels: ["收藏","历史","笔记","考分","排行","测试"],
                  length: 3,
                ),
             ],
            ),
     );
   }
}




class MeCell extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconName;
  final String title;

  MeCell({this.title, this.iconName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Image.asset(iconName),
                  SizedBox(width: 20),
                  Text(title, style: TextStyle(fontSize: 18)),
                  Expanded(child: Container()),
                 // Image.asset('img/arrow_right.png'),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Colors.lightBlue,
              margin: EdgeInsets.only(left: 60),
            ),
          ],
        ),
      ),
    );
  }
}








/**
 * List<String> subTitleItems = <String>[
    'subTitle: 设置主题', '暗黑模式或高亮模式',
    'subTitle: 设置语言', '应用内部语言设置',
    'subTitle: 广告推广', '查看一次广告献出您的爱心',
    'subTitle: 用户反馈', '意见反馈',
    'subTitle: wifi_lock', 'subTitle: widgets',
    'subTitle: weekend', 'subTitle: web',
    'subTitle: accessible', 'subTitle: ac_unit',
    ];
    //动态列表数据：
    List GridData = [
    {
    'title': '我的翻译',
    'number': 0,
    'img':
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3397537705,1180362904&fm=26&gp=0.jpg"
    },
    {
    'title': '我的收藏',
    'number': 0,
    'img':
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3397537705,1180362904&fm=26&gp=0.jpg"
    },
    {
    'title': '我的课程',
    'number': 0,
    'img':
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3397537705,1180362904&fm=26&gp=0.jpg"
    },
    {
    'title': '我的排名',
    'number': 0,
    'img':
    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3322807488,4192238469&fm=26&gp=0.jpg"
    },
    ];
 *
 * */
