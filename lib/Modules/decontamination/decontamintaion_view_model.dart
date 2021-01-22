import 'package:flutter/material.dart';
import 'package:flutter_demo/Http/ServiceImp.dart';
import 'decontamintaion_model.dart';

class DecontamintaionViewModel  extends ChangeNotifier{

  DecontamintaionViewModel(this._model);

  DecontamintaionModle _model;
  DecontamintaionModle get model => _model;
  set model(DecontamintaionModle value) {
    _model = value;
    notifyListeners();
  }

  List _unitTypeCodeEnum;
  List get unitTypeCodeEnum => _unitTypeCodeEnum;
  set unitTypeCodeEnum(List value) {
    _unitTypeCodeEnum = value;
  }

  List _statusCodeEnum;
  List get statusCodeEnum => _statusCodeEnum;
  set statusCodeEnum(List value) {
    _statusCodeEnum = value;
  }

  List _reasonCodeEnum;
  List get reasonCodeEnum => _reasonCodeEnum;
  set reasonCodeEnum(List value) {
    _reasonCodeEnum = value;
  }

  Future<void> getDescroption(BuildContext context,{String unp ,String description , String serial}) async {
    try{
      /// todo send network request to get descroption information
    var json=   await ServiceImpl.getInstance().getDescripotion(unp,unp);
        if(json){
          print(json);
        }
    }catch(e){
      print(e);
    }
  }
  Future<void>check() async{
    try{
      /// todo send network request to check information
      return true;
    }catch(e){
      return false;
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
      _unitTypeCodeEnum = [{"name":"1231","id":"1"},{"name":"23232","id":"2"},{"name":"44533","id":"3"}];
      _statusCodeEnum = [{"name":"fsfsdfs","id":"1"},{"name":"adasdasdas","id":"2"},{"name":"ccasdad","id":"3"}];
      _reasonCodeEnum = [{"name":"aaaaaa","id":"1"},{"name":"bbbbbb","id":"2"},{"name":"ccccccc","id":"3"}];
     // notifyListeners();
    }
  }

  Future<void> updete(BuildContext context,{String mark}) async {
    try{
      /// todo send network request to update
      var json=   await ServiceImpl.getInstance().getDecontaminationEnum();
      if(json){
        print(json);
        //notifyListeners();
      }
    }catch(e){
      print(e);
      _unitTypeCodeEnum = [{"name":"1231","id":"1"},{"name":"23232","id":"2"},{"name":"44533","id":"3"}];
      _statusCodeEnum = [{"name":"fsfsdfs","id":"1"},{"name":"adasdasdas","id":"2"},{"name":"ccasdad","id":"3"}];
      _reasonCodeEnum = [{"name":"aaaaaa","id":"1"},{"name":"bbbbbb","id":"2"},{"name":"ccccccc","id":"3"}];
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

   changeModel(BuildContext context ,{String upn, String description , String serial ,String reasonCode ,String unitTypeCode,String statusCode,}){
    //model.serial = serial ?? model.serial;
    //model.upn = upn ?? model.upn;
    model.description = description ?? model.description;
    model.reasonCode = reasonCode ?? model.reasonCode;
    model.unitTypeCode = unitTypeCode ?? model.unitTypeCode;
    model.statusCode = statusCode ?? model.statusCode;
    //model.comment = comment ?? model.comment;
    notifyListeners();
   }

   changeComment(BuildContext context , String comment){
    model.comment = comment;
   }
   changeUpn(BuildContext context , String upn){
     model.upn = upn;
   }
    changeSerial(BuildContext context , String serial){
     model.serial =  serial;
   }

  void hideKeyboard(BuildContext context) {
     FocusScopeNode currentFocus = FocusScope.of(context);
     if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
       FocusManager.instance.primaryFocus.unfocus();
    }
  }

  void hideboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
      FocusManager.instance.primaryFocus.canRequestFocus = false;
      Future.delayed(Duration(milliseconds: 100), () {
        FocusManager.instance.primaryFocus.canRequestFocus = true;
      });
    }
  }
}