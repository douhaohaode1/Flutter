import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_demo/Http/Api.dart';
import 'package:flutter_demo/Http/HttpUtils.dart';
import 'package:flutter_demo/Model/ResultModel.dart';
import 'package:flutter_demo/Model/ResultMapper.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';


class ServiceImpl{
  static ServiceImpl _instance;

  static ServiceImpl getInstance() {
    if (_instance == null) _instance = ServiceImpl();
    return _instance;
  }

  getItemListByCid(int pageNum , int cid) async{

    Response responses = await HttpUtils.getInstance().get(API.getList(pageNum),
        onSuccess: (responses){
        },
        onFailure: (msg){

        },
        isNeedCache: true);

    var json = jsonDecode(responses.toString());
    final  ResutlModel models = JsonMapper.deserialize<ResutlModel>(json);
    return resultToVo(models);
  }

  getTranslation(String pama) async{

    Response responses = await HttpUtils.getInstance().get(API.translation(),
        onSuccess: (responses){

        },
        onFailure: (msg){

        },
        isNeedCache: true);

    var json = jsonDecode(responses.toString());

  }


}