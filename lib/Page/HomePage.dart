import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_demo/Model/ResultModel.dart';
import 'package:flutter_demo/Http/ServiceImp.dart';
import 'package:flutter_demo/Widget/ItemWidget.dart';
import 'package:flutter_demo/Config/Theme/APPTheme.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Page/HomePage1.dart';
import 'package:flutter_demo/Tool/SqlDB/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

/// 加载状态
enum LoadMoreStatue{
  //加载中
  STATUE_LOADING,
  //加载完成
  STATUE_COMPLETE,
  //空闲中
  STATUE_IDEL
}

class HomePage extends StatelessWidget {

  static Future<Database> _database;
  @override
  Widget build(BuildContext context) {

    _database =  DatabaseHelper.instance.database;

    List <Widget> tarList = [Tab(text: 'First'.tr,),Tab(text: 'Second'.tr, ),Tab( text: 'Third'.tr,)];

    return DefaultTabController(
      length: tarList.length, // tab个数
      //length: 3, // tab个数
      child: Scaffold(
        // Tab组件必须放到Scaffold中
        appBar: AppBar(
            title: Text('HomePage'.tr),
            leading: IconButton(
              padding: EdgeInsets.only(left: 20, right: 0 ,top: 0,bottom: 0),
              iconSize: 40,
              icon: getImage('images/issue.png'),
              onPressed: (){
                //Get.to(HomePage1());
               // Get.changeTheme(Get.isDarkMode? Themes.light: Themes.dark);
                var locale = Locale('ja', 'JP');
                Get.updateLocale(locale);
               // zh_CN
              },
            ),
            actions : <Widget> [IconButton(
              padding: EdgeInsets.only(left: 0, right: 20 ,top: 0,bottom: 0),
              iconSize: 40,
              icon: getImage('images/notice.png'),
              onPressed: (){
                Get.toNamed(Routes.Welcome);
              },
            ),
            ],
            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(left: 10, right: 10),
              indicatorColor : Colors.black,
              labelColor : Colors.black,
              unselectedLabelColor : Colors.black38,
              unselectedLabelStyle: TextStyle(fontSize: 16), // 未选择样式
              labelStyle: TextStyle( fontSize: 19, height: 1.5, fontWeight: FontWeight.w600,), // 选择的样式
              tabs: tarList ,
            )),

        body: TabBarView(
          // 类似ViewPage
          children: <Widget> [
            OnlyGridView(),
            ListView(
              children: <Widget>[
                ListTile(title: Text("First".tr)),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(title: Text("Third".tr)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnlyGridView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _OnlyGridViewState();
  }
}

class _OnlyGridViewState extends State<OnlyGridView> {
  //当前页面
  int curPageNum = 0;
  // 数据集
  List<itemModelVo> contentList = <itemModelVo>[];
  // 加载状态
  LoadMoreStatue curLoadMoreStatue = LoadMoreStatue.STATUE_IDEL;
  //加载更多对应的内容
  String loadMoreMsg = "";
  //刷新控件
  RefreshController _refreshController =  RefreshController(initialRefresh: false);
  //GridView 上下左右 间距
  final double wPadding = 15;

  @override
  void initState(){
    super.initState();
    reFreshData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      child: buildCtn(),
      header: ClassicHeader(),
      footer: ClassicFooter(),
      onRefresh: reFreshData,
      onLoading: loadMoreData,
    );
  }

  Widget buildCtn() {
    return GridView.builder(
      padding: EdgeInsets.only(left: wPadding, right: wPadding, top: wPadding, bottom: wPadding),
      physics: ClampingScrollPhysics(),
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,
        crossAxisSpacing: wPadding/2, //水平子Widget之间间距
        mainAxisSpacing: wPadding/2, //垂直子Widget之间间距
        childAspectRatio: 2 / 2.6, //子元素在横轴长度和主轴长度的比例
      ),

      itemBuilder: (c, i) =>
          ItemWidget(
            model: contentList[i],row : i,
          ),
      itemCount: contentList.length,
    );
  }

  void reFreshData() async {

    //由于收藏功能只是本地处理，重新获取数据清空一下页面显示，没啥大用。
    setState(() {
      contentList.clear();
    });
    curPageNum =1 ;
    ResutlModelVo itemListByCid = await ServiceImpl.getInstance()
        .getItemListByCid(curPageNum, 0);
    if(mounted){
      setState(() {
        if (itemListByCid != null &&
            itemListByCid.data != null &&
            itemListByCid.data.datas != null) {
          contentList.clear();
          contentList.addAll(itemListByCid.data.datas);
        }
      });
    }
    _refreshController.refreshCompleted();
  }

  void loadMoreData() async{

    curPageNum ++ ;
    ResutlModelVo itemListByCid = await ServiceImpl.getInstance()
        .getItemListByCid(curPageNum, 0);
    if(mounted){
      setState(() {
        if (itemListByCid != null &&
            itemListByCid.data != null &&
            itemListByCid.data.datas != null &&
            itemListByCid.data.datas.length > 0) {
          curLoadMoreStatue = LoadMoreStatue.STATUE_IDEL;
          contentList.addAll(itemListByCid.data.datas);
        }else{
          loadMoreMsg = "已经到底了!!";
          curLoadMoreStatue = LoadMoreStatue.STATUE_COMPLETE;
        }
        _refreshController.loadComplete();
      });
    }
  }
}




