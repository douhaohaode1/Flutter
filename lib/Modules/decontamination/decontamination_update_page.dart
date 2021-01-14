import 'package:flutter/material.dart';
import 'decontamination_widget.dart';

class DecontaminationUpdatePage extends StatefulWidget{
  @override
  _DecontaminationUpdatePageState  createState() => _DecontaminationUpdatePageState();
}

class _DecontaminationUpdatePageState extends State<DecontaminationUpdatePage>{

  static const Color appThemColor = Color(0xff113a70);
  static const TextStyle appButtonThemColor = TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold);
  var constructionData = [
    {"title": "UPN","content" :"H7849IAB100C27X0","style":DecontaminationCellStyle.non},
    {"title": "Description","content" :"i-Lab CART System Zerons","style":DecontaminationCellStyle.non},
    {"title": "Serial","content" :"10068","style":DecontaminationCellStyle.non},
    {"title": "* Unit Yype Code","content" :"","style":DecontaminationCellStyle.menu},
    {"title": "* StatusCode","content" :"","style":DecontaminationCellStyle.menu},
    {"title": "Reason Code","content" :"","style":DecontaminationCellStyle.menu},
    {"title": "Comment","content" :"","style":DecontaminationCellStyle.comment},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemColor,
        title: Text("Boston\nScientific",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body:  Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: constructionData.length,
                  itemBuilder: (c, i) =>
                      DecontaminationItems(
                        model: constructionData[i],
                      ),
                )
            ),
            ///下面控件位于Column布局底部
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //平均分配
                children: <Widget>[
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 30)/2, // 宽度无限，跟父控件保持一致
                    height: 44,
                    child:  RaisedButton(
                      child: Text('检测', style: appButtonThemColor),
                      color: appThemColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 30)/2,
                    height: 44,
                    child:  RaisedButton(
                      color: appThemColor,
                      child: Text('更新',style: appButtonThemColor),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {

                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      //bodyListView(context),
    );
  }
}

