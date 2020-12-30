import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:cached_network_image/cached_network_image.dart';


class NotificationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<Widget> _list = new List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(buildListData1(context, titleItems[i], iconItems[i], subTitleItems[i]));
    }
    // 分割线
    var divideTiles = ListTile.divideTiles(context: context, tiles: _list).toList();

    return DefaultTabController(
      length: 2, // tab个数
      child: Scaffold(
        // Tab组件必须放到Scaffold中
        appBar: AppBar(
            title: Text("通知"),
            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(left: 10, right: 10),
              indicatorColor : Colors.black,
              labelColor : Colors.black,
              unselectedLabelColor : Colors.black38,
              unselectedLabelStyle: TextStyle(fontSize: 16), // 未选择样式
              labelStyle: TextStyle( fontSize: 19, height: 1.5, fontWeight: FontWeight.w600,), // 选择的样式
              tabs: <Widget>[
                Tab(
                  text: "未读",
                ),
                Tab(
                  text: "已读",
                ),
              ],
            )),

        body: TabBarView(
          // 类似ViewPage
          children: <Widget>[
            ListView.separated(
                itemBuilder: (context, item) {
                  return buildListData1(context, titleItems[item], iconItems[item], subTitleItems[item]);
                },
                separatorBuilder: (BuildContext context, int index) => new Divider(),
                itemCount: iconItems.length
            ),
            ListView.separated(
                itemBuilder: (context, item) {
                  return buildListData1(context, titleItems[item], iconItems[item], subTitleItems[item]);
                },
                separatorBuilder: (BuildContext context, int index) => new Divider(),
                itemCount: iconItems.length
            ),
          ],
        ),
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
  Widget buildListData2(context, index) {
    //第二种设置数据：
    return Container(
      child: Column(
        children: <Widget>[
          Image(
            image: CachedNetworkImageProvider(GridData[index]['img']),
          ),
          //Image.network(GridData[index]['img']),
          // SizedBox(height: 10),
          Text(
            GridData[index]['title'],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            GridData[index]['date'],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
      decoration: BoxDecoration(
          border:
          Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
    );
  }

  // 数据源
  List<String> titleItems = <String>[
    'keyboard', 'print',
    'router', 'pages',
    'zoom_out_map', 'zoom_out',
    'youtube_searched_for', 'wifi_tethering',
    'wifi_lock', 'widgets',
    'weekend', 'web',
    '图accessible', 'ac_unit',
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard), new Icon(Icons.print),
    new Icon(Icons.router), new Icon(Icons.pages),
    new Icon(Icons.zoom_out_map), new Icon(Icons.zoom_out),
    new Icon(Icons.youtube_searched_for), new Icon(Icons.wifi_tethering),
    new Icon(Icons.wifi_lock), new Icon(Icons.widgets),
    new Icon(Icons.weekend), new Icon(Icons.web),
    new Icon(Icons.accessible), new Icon(Icons.ac_unit),
  ];

  List<String> subTitleItems = <String>[
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
}


// class Card extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final GestureTapCallback onTap;
//   const Card({
//     Key key,
//     @required this.title,
//     @required this.icon,
//     @required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(13),
//         ),
//         child: Column(
//           children: [
//             Spacer(),
//             Icon(
//               icon,
//               size: 80,
//               color: Colors.amber,
//             ),
//             Spacer(),
//             SizedBox(height: 20),
//             Text(title, style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 15)),
//           ],
//         ),
//       ),
//     );
//   }
// }