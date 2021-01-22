import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/Animations/TypeWeiter.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:flutter_demo/Modules/decontamination/decontamintaion_model.dart';
import 'package:flutter_demo/Modules/decontamination/qr_code_scanner_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'decontamintaion_view_model.dart';

enum DecontaminationCellStyle {
  non,
  record,
  descrpotion,
  menu,
  comment,
}
enum DecontaminationMenuMark{
  upnRecord,
  serialRecord,
  unitTypeCodeMenu,
  statusCodeMenu,
  reasonCodeMenu,
}

class DecontaminationItems <T> extends StatefulWidget{
  DecontaminationItems({this.model,this.menuList,this.value});
  final List menuList;
  final  model;
  T  value;
  @override
  _DecontaminationItemsState createState() => _DecontaminationItemsState();
}

class _DecontaminationItemsState extends State<DecontaminationItems> {

  static const Color appThemColor = Color(0xff113a70);
  static const Color TextThemColor = Color(0xff3d3d3d);
  static const Color contentTextColor = Color(0xff004A7A);
  static const Color appThemBackgroupColor = Color(0xffE4EFF7);
  static const Color ThemhintTextColor = Color(0xff125683);
  static const Color appThemTitleTextColor = Color(0xff060606);
  static const TextStyle appTitleColorTextStyle = TextStyle(color: appThemTitleTextColor,fontSize: 17 ,);
  static const TextStyle appThemColorTextStyle = TextStyle(color: appThemColor,fontSize: 17 ,);
  static const TextStyle appContnetTextStyle = TextStyle(color: contentTextColor,fontSize: 17 ,);

  static const TextStyle appMakeColorStyle = TextStyle(color: Colors.red,fontSize: 21 ,);
  static const TextStyle appBlackColorTextStyle = TextStyle(color: Colors.black,fontSize: 17 ,);


  @override
  Widget build(BuildContext context) {
    switch(widget.model["style"]){
      case DecontaminationCellStyle.non:
        return buildNonItem(context);
        break;
      case DecontaminationCellStyle.record:
        //return buildRecordItem(context);
        return buildRecordItem1(context);
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
      padding: EdgeInsets.fromLTRB(50, 30, 50, 20),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Text(widget.model["title"],style: appThemColorTextStyle,textAlign:TextAlign.left),
              ),
              Expanded(
                  child:Text(widget.value,style: appContnetTextStyle,textAlign:TextAlign.left,maxLines: 20,),
              ),
            ],
        ),
    );
  }


  Widget buildRecordItem1(BuildContext context){

    return Container(
      padding: EdgeInsets.fromLTRB(30, widget.model['mark'] == DecontaminationMenuMark.upnRecord ? 40 : 10, 30, 20),
      child: Row(
          children: <Widget>[
                Expanded(
                  child:  TextField(
                    //controller: buildTextController(widget.model['mark'],decontamintaionVM),
                    inputFormatters: [LengthLimitingTextInputFormatter(25)],
                    decoration: InputDecoration(
                      fillColor: appThemBackgroupColor,
                      filled: true,
                      hintText:  widget.model['title'],
                      hintStyle:TextStyle(color: ThemhintTextColor,fontSize: 17 ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal:6.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide.none),
                      // enabledBorder: OutlineInputBorder(
                      //     //borderSide: BorderSide(color: appThemColor, width: 1)
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //     //borderSide: BorderSide(color: appThemColor, width: 1)
                      // ),

                    ),
                  ),
                ),

            SizedBox(width: 10),

            IconButton(
              icon:Image.asset(
                  "images/scancode.png",
                  width: 40,
                  height: 40,),
              padding: EdgeInsets.all(2),
              onPressed: () {
                //decontamintaionVM.hideboard(ctx);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => QRSeannerView(widget.model["mark"])));
              },
            ),

          ],

      ),
    );
  }


  Widget buildRecordItem(BuildContext context){
    String input = '';
    TextEditingController buildTextController(DecontaminationMenuMark mark ,DecontamintaionViewModel VM){
      final controller = TextEditingController();
      controller.addListener(() {
        input =  controller.text;
        // if(mark == DecontaminationMenuMark.upnRecord){
        //   VM.changeUpn(context, controller.text);
        // }
        // if(mark == DecontaminationMenuMark.serialRecord){
        //   VM.changeSerial(context ,controller.text);
        // }
        print('input ${controller.text}');
      });
      return controller;
    }

    return  Container(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
              Text(widget.model["title"],style: appTitleColorTextStyle,textAlign:TextAlign.left),
              SizedBox(height: 10),
                  Container(
                    height: 44,
                     child:
                     Consumer<DecontamintaionViewModel>(
                       builder: (ctx, decontamintaionVM, child) {
                         return
                           TextField(
                           controller: buildTextController(widget.model['mark'],decontamintaionVM),
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

                                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => QRSeannerView(widget.model["mark"])));
                               },
                             ),
                           ),
                         );
                       },
                     ),
                ),
              ],
            ),
      );
  }

  Widget buildDescrpotionItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.model["title"],style: appTitleColorTextStyle,textAlign:TextAlign.left),
          SizedBox(height: 10),
          Container(
            height: 130,
            alignment : Alignment.topLeft,
            //margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: appThemColor, width: 1.5)
            ),
            child: Text("   ${widget.value}",style: appTitleColorTextStyle,textAlign:TextAlign.left),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem> buildMenuItems(DecontaminationMenuMark mark ,DecontamintaionViewModel VM){
    List menu;
    if (mark ==  DecontaminationMenuMark.unitTypeCodeMenu){
      // List _unitTypeCodeEnum;
      // List _statusCodeEnum;
      // List _reasonCodeEnum;
      menu = [{"name":"1231","id":'1'},{"name":"23232","id":'2'},{"name":"44533","id":'3'}];
    }
    if (mark ==   DecontaminationMenuMark.statusCodeMenu)   {
      menu =  [{"name":"fsfsdfs","id":'4'},{"name":"adasdasdas","id":'5'},{"name":"ccasdad","id":'6'}];
    }
    if (mark ==   DecontaminationMenuMark.reasonCodeMenu)  {
      menu =  [{"name":"aaaaaa","id":'7'},{"name":"bbbbbb","id":'8'},{"name":"ccccccc","id":'9'}];
    }
    var datas =  menu.asMap().keys.map((item)=>
        DropdownMenuItem(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
            child:Text( menu[item]['name'] ,style: appContnetTextStyle),
          ),
          value: menu[item]["id"],
        ),
    ).toList();
    return  datas;
  }

  String menuSelectValue;

  Widget buildMenuItem(BuildContext context) {

    return  Container(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Text(widget.model["mark"] == DecontaminationMenuMark.reasonCodeMenu ? " " : "*",style: appMakeColorStyle,textAlign:TextAlign.left),
              SizedBox(width: 2),
              Text(widget.model["title"],style: appThemColorTextStyle,textAlign:TextAlign.left),
            ],
          ),
        SizedBox(height: 5),
        Container(
            height: 44,
            decoration: BoxDecoration(
              color: appThemBackgroupColor,
            borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(6, 6),
                  bottom: Radius.elliptical(6, 6)),
            ),
          child: Consumer<DecontamintaionViewModel>(
            builder: (ctx, decontamintaionVM, child) {
              return  DropdownButton(
                items:  buildMenuItems(widget.model['mark'],decontamintaionVM) ,
                value: menuSelectValue,
                underline: Container(height: 1),
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down_outlined,color: appThemColor,),
                iconSize: 40,
                onChanged: (value){
                  _onMenuChanged(context,value,decontamintaionVM);
                },
              );
            },
          ),
        ),
       ],
      ),
    );
  }
  _onMenuChanged(BuildContext context,String value , DecontamintaionViewModel VM) {

    if(widget.model['mark'] ==   DecontaminationMenuMark.unitTypeCodeMenu){
      VM.changeModel(context,unitTypeCode: value);
    }
    if(widget.model['mark'] ==   DecontaminationMenuMark.statusCodeMenu){
      VM.changeModel(context,statusCode: value);
    }
    if(widget.model['mark'] ==   DecontaminationMenuMark.reasonCodeMenu){
      VM.changeModel(context,reasonCode: value);
    }
    setState(() {
      menuSelectValue = value;
    });
  }

  Widget buildCommentTextFiled(BuildContext context){
    DecontamintaionModle modle = Provider.of<DecontamintaionViewModel>(context).model;
    TextEditingController controller = TextEditingController();
    controller.text =  modle.comment;
    controller.addListener(() {
       debugPrint('${controller.text}');
       context.read<DecontamintaionViewModel>().changeComment(context,controller.text);
    });
    return  Container(
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.model["title"],style: appBlackColorTextStyle,textAlign:TextAlign.left),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            child:   Consumer<DecontamintaionViewModel>(
              builder: (ctx, decontamintaionVM, child) {
                return  TextField(
                  maxLines: 6,
                  controller: controller,
                 // focusNode: decontamintaionVM.commentFocusNode,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appThemColor, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appThemColor, width: 1.5)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}