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
    /*
    * {code: 1, data: {status: 200, msg: success, decontaminationEnum: {unitTypeMasterList: [{unitTypeCode: 01, description: SalesProgram},
    * {unitTypeCode: 02, description: Rental}, {unitTypeCode: 03, description: Loaner}, {unitTypeCode: 04, description: Sold}],
    *  statusMasterList: [{statusCode: 00, description: なし, durationTime: 00:00:00}, {statusCode: 01, description: 受領, durationTime: 00:10:00},
    * {statusCode: 02, description: RGA申請, durationTime: 00:10:00}, {statusCode: 03, description: 除染, durationTime: 02:00:00},
    * {statusCode: 04, description: JP30へ移動, durationTime: 00:10:00}, {statusCode: 05, description: タグ付け, durationTime: 02:00:00},
    * {statusCode: 06, description: 動作点検, durationTime: 02:00:00}, {statusCode: 07, description: リワーク, durationTime: 01:00:00},
    * {statusCode: 08, description: D625移動待ち, durationTime: 00:30:00}, {statusCode: 09, description: 完了, durationTime: 00:00:00}],
    *  reasonMasterList: [{reasonCode: 01, r<…>

    * {"code":"1","data":{"status":400,"msg":"no data found","equipmentMaster":null}}
    flutter: {"code":"1","data":{"status":400,"msg":"no data found","equipmentMaster":null}}
    *
    * */


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