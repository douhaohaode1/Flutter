import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';

class HomePage1 extends StatelessWidget {

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
            title: Text("主页2"),
            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(left: 10, right: 10),
              indicatorColor : Colors.black,
              labelColor : Colors.black,
              unselectedLabelColor : Colors.black38,
              unselectedLabelStyle: TextStyle(fontSize: 16), // 未选择样式
              labelStyle: TextStyle( fontSize: 19, height: 1.5, fontWeight: FontWeight.w600,), // 选择的样式
              tabs: <Widget>[
                Tab(
                  text: "第一个",
                ),
                Tab(
                  text: "第二个",
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
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.0, //水平子Widget之间间距
                mainAxisSpacing: 10.0, //垂直子Widget之间间距
                //childAspectRatio: 2, //子元素在横轴长度和主轴长度的比例
                crossAxisCount: 2, //一行的Widget数量
              ),
              itemCount: GridData.length,
              itemBuilder: this.buildListData2,
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
    'subTitle: keyboard', 'subTitle: print',
    'subTitle: router', 'subTitle: pages',
    'subTitle: zoom_out_map', 'subTitle: zoom_out',
    'subTitle: youtube_searched_for', 'subTitle: wifi_tethering',
    'subTitle: wifi_lock', 'subTitle: widgets',
    'subTitle: weekend', 'subTitle: web',
    'subTitle: accessible', 'subTitle: ac_unit',
  ];
  //动态列表数据：
  List GridData = [
    {
      'title': '动画',
      'subjeck': '有效期限',
      'isFavorites': 0,
      'date': '2020年12月26',
      'img':
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3397537705,1180362904&fm=26&gp=0.jpg"
    },
    {
      'title': '城市',
      'subjeck': '有效期限',
      'isFavorites': 0,
      'date': '2020年12月26',
      'img':
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3397537705,1180362904&fm=26&gp=0.jpg"
    },
    {
      'title': '景点',
      'subjeck': '有效期限',
      'isFavorites': 0,
      'date': '2020年12月26',
      'img':
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3397537705,1180362904&fm=26&gp=0.jpg"
    },
    {
      'title': '美丽的',
      'subjeck': '有效期限',
      'isFavorites': 0,
      'date': '2020年12月26',
      'img':
      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3322807488,4192238469&fm=26&gp=0.jpg"
    },
    {
      'title': '侧记的',
      'subjeck': '有效期限',
      'isFavorites': 0,
      'date': '2020年12月26',
      'img':
      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3322807488,4192238469&fm=26&gp=0.jpg"
    },
    {
      'title': '侧记的',
      'subjeck': '有效期限',
      'isFavorites': 0,
      'date': '2020年12月26',
      'img':
      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3322807488,4192238469&fm=26&gp=0.jpg"
    },
    {
      'title': '景点',
      'subjeck': '有效期限',
      'isFavorites': 0,
      'date': '2020年12月26',
      'img':
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3397537705,1180362904&fm=26&gp=0.jpg"
    },{
      'title': '侧记的',
      'subjeck': '有效期限',
      'isFavorites': 0,
      'date': '2020年12月26',
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
