import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/Animations/TypeWeiter.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:get/get.dart';

enum DecontaminationCellStyle {
  non,
  record,
  descrpotion,
  menu,
  comment,
}
class DecontaminationItems extends StatefulWidget{

  DecontaminationItems({this.style,this.itemModels,this.model,this.length,this.menuList,});

  final DecontaminationCellStyle style;
  final List itemModels;
  final List menuList;
  final  model;
  final int length;

  @override
  _DecontaminationItemsState createState() => _DecontaminationItemsState();

}

class _DecontaminationItemsState extends State<DecontaminationItems> {

  static const Color appThemColor = Color(0xff113a70);
  static const Color TextThemColor = Color(0xff3d3d3d);
  static const TextStyle appTitleColorTextStyle = TextStyle(color: TextThemColor,fontSize: 16 ,);
  static const TextStyle appThemColorTextStyle = TextStyle(color: appThemColor,fontSize: 16 ,);

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
      case DecontaminationCellStyle.comment:
        return buildCommentTextFiled(context);
        break;
      default:
        break;
    }
  }
  Widget buildNonItem(BuildContext context){
    return Container(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Text(widget.model["title"],style: appThemColorTextStyle,textAlign:TextAlign.left),
              ),
              Expanded(
                  child:Text(widget.model["content"],style: appTitleColorTextStyle,textAlign:TextAlign.left,maxLines: 20,),
              ),
            ],
        ),
    );
  }
  Widget buildRecordItem(BuildContext context){

    final controller = TextEditingController();
    controller.text =  widget.model["content"];
    controller.addListener(() {
      print('input ${controller.text}');
    });

    return  Container(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
              Text(widget.model["title"],style: appTitleColorTextStyle,textAlign:TextAlign.left),
              SizedBox(height: 10),
                  Container(
                    height: 44,
                     child:  TextField(
                    controller: controller,
                    inputFormatters: [LengthLimitingTextInputFormatter(25)],
                    decoration: InputDecoration(
                         contentPadding: EdgeInsets.symmetric(vertical: 4.0,horizontal:8.0),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: appThemColor, width: 1)
                           ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appThemColor, width: 1)
                          ),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.camera_alt_outlined ,
                          color: appThemColor,size: 44,),
                          padding: EdgeInsets.all(2),
                          onPressed: () {
                            print("扫码");
                            Get.toNamed(Routes.QRSeannerView);
                          },
                        ),
                      ),
                    ),
                ),
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
          Text(widget.model["title"],style: appTitleColorTextStyle,textAlign:TextAlign.left),
          SizedBox(height: 10),
          Text("   ${widget.model["content"]}",style: appTitleColorTextStyle,textAlign:TextAlign.left),
        ],
      ),
    );
  }
  List<DropdownMenuItem> buildMenuItems(List list){

  }

  Widget buildMenuItem(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      //color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(widget.model["title"],style: appThemColorTextStyle,textAlign:TextAlign.left),
        SizedBox(height: 5),
        Container(
            height: 44,
            decoration: BoxDecoration(
            border: Border.all(color: appThemColor, width: 1),
            borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(4, 4),
                  bottom: Radius.elliptical(4, 4)),
            ),
          child: DropdownButton(
            underline: Container(height: 1),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down,color: appThemColor,),
            iconSize: 44,
            items: [
              DropdownMenuItem(child: Container(
                 padding: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
                  child:Text('中文',style: appTitleColorTextStyle),) ,
              ),
              DropdownMenuItem(child: Container(
                padding: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
                child:Text('中文',style: appTitleColorTextStyle),) ,
              ),
              DropdownMenuItem(child: Container(
                padding: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
                child:Text('中文',style: appTitleColorTextStyle),) ,
              ),
              DropdownMenuItem(child: Container(
                padding: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
                child:Text('中文',style: appTitleColorTextStyle),) ,
              ),
              DropdownMenuItem(child: Container(
                padding: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
                child:Text('中文',style: appTitleColorTextStyle),) ,
              ),
              DropdownMenuItem(child: Container(
                padding: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
                child:Text('中文',style: appTitleColorTextStyle),) ,
              ),],
            onChanged: (value){
              print(value);
            },
          ),
        ),
       ],
      ),
    );
  }
  Widget buildCommentTextFiled(BuildContext context){

    final controller = TextEditingController();
    //controller.text =  widget.model["content"];
    controller.addListener(() {
      print('input ${controller.text}');
    });
    return  Container(
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.model["title"],style: appThemColorTextStyle,textAlign:TextAlign.left),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            //height: 150.0,
            child:  TextField(
              maxLines: 6,
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appThemColor, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appThemColor, width: 1)),
            ),
           ),
          ),
        ],
      ),
    );
  }
}