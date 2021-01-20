import 'package:flutter/material.dart';

class API {

  //static String baseUrl = "https://www.wanandroid.com";

  static String baseUrl = "http://10.10.35.201:51002";

  static String getList([int pageNum =0]){
    return "/project/list/$pageNum/json?cid=294";
  }
  //upn:H749555100Z  serial:123456
  static String updateState(){
    return "/api/cop/test/getEquipmentMaster";
  }

  static String translation(){

    return "";
  }
}



