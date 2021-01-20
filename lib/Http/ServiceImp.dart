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

  postRequest() async {

    var path = "http://10.10.35.201:51002/api/cop/test/getEquipmentMaster";
    var params = {'equipmentMaster':{'upn':'H749555100Z','serial':'123456'}};

    Response response =
    await Dio().post(path, queryParameters: params);
    print('sfsadfadfadfasdf${response}');
  }

  static Future<Map<String,dynamic>> addUser(String username, String fullname) async {
    var response = await Dio().post('test/addUser',data: {
      'username': username,
      'fullname': fullname});
    return response.data;
  }

  updateUser(String id, String fullname) async {
    var response = await HttpUtils.getInstance().post('/test/updateUser',queryParameters: {
      'id': 1,
      'fullname': 'ssssa'});
    return response.data;
  }


  getDescripotion(String upn, String serial) async{

    var parame = {'baseInfo':{'userId':"123456",'tenantId':"654321"},'equipmentMaster':{'upn':upn,'serial':'123456'}};
    Response responses = await HttpUtils.getInstance().post('/api/cop/test/getEquipmentMaster',data: parame,
        onSuccess: (responses){
          print(responses);
        },
        onFailure: (msg){
          print(msg);
        },
        isNeedCache: true);
    var json = jsonDecode(responses.toString());
     return json;
  }

  getDecontaminationEnum() async{

    var parame = {'baseInfo':{'userId':"123456",'tenantId':"654321"}};
    //http://10.10.35.201:51002/api/cop/test/getDecontaminationState

    Response responses = await HttpUtils.getInstance().post('/api/cop/test/getDecontaminationEnum',data: parame
        ,onSuccess: (responses){
          print(responses);
        },
        onFailure: (msg){
          print(msg);
        },
        isNeedCache: true);
    var json = jsonDecode(responses.toString());
    print('------22222--------${json}');
    return json;

  }


  // updateCodeStatedate(String upn, int serial) async{
  //
  //   var parame = {'equipmentMaster':{'upn':upn,'serial':serial}};
  //
  //   Response responses = await HttpUtils.getInstance().post('/api/cop/test/getEquipmentMaster',data:{'equipmentMaster':{'upn':upn,'serial':serial}},
  //       onSuccess: (responses){
  //         print(responses);
  //       },
  //       onFailure: (msg){
  //         print(msg);
  //       },
  //       isNeedCache: true);
  //   var json = jsonDecode(responses.toString());
  //   print('------1111111--------${json}');
  //   return json;
  // }

  // updateCodeStatedate1(String upn, int serial) async{
  //   var parame = {'equipmentMaster':{'upn':upn,'serial':serial}};
  //   Response responses = await HttpUtils.getInstance().get('/api/cop/test/getEquipmentMaster',queryParameters:{'equipmentMaster':{'upn':upn,'serial':serial}},
  //       onSuccess: (responses){
  //         print(responses);
  //       },
  //       onFailure: (msg){
  //         print(msg);
  //       },
  //       isNeedCache: true);
  //
  //   var json = jsonDecode(responses.toString());
  //   print('------1111111--------${json}');
  //   return json;
  // }


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