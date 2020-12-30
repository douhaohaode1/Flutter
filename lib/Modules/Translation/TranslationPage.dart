import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';





class TranslationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("翻译"),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
          //height: 250,
             //padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child:Column(
               // mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     SizedBox(height: 20),
                     buildSelectWidget(context),
                     //默认文子+边框
                     //多行文本框
                     SizedBox(height: 20),
                     TextField(
                       maxLines: 8,
                       minLines: 1,
                       decoration: InputDecoration(hintText: '输入翻译内容', border: OutlineInputBorder(),
                         //  counter: Text("自定义计数 0/100"),
                         suffixIcon: IconButton(
                           icon: Icon(Icons.close),
                           onPressed: () {
                            // controller.clear();
                           },
                         ),
                       ),
                     ),
                     resultListWidget(context),

                  ],
              ),
       ),
    );
  }

  Widget resultListWidget(BuildContext context) {

    List<String> titleItems = <String>[
      'zoom_out_map', 'zoom_out',
      'youtube_searched_for',
    ];

  return  ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, item) {
          return buildListData(context, titleItems[item]);
        },
        separatorBuilder: (BuildContext context, int index) => new Divider(),
        itemCount: titleItems.length
    );

  }

  Widget buildListData(BuildContext context, String titleItem) {
    return new ListTile(
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(
        "daaf",
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Get.toNamed(Routes.NextScreen1);
      },

    );
  }


    Widget buildSelectWidget(BuildContext context){

    return  Row(
          //居中对齐
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomFlatButton(
              child: Text('中文'),
              onPressed: () {
                // Get.toNamed(Routes.Translation);
              }),
          SizedBox(
            width: 10,
          ),
          IconButton(
              icon: Image.asset(
                'images/issue.png',
                width: 35,
                height: 35,
              ),
              onPressed: () {
                // Get.toNamed(Routes.Translation);
              }),
          SizedBox(
            width: 10,
          ),
          CustomFlatButton(
              child: Text('英文'),
              onPressed: () {
                // Get.toNamed(Routes.Notebook);
              }),
        ],
      );
   }
}


class CustomFlatButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  const CustomFlatButton({
    Key key,
    @required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 46,
      child: FlatButton(
        disabledTextColor: Colors.white,
        //disabledColor: Get.theme.primaryColor.withAlpha(180),
        onPressed: onPressed,
        child: child,
        textColor: Colors.white,
        color: Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

}