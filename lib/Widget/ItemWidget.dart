
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Model/ResultModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo/Widget/FavoriteWidget.dart';
import '../Model/ResultModel.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';

class ItemWidget extends StatefulWidget {

  final String title;
  final itemModelVo model;
  final int row;

  ItemWidget({this.title,this.model,this.row});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {

    final wMargin = 8.0;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return  GestureDetector(
        onTap: () {
           Get.toNamed(Routes.NextScreen);
           },
         child:  Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.white, // 背景色
              shadowColor: Colors.lightBlue, // 阴影颜色
              elevation: 5, // 阴影高度
              borderOnForeground: false, // 是否在 child 前绘制 border，默认为 true
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // 设置圆角
              side: BorderSide(                        // 边框
              color: Colors.black12,
              width: 1,
             ),
          ),
           child: Column(
              children: <Widget>[
                Stack(
            /**
             * Stack中第一个widget为底部的内容，第二个为盖在上面的widget。所以这里的圆形图片CircleAvatar是底部，
             * 第二个Container为盖在上面的文字。那么分析2这里的alignment就是调整第二个widget位置的属性。
             * Alignment将第一个widget的中心当作（0，0）坐标。所以这里的（0.0，0.9）就是如图的位置。
             * */
              alignment: const Alignment(0.0, 0.9),
                     children: <Widget>[
                           CachedNetworkImage(
                            imageUrl: widget.model.envelopePic,
                            fit: BoxFit.fill,
                           width: width,
                           height: (width / 2 - 2 * wMargin - 25),
              ),
                    Text(
                       widget.model.chapterName,
                        style: new TextStyle(
                         fontSize: 17.0,
                         color: Colors.green,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:  Text(widget.model.superChapterName,
                        style: TextStyle(fontSize: 13,
                          color: Colors.grey,
                        ),
                        textAlign : TextAlign.left,
                      ),
                    ),
                    Container(
                      //    width: 40,
                      height: 35,
                      child: FavoriteWidget(
                        isFavorite: widget.model.collect ?? false,
                        id : widget.model.id,
                        onChanged: (e){ widget.model.collect = e;},
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 10, right: 5),
              ),
              Padding(
                child: Row(
                  children: <Widget>[
                    Text(widget.model.niceDate,
                      style: TextStyle(fontSize: 13,),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 10, right: 5,bottom: 5),
              ),
            ],
          ),
          // SizedBox(height: 3),
        ],
      ),
    ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}