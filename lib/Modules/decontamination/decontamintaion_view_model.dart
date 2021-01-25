import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Http/ServiceImp.dart';
import 'decontamintaion_model.dart';
import 'decontamination_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class DecontamintaionModle{
  String upn;
  String description;
  String serial;
  String unitTypeCode;
  String statusCode;
  String reasonCode;
  String comment;
  DecontamintaionCodeModel   menu;
  DecontamintaionModle({this.upn,this.description,this.serial,this.reasonCode,this.unitTypeCode,this.statusCode,this.comment ,this.menu});
}

List  decontamintaionDetectStyles = [
  {"title": "機器UPN","style":DecontaminationCellStyle.record,"mark":DecontaminationMenuMark.upnRecord},
  {"title": "Description","style":DecontaminationCellStyle.descrpotion},
  {"title": "シリアル番号","style":DecontaminationCellStyle.record,"mark":DecontaminationMenuMark.serialRecord},
];

List decontamintaionUpateStyles = [
  {"title": "機器UPN:","style":DecontaminationCellStyle.non},
  {"title": "Description:","style":DecontaminationCellStyle.non},
  {"title": "Serial:","style":DecontaminationCellStyle.non},
  {"title": "Unit Type Code","style":DecontaminationCellStyle.menu,"mark":DecontaminationMenuMark.unitTypeCodeMenu},
  {"title": "Status Code","style":DecontaminationCellStyle.menu,"mark":DecontaminationMenuMark.statusCodeMenu},
  {"title": "Reason Code","style":DecontaminationCellStyle.menu,"mark":DecontaminationMenuMark.reasonCodeMenu},
  {"title": "Comment","style":DecontaminationCellStyle.comment},
];

class DecontamintaionViewModel  extends ChangeNotifier{

  DecontamintaionViewModel(this._model);

  DecontamintaionModle _model;
  DecontamintaionModle get model => _model;
  set model(DecontamintaionModle value) {
    _model = value;
    notifyListeners();
  }

  var codeJson = {
    "unitTypeMasterList":[{"codeId": "01" ,"description":"SalesProgram"},{"codeId": "02", "description": "Rental"}, {"codeId": "03", "description": "Loaner"}, {"codeId": "04", "description": "Sold"}],
    "statusMasterList":[{"codeId": "00", "description": "なし", "durationTime": "00:00:00"}, {"codeId": "01", "description": "受領", "durationTime": "00:10:00"},
      {"codeId": "02", "description": "RGA申請", "durationTime": "00:10:00"}, {"codeId": "03", "description": "除染", "durationTime": "02:00:00"},
      {"codeId": "04", "description": "JP30へ移動", "durationTime": "00:10:00"}, {"codeId": "05", "description": "タグ付け", "durationTime": "02:00:00"},
      {"codeId": "06", "description": "動作点検", "durationTime": "02:00:00"}, {"codeId": "07", "description": "リワーク", "durationTime": "01:00:00"},
      {"codeId": "08", "description": "D625移動待ち", "durationTime": "00:30:00"}, {"codeId": "09", "description": "完了", "durationTime": "00:00:00"}],
    "reasonMasterList":[{"codeId": "01" ,"description":"SalesProgram"},{"codeId": "02", "description": "Rental"}, {"codeId": "03", "description": "Loaner"}],
  };

  Future<bool> getDescroption(BuildContext context,{String unp ,String description , String serial}) async {

    Loading.showLoading(context);
    return  await Future.delayed(Duration(milliseconds: 1000), () {
      debugPrint("Delay 1.5 second");
      model.upn  =  unp;
      model.description  =  "i-Lab CART Syerons88";
      notifyListeners();
      Loading.hideLoading(context);
      return true;
    });

    // try{
    //   /// todo send network request to get descroption information
    // var json=   await ServiceImpl.getInstance().getDescripotion(unp,unp);
    //     if(json){
    //       print(json);
    //     }
    // }catch(e){
    //   print(e);
    // }
  }
  Future<bool>check(BuildContext context) async{

    Loading.showLoading(context);

    // var json=   await ServiceImpl.getInstance().getDecontaminationEnum();
    // if(json){
    //   print(json);
    //   //notifyListeners();
    // }

   return  await Future.delayed(Duration(milliseconds: 1000), () {
      debugPrint("Delay 1.5 second");
      final  DecontamintaionCodeModel models = DecontamintaionCodeModel.fromJson(codeJson);
      model.menu  = models;
      Loading.hideLoading(context);
      return true;
    });
    // try{
    //   /// todo send network request to get descroption information
   //   Loading.showLoading(context);
    // var json=   await ServiceImpl.getInstance().getDescripotion("1231","wq213");
    //     if(json){
    //       print(json);
    //     }
    // final  DecontamintaionCodeModel models = DecontamintaionCodeModel.fromJson(codeJson);
    // model.menu  = models;
    // //  Loading.hideLoading(content);
    // Loading.hideLoading(context);
    // return  true;
    // }catch(e){
    // //  Loading.hideLoading(context);
    //   print("error----${e}");
    //   final  DecontamintaionCodeModel models = DecontamintaionCodeModel.fromJson(codeJson);
    //   model.menu  = models;
    //   Loading.hideLoading(context);
    //   return  true;
    // }
  }

  Future<bool>update(BuildContext context) async{
    Loading.showLoading(context);
    return  await Future.delayed(Duration(milliseconds: 1000), () {

      debugPrint("Delay 1.5 second");
      model.upn  = "";
      model.serial = "";
      model.description  = "";
      model.comment = "";
      model.unitTypeCode = "";
      model.statusCode = "";
      model.reasonCode = "";
      notifyListeners();
      Loading.hideLoading(context);
      return true;
    });

    try{
      /// todo send network request to update
      var json=   await ServiceImpl.getInstance().getDecontaminationEnum();
      if(json){
        print(json);
        //notifyListeners();
      }
    }catch(e){
      print(e);
      // notifyListeners();
    }
  }

  Future<void> getEnum(BuildContext context,{String mark}) async {
    try{
      /// todo send network request to get menu
      var json=   await ServiceImpl.getInstance().getDecontaminationEnum();
      if(json){
        print(json);
        //notifyListeners();
      }
    }catch(e){
      print(e);
     // notifyListeners();
    }
  }
   clear(){
    model.comment = "";
    model.unitTypeCode = "";
    model.statusCode = "";
    model.reasonCode = "";
    notifyListeners();
   }
   changeModel(BuildContext context ,{String upn, String description , String serial ,String reasonCode ,String unitTypeCode,String statusCode,String comment}){
    model.serial = serial ?? model.serial;
    model.upn = upn ?? model.upn;
    model.description = description ?? model.description;
    model.reasonCode = reasonCode ?? model.reasonCode;
    model.unitTypeCode = unitTypeCode ?? model.unitTypeCode;
    model.statusCode = statusCode ?? model.statusCode;
    model.comment = comment ?? model.comment;
    notifyListeners();
   }
}


class Loading {
  static bool isShow = false;

  static showLoading(BuildContext context) {
    if (!isShow) {
      isShow = true;
      showGeneralDialog(
          context: context,
          // barrierColor: Colors.white, //
          // barrierLabel: '',
          barrierDismissible: false,
          transitionDuration: const Duration(milliseconds: 150),
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return Align(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Theme(
                  data: ThemeData(
                    cupertinoOverrideTheme: CupertinoThemeData(
                      brightness: Brightness.dark,
                    ),
                  ),
                  child: CupertinoActivityIndicator(
                    radius: 14,
                  ),
                ),
              ),
            );
          }).then((value) {
        isShow = false;
      });
    }
  }
  static hideLoading(BuildContext context) {
    if (isShow) {
      Navigator.of(context).pop();
    }
  }
}