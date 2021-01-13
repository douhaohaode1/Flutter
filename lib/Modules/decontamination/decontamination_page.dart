import 'package:flutter/material.dart';
import 'decontamination_widget.dart';


class DecontaminationPage extends StatefulWidget{

  @override
  _DecontaminationPageState  createState() => _DecontaminationPageState();

}

class _DecontaminationPageState extends State<DecontaminationPage>{

  static const Color appThemColor = Color(0xff113a70);

  static const TextStyle appButtonThemColor = TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold);

  var constructionData = [{"title": "机器码UPN","content" :"H&491LAB100C27Z0","hintText":"扫码填入","style":DecontaminationCellStyle.record},
                  {"title": "Description","content" :"i-Lab CART System Zeron","hintText":"扫码填入","style":DecontaminationCellStyle.descrpotion},
                  {"title": "机器番号","content" :"10086","hintText":"扫码填入","style":DecontaminationCellStyle.record},];

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
                        //itemExtent: 150.0, //强制高度为100.0
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
                      onPressed: () {},
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

  Widget _getWidget(context, index) {

    return  Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all( Radius.circular(5.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://gitee.com/iotjh/Picture/raw/master/lufei.png"),
              ),
            ),
            child: Center(
              child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  title: Text(constructionData[index]["title"],style: TextStyle(color: Colors.white,fontSize: 20)),
                  onTap:() {
                    print("点击的index"+index.toString());
                  }
              ) ,
            )

        )
    );
  }
}

Widget cell =Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/service/lufei.png'),
//    image: Image.network(""),
      fit: BoxFit.cover,
    ),
  ),
  child: Column(),
);
