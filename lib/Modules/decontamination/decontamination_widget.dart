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
  //final DecontaminationCellStyle style;
  //final List itemModels;
  final List menuList;
  final  model;
  T  value;
  //final int length;
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
                  child:Text(widget.value,style: appTitleColorTextStyle,textAlign:TextAlign.left,maxLines: 20,),
              ),
            ],
        ),
    );
  }
  Widget buildRecordItem(BuildContext context){

    final controller = TextEditingController();
    controller.text =  widget.value;
    controller.addListener(() {
      //return;
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
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => QRSeannerView(widget.model["mark"])));
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
          Text("   ${widget.value}",style: appTitleColorTextStyle,textAlign:TextAlign.left),
        ],
      ),
    );
  }


  List<DropdownMenuItem> buildMenuItems(DecontaminationMenuMark mark){
    List menu;
    if (mark ==  DecontaminationMenuMark.unitTypeCodeMenu){
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
            child:Text( menu[item]['name'] ,style: appTitleColorTextStyle),
          ),
          value: menu[item]["id"],
        ),
    ).toList();
    return  datas;
  }

  String menuSelectValue;

  Widget buildMenuItem(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
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
          child: Consumer<DecontamintaionViewModel>(
            builder: (ctx, decontamintaionVM, child) {
              return  DropdownButton(
                items:  buildMenuItems(widget.model['mark']) ,
                value: menuSelectValue,
                underline: Container(height: 1),
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down,color: appThemColor,),
                iconSize: 44,
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
          Text(widget.model["title"],style: appThemColorTextStyle,textAlign:TextAlign.left),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            child:   Consumer<DecontamintaionViewModel>(
              builder: (ctx, decontamintaionVM, child) {
                return  TextField(
                  maxLines: 6,
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appThemColor, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appThemColor, width: 1)),
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