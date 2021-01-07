import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class TranslationPage extends StatelessWidget {

  List _imgUrls = [
    'http://pic1.nipic.com/2008-12-05/200812584425541_2.jpg',
    'http://pic18.nipic.com/20111129/4155754_234055006000_2.jpg',
    'http://b-ssl.duitang.com/uploads/item/201412/25/20141225204152_aYEc3.jpeg'
  ];

  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    String input = '';
    final controller = TextEditingController();

    controller.addListener(() {

      input =  controller.text;

      print('input ${controller.text}');

    });

    return Scaffold(
      appBar: AppBar(
        title: Text("翻译"),
      ),
      body: GestureDetector(
       onPanDown : (DragDownDetails details) {
       focusNode.unfocus();
      },
      // onTap: () {
      //     print("2222222");
      //       focusNode.unfocus();
      //   },
        child:Container(
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
                       controller: controller,
                       focusNode: focusNode,
                       // onChanged: (text) {//内容改变的回调
                       //   print('change $text');
                       // },
                       onSubmitted: (text) {//内容提交(按回车)的回调

                        // print('submit $text');
                       },
                       enabled: true,//是否禁用
                       decoration: InputDecoration(hintText: '输入翻译内容', border: OutlineInputBorder(),
                         //  counter: Text("自定义计数 0/100"),
                         suffixIcon: IconButton(
                           icon: Icon(Icons.close),
                           onPressed: () {
                            // controller.clear();
                             controller.text = '';
                             focusNode.unfocus();
                           },
                         ),
                       ),
                     ),

                       // Expanded 或 Flexible 组件可用作长文本的自动换行。
                       //在 Flutter文档中 虽然没有明确说明，但是在主轴上如有内容超出空间， Expanded 和 Flexible 会自动换行到纵轴。
                     Expanded(child:
                           resultListWidget(context),
                       ) ,


                   ],
              ),
       ),
      ),
    );
  }

  //**
  //
  // Expanded(child: Swiper(
  //                        itemCount: _imgUrls.length,
  //                        autoplay: true,
  //                        itemBuilder: (BuildContext context,int index){
  //                          // 获取图片
  //                          return Image.network(
  //                            _imgUrls[index],
  //                            // 适配方式
  //                            fit: BoxFit.fill,
  //                          );
  //                        },
  //                        // 添加一个页码指示器
  //                        pagination: SwiperPagination(),
  //                      ),) ,
  // */




  Widget resultListWidget(BuildContext context) {

    List<String> titleItems = <String>[
      'zoom_out_map','zoom_out_map','zoom_out_map','zoom_out_map','zoom_out_map','zoom_out_map','zoom_out_map','zoom_out_map',
    ];

  return  ListView.separated(
     // controller: scrollController,//监听滑动
      //physics: ClampingScrollPhysics(),
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

        //print("333");

        //focusNode.unfocus();
        Get.toNamed(Routes.LearnPage);

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