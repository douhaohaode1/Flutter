import 'package:flutter/material.dart';
import 'package:flutter_demo/Http/ServiceImp.dart';
import 'decontamintaion_model.dart';

class DecontamintaionViewModel  extends ChangeNotifier{

  DecontamintaionModle _model;

  DecontamintaionViewModel(this._model);

  DecontamintaionModle get model => _model;

  List unitTypeCodeEnum;

  List statusCodeEnum;

  List reasonCodeEnum;


  set model(DecontamintaionModle value) {
    _model = value;
    notifyListeners();
  }
    Future<void> getDescroption(BuildContext context,{String unp ,String description , String serial}) async {

    try{
      //todo 发送upn码获取网络请求
    var json=   await ServiceImpl.getInstance()
          .getDescripotion(unp,unp);
        if(json){
          print(json);
        }
    }catch(e){
      print(e);
    }
  }

  Future<void> getEnum(BuildContext context,{String mark}) async {
    try{
      //todo 发送获取菜单码获取网络请求
      var json=   await ServiceImpl.getInstance().getDecontaminationEnum();
      if(json){
        print(json);
        //notifyListeners();
      }
    }catch(e){
      print(e);
      unitTypeCodeEnum = [{"name":"1231","id":1},{"name":"23232","id":2},{"name":"44533","id":3}];
      statusCodeEnum = [{"name":"fsfsdfs","id":1},{"name":"adasdasdas","id":2},{"name":"ccasdad","id":3}];
      reasonCodeEnum = [{"name":"aaaaaa","id":1},{"name":"bbbbbb","id":2},{"name":"ccccccc","id":3}];
     // notifyListeners();
    }
  }







    Future<void> changeModel(BuildContext context ,{String upn, String description , String serial ,String reasonCode ,String unitTypeCode,String statusCode,}) async {
    model.upn = upn ?? model.upn;
    model.description = description ?? model.description;
    model.serial = serial ?? model.serial;
    model.reasonCode = reasonCode ?? model.reasonCode;
    model.unitTypeCode = unitTypeCode ?? model.unitTypeCode;
    model.statusCode = statusCode ?? model.statusCode;
    notifyListeners();
  }

}