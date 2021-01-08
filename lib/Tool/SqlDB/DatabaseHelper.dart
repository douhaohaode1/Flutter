import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class DatabaseHelper {

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();

    return _database;
  }

  static Future _initDatabase() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, 'translation.db');
      //final String databasePath = await getDatabasesPath();
      //final String path = databasePath + '/translation.db';
      log("database: $path");
      var database = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade, onConfigure: _onConfigure);
      return database;
    } catch (error) {
      log(error);
    }
  }

  static void _onCreate(final Database database, final int newVersion) async {

    final List<String> sqlList = (await rootBundle.loadString('lib/Tool/SqlDB/create.sql')).split(';');
    Future.forEach(sqlList, (sql) async {
      log(sql);
      if (sql != '') {
        await database.execute(sql);
      }
    });


    // 获取所有需要创建的表
    //检查需要生成的表
   //List<String> noCreateTables = await getNoCreateTables(sqlList);

  }

  static Future<FutureOr<void>> _onUpgrade (final Database database, final int oldVersion, int newVersion) async {
    log("upgrade database: $oldVersion to $newVersion");
    // do something. database.execute('alter table ...')
  }

  static void _onConfigure(final Database database) async {
    // await database.execute('PRAGMA foreign_keys = ON');
  }

  // 检查数据库中是否有所有有表,返回需要创建的表
  Future<List<String>> getNoCreateTables(Map<String,String> tableSqls) async {
    Iterable<String> tableNames = tableSqls.keys;
    //已经存在的表
    List<String> existingTables = List<String>();
    //要创建的表
    List<String> createTables = List<String>();
    List tableMaps = await _database.rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    print('tableMaps:'+tableMaps.toString());
    tableMaps.forEach((item){
      existingTables.add(item['name']);
    });
    tableNames.forEach((tableName){
      if(!existingTables.contains(tableName)){
        createTables.add(tableName);
      }
    });
    return createTables;
  }



  /// 打开数据库
  open() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'translation.db');
    print('数据库存11111111储路径path:'+path);
    try {
      _database = await openDatabase(path);

      print('DB open');
    } catch (e) {
      print('DBUtil open() Error $e');
    }
  }
  /// 关闭数据库
  close() async {
    await _database.close();
    print('DB close');
  }

}