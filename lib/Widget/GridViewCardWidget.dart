import 'package:flutter/material.dart';


enum GridViewCardType {
  non,
  heard,
  content,
  content1,
}

class GridViewCard extends StatefulWidget{

  final GridViewCardType type;
  final String heardTitle;
  final List <String> itemModels;
  final int length;

  GridViewCard({this.type,this.heardTitle,this.itemModels,this.length});
  @override
  _GridViewCardState createState() => _GridViewCardState();
}

class _GridViewCardState extends State<GridViewCard> {

  @override
  Widget build(BuildContext context) {

    switch(widget.type){
        case GridViewCardType.non:
          return buildNonCard(context);
          break;
        case GridViewCardType.heard:
          return buildHeardCard(context);
          break;
        case GridViewCardType.content:
          return buildNonCard(context);
          break;
        case GridViewCardType.content1:
          return buildNonCard(context);
          break;
        default:
          break;
      }
  }

  Widget buildNonCard(BuildContext context){
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
          buildCtn(),
        ],
      ),
    );
  }

  Widget buildHeardCard(BuildContext context){
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
          SizedBox(height : widget.type == GridViewCardType.heard ? 10 : 0),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween, //平均分配
            children: <Widget>[
              SizedBox(width: 25),
              Text(
                widget.heardTitle != null ? widget.heardTitle : "",
                style: new TextStyle(fontSize: 17.0,color: Colors.green,
                ),
              ),
              Spacer(),//自动填充
              RaisedButton(
                child: Text('不同按钮'),
                textColor: Colors.black54,
                color: Colors.white,
               // elevation: 12,
                onPressed: (){
                  print("点击了我");
                },
              ),
              SizedBox(width: 25),
            ],
          ),
          SizedBox(height : widget.type == GridViewCardType.heard ? 10 : 0),
          buildCtn(),
        ],
      ),
    );
  }





  Widget buildCtn() {
    return GridView.builder(
      padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: widget.length ,
        childAspectRatio: 1.5, //子元素在横轴长度和主轴长度的比例
      ),
      itemBuilder: (c, i) =>
          buildItem(widget.itemModels[i], i
          ),
      itemCount: widget.itemModels.length,
    );
  }

  Widget buildItem(String title, int row) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.mediation_sharp),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 13,),
          textAlign : TextAlign.center ,
        ),
      ],
    );
  }
}