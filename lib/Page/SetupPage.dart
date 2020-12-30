import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:cached_network_image/cached_network_image.dart';


class SetupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<Widget> _list = new List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(buildListData1(context, titleItems[i], iconItems[i], subTitleItems[i]));
    }
    // 分割线
    var divideTiles = ListTile.divideTiles(context: context, tiles: _list).toList();

    return  Scaffold(
        // Tab组件必须放到Scaffold中
        appBar: AppBar(
            title: Text("设置"),
           ),

        body: ListView.separated(
                itemBuilder: (context, item) {
                  return buildListData1(context, titleItems[item], iconItems[item], subTitleItems[item]);
                },
                separatorBuilder: (BuildContext context, int index) => new Divider(),
                itemCount: iconItems.length
            ),
    );
  }


  Widget buildListData1(BuildContext context, String titleItem, Icon iconItem, String subTitleItem) {
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(
        subTitleItem,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Get.toNamed(Routes.NextScreen1);
      },

    );
  }

  // 数据源
  List<String> titleItems = <String>[
    '设置主题', '设置语言',
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard), new Icon(Icons.print),
   // new Icon(Icons.router), new Icon(Icons.pages),
  ];

  List<String> subTitleItems = <String>[
    'subTitle: 暗黑模式或高亮模式', 'subTitle: 应用内部语言设置',

   // 'subTitle: 暗黑模式或高亮模式', 'subTitle : 应用内部语言设置',
  //  'subTitle: 设置语言', 'subTitle : 应用内部语言设置',
    //'subTitle: 广告推广', 'subTitle : 查看一次广告献出您的爱心',
    //'subTitle: 用户反馈', 'subTitle : 意见反馈',
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
}

