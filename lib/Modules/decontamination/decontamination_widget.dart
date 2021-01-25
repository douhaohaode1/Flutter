import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/Animations/TypeWeiter.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'package:flutter_demo/Modules/decontamination/decontamintaion_model.dart';
import 'package:flutter_demo/Modules/decontamination/qr_code_scanner_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'decontamination_public.dart';
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

      padding: EdgeInsets.fromLTRB(56, 25, 56, widget.model["title"] == "Serial:" ? 20 : 0),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Text(widget.model["title"],style: AppTextStyle.appThemColorTextStyle,textAlign:TextAlign.left),
              ),
              SizedBox(width: 10),
              Expanded(
                  child:Text(widget.value,style: AppTextStyle.appThemColorTextStyle,textAlign:TextAlign.left,maxLines: 20,),
              ),
            ],
        ),
    );
  }

  Widget buildRecordItem(BuildContext context){
    return Container(
      height: 90,
      padding: EdgeInsets.fromLTRB(42, 30 , 35, 20),
      child: Row(
          children: <Widget>[
                Expanded(
                  child:  TextField(
                    readOnly: true,
                    controller: TextEditingController(text: widget.value ?? ""),
                    inputFormatters: [LengthLimitingTextInputFormatter(25)],
                    decoration: InputDecoration(
                      fillColor: appThemBackgroupColor,
                      filled: true,
                      hintText:  widget.model['title'],
                      hintStyle:TextStyle(color: hintTextColor,fontSize: 14 ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal:6.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
            SizedBox(width: 8),
            IconButton(
              icon:Image.asset(
                  "images/scancode.png",
                  width: 27,
                  height: 27,),
              padding: EdgeInsets.all(2),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => QRSeannerView(widget.model["mark"])));
              },
            ),
          ],
      ),
    );
  }

  Widget buildDescrpotionItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(42, 0, 42, 0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20,
            child:  Text(widget.model["title"],style: AppTextStyle.appTitleColorTextStyle,textAlign:TextAlign.left),
          ),
          SizedBox(height: 10),
          Container(
            height: 140,
            alignment : Alignment.topLeft,
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: AppColors.mainColor, width: 1.5)
            ),
            child: Text("   ${widget.value}",style: AppTextStyle.appTitleColorTextStyle,textAlign:TextAlign.left),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem> buildMenuItems(DecontaminationMenuMark mark ,DecontamintaionViewModel VM){
    List<DecontamintaionCode> menu;
    if (mark ==  DecontaminationMenuMark.unitTypeCodeMenu){
      menu = VM.model.menu.unitTypeMasterList;
    }
    if (mark ==   DecontaminationMenuMark.statusCodeMenu)   {
      menu =  VM.model.menu.statusMasterList;
    }
    if (mark ==   DecontaminationMenuMark.reasonCodeMenu)  {
       menu = VM.model.menu.reasonMasterList;
    }
    var datas =  menu.asMap().keys.map((item)=>
        DropdownMenuItem(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
            child:Text( menu[item].description ,style: AppTextStyle.appThemColorTextStyle),
          ),
          value: menu[item].codeId,
        ),
    ).toList();
    return  datas;
  }

  String menuSelectValue;

  Widget buildMenuItem(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(25, 2, 25, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Text(widget.model["mark"] == DecontaminationMenuMark.reasonCodeMenu ? " " : "*",style: AppTextStyle.appMakeColorStyle,textAlign:TextAlign.left),
              SizedBox(width: 2),
              Text(widget.model["title"],style: AppTextStyle.appThemColorTextStyle,textAlign:TextAlign.left),
            ],
          ),
        SizedBox(height: 5),
        Container(
            height: 37.5,
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
                icon: Icon(Icons.keyboard_arrow_down,color: AppColors.mainColor,),
                iconSize: 30,
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
    return  Container(
      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.model["title"],style: AppTextStyle.appBlackColorTextStyle,textAlign:TextAlign.left),
          SizedBox(height: 5),
          Consumer<DecontamintaionViewModel>(
              builder: (ctx, decontamintaionVM, child) {
                return  TextField(
                  maxLines: 4,
                  onChanged: (text) {
                    print('change $text');
                    decontamintaionVM.changeModel(ctx,comment:text);
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor, width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor, width: 1.5)),
                  ),
               );
             },
          ),
        ],
      ),
    );
  }
}