import 'package:flutter/material.dart';

class API {

  static String baseUrl = "https://www.wanandroid.com";

  static String getList([int pageNum =0]){
    return "/project/list/$pageNum/json?cid=294";
  }
}



