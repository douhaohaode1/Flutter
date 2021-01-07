import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';




//使用CustomScrollView + SliverToBoxAdapter + SliverList；

class LearnPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliver练习"),
      ),
      body: bodyContent(),
    );
  }
}

// ignore: camel_case_types
class bodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView_02();
  }

  List _imgUrls = [
    'http://pic1.nipic.com/2008-12-05/200812584425541_2.jpg',
    'http://pic18.nipic.com/20111129/4155754_234055006000_2.jpg',
    'http://b-ssl.duitang.com/uploads/item/201412/25/20141225204152_aYEc3.jpeg'
  ];

  // SliverAppBar + SliverGrid + SliverFixedExtentList 组合使用
  CustomScrollView CustomScrollView_02() {
    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar(
        //   leading: Icon(Icons.keyboard_backspace),
        //   //标题栏左边widget
        //   actions: <Widget>[ //标题栏右边widget
        //     Icon(Icons.share)
        //   ],
        //   pinned: true,
        //   //固定标题栏
        //   expandedHeight: 255,
        //   //显示的高度
        //   flexibleSpace: FlexibleSpaceBar( //需要显示的
        //     centerTitle: true,
        //     title: Text("这是SliverAppBar"),
        //     background: Image(
        //         image: NetworkImage(
        //             "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596081152671&di=f6c85dada29dfbfa3d1a43d319d550fd&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F04%2F13%2F24%2F05581d89f4c1850.jpg"),
        //         fit: BoxFit.cover
        //     ),
        //   ),
        // ),
        SliverPadding( //设置内边距
          padding: EdgeInsets.all(10),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.greenAccent,
                      child: Text("grid$index"),
                    );
                  },
                  childCount: 16 //数量
              ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //一个几个item?
            mainAxisSpacing: 8, //item上下间隔
            crossAxisSpacing: 8, //item左右间隔
          )),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((BuildContext context,
                int index) {
              return Container(
                color: Colors.grey,
                child: Text(
                  "List$index", style: TextStyle(color: Colors.white),),
                alignment: Alignment.center,
              );
            },
                childCount: 14
            ),
            itemExtent: 100),
        SliverToBoxAdapter(
          child: Container(
           // padding: EdgeInsets.only(left: 0, right: 0 ,top: 0,bottom: 0),
            height: 180,
            color: Colors.green,
            child: Swiper(
                //layout: SwiperLayout.TINDER, //卡片
                layout: SwiperLayout.DEFAULT,
               // layout: SwiperLayout.CUSTOM,
              // customLayoutOption: CustomLayoutOption(
              //     startIndex: 1,
              //     stateCount: 3
              // ).addRotate([
              //   -0.0/180,
              //   0.0,
              //   90.0/180
              // ]).addTranslate([
              //   Offset(-470.0, -40.0),
              //   Offset(0.0, 0.0),
              //   Offset(470.0, -40.0)
              // ]),
              //itemWidth: 300,
              //itemHeight: 200,
                 //itemHeight: 200,
                itemCount: _imgUrls.length,
                autoplay: true,
                viewportFraction: 0.8, // 视窗比例
                scale: 0.9,
                autoplayDisableOnInteraction: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(// 用Container实现图片圆角的效果
                    //padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0 , bottom: 5),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(_imgUrls[index]),
                              fit: BoxFit.cover),
                        //BoxFit.cover
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),

                  );
                },
              pagination: SwiperPagination(),
             // layout: SwiperLayout.STACK ,            // stack样式

            ),

          ),
        ),

      ],
    );
  }
}