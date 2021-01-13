import 'package:flutter/material.dart';
import 'package:flutter_demo/Animations/TypeWeiter.dart';

enum DecontaminationCellStyle {
  non,
  record,
  descrpotion,
  menu,
}

class DecontaminationItems extends StatefulWidget{

  final DecontaminationCellStyle style;
  final List itemModels;
  final  model;
  final List menuList;
  final int length;

  DecontaminationItems({this.style,this.itemModels,this.model,this.length,this.menuList});

  @override
  _DecontaminationItemsState createState() => _DecontaminationItemsState();
}

class _DecontaminationItemsState extends State<DecontaminationItems> {

  static const Color appThemColor = Color(0xff113a70);

  static const Color TextThemColor = Color(0xff3d3d3d);

  static const TextStyle appTitleTextStyle = TextStyle(color: TextThemColor,fontSize: 16 ,);


  //,fontWeight: FontWeight.bold
 // static const TextStyle appButtonThemColor = TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {

    switch(widget.model["style"]){
      case DecontaminationCellStyle.non:
        return buildNonItem(context);
        break;
      case DecontaminationCellStyle.record:
        return buildRecordItem(context);
        break;
      case DecontaminationCellStyle.descrpotion:
        return buildDescrpotionItem(context);
        break;
      case DecontaminationCellStyle.menu:
        return buildMenuItem(context);
        break;
      default:
        break;
    }
  }

  Widget buildNonItem(BuildContext context){

    return Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
    // alignment: Alignment.centerLeft,
          // child: Text(),
    );
  }

  Widget buildRecordItem(BuildContext context){

    return  Container(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
              Text(widget.model["title"],style: appTitleTextStyle,textAlign:TextAlign.left),
              SizedBox(height: 10),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 44.0,
                  decoration: BoxDecoration(
                  //color: Colors.blueGrey,
                  border:  Border.all(color: appThemColor, width: 1.0),
                  borderRadius:  BorderRadius.circular(6.0)),
                  child:  TextFormField(
                    decoration: InputDecoration.collapsed(hintText: 'hello'),
                  ),
              ),
              // TextField(
              //   //enabled: false,
              //   decoration: InputDecoration(contentPadding: EdgeInsets.all(8.0),
              //     border: Border.all(color: Colors.black54, width: 4.0),
              //     hintText: '扫码填入',
              //     labelText: widget.model["content"],
              //     labelStyle: appTitleTextStyle,
              //     suffixIcon: IconButton(
              //         icon: Icon(Icons.camera_alt_outlined),
              //       onPressed: () {
              //           print("照相");
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
    );

  }

  Widget buildDescrpotionItem(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.model["title"],style: appTitleTextStyle,textAlign:TextAlign.left),
          SizedBox(height: 10),
          Text("   ${widget.model["content"]}",style: appTitleTextStyle,textAlign:TextAlign.left),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context) {
    return  Card(
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
          SizedBox(height :15),
        ],
      ),
    );
  }
}