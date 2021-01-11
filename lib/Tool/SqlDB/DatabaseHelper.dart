import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'CreateTablesqls.dart';

class DatabaseHelper {

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  //所有的sql语句
  static  Map<String,String>  allTableSqls;
  static  List<String>  noCreateTables;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  static Future _initDatabase() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, CreateTableSqls.DB_NAME);
    log("database: $path");
    // 所有的sql语句
    allTableSqls = CreateTableSqls().getAllTables();
    noCreateTables =  await _onDetect(path,allTableSqls);
    // 说明需要创建
    if (noCreateTables.length>0) {
      print(noCreateTables.length.toString());
      try {
        _database = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade,onOpen: _onOpen, onConfigure: _onConfigure);
        //return database;
      } catch (error) {
        log(error);
      }
      List tableMaps = await _database.rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    // print('所有表:'+tableMaps.toString());
      _database.close();
    }
  }

  // 检查数据库中是否有所有有表,返回需要创建的表
  static Future<List<String>> _onDetect(String path, Map<String,String> tableSqls) async{

    try {
      _database = await openDatabase(path);
    } catch (e) {
      print('CreateTables init Error $e');
    }
    Iterable<String> tableNames = tableSqls.keys;
    // 已经存在的表
    List<String> existingTables = List<String>();
    // 要创建的表
    List<String> createTables = List<String>();
    List tableMaps = await _database.rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');

    tableMaps.forEach((item){
      existingTables.add(item['name']);
    });
    tableNames.forEach((tableName){
      if(!existingTables.contains(tableName)){
        createTables.add(tableName);
      }
    });
    _database.close();
    return createTables;
  }

  static void _onCreate(final Database database, final int newVersion) async {
    print('db created version is $newVersion');
  }

  static void _onOpen(final Database database) async {
    noCreateTables.forEach((sql) async{
      print(' 新建了 这个表了');
      await database.execute(allTableSqls[sql]);
    });
  }
  static Future<FutureOr<void>> _onUpgrade (final Database database, final int oldVersion, int newVersion) async {
    log("upgrade database: $oldVersion to $newVersion");
    // do something. database.execute('alter table ...')
  }

  static void _onConfigure(final Database database) async {
    // await database.execute('PRAGMA foreign_keys = ON');
  }

  /// 打开数据库
  open() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'translation.db');
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

  ///sql助手插入 @tableName:表名  @paramters：参数map
  Future<int> insertByHelper(String tableName,Map<String,Object> paramters) async {
    return await _database.insert(tableName, paramters);
  }
  ///sql原生插入
  Future<int> insert(String sql,List paramters) async {
    //调用样例： dbUtil.insert('INSERT INTO Test(name, value) VALUES(?, ?)',['another name', 12345678]);
    return await _database.rawInsert(sql,paramters);
  }

  ///sql助手查找列表  @tableName:表名  @selects 查询的字段数组 @wheres 条件，如：'uid=? and fuid=?' @whereArgs 参数数组
  Future<List<Map>> queryListByHelper(String tableName,List<String> selects,String whereStr,List whereArgs) async {
    //调用样例：await dbUtil.queryListByHelper('relation', ['id','uid','fuid'], 'uid=? and fuid=?', [6,1]);
    List<Map> maps = await _database.query(
        tableName,
        columns: selects,
        where: whereStr,
        whereArgs: whereArgs);
    return maps;
  }

  ///sql原生查找列表
  Future<List<Map>> queryList(String sql) async {
    return await _database.rawQuery(sql);
  }

  ///sql助手修改
  Future<int> updateByHelper(String tableName,Map<String,Object> setArgs,String whereStr,List whereArgs) async {
    //样例：
    //Map<String,Object> par = Map<String,Object>();
    //par['fuid'] = 1;
    //dbUtil.updateByHelper('relation', par, 'type=? and uid=?', [0,5]);
    return await _database.update(
        tableName,
        setArgs,
        where: whereStr,
        whereArgs: whereArgs);
  }

  ///sql原生修改
  Future<int> update(String sql,List paramters) async {
    //样例：dbUtil.update('UPDATE relation SET fuid = ?, type = ? WHERE uid = ?', [1,2,3]);
    return await _database.rawUpdate(sql,paramters);
  }

  ///sql助手删除   刪除全部whereStr和whereArgs传null
  Future<int> deleteByHelper(String tableName,String whereStr,List whereArgs) async {
    return await _database.delete(
        tableName,
        where: whereStr,
        whereArgs: whereArgs);
  }

  ///sql原生删除
  Future<int> delete(String sql,List parameters) async {
    //样例： 样例：await dbUtil.delete('DELETE FROM relation WHERE uid = ? and fuid = ?', [123,234]);
    return await _database.rawDelete(sql, parameters);
  }

  ///获取Batch对象，用于执行sql批处理
  Future<Batch> getBatch() async{
    //调用样例
    //  Batch batch = await DBUtil().getBatch();
    //  batch.insert('Test', {'name': 'item'});
    //  batch.update('Test', {'name': 'new_item'}, where: 'name = ?', whereArgs: ['item']);
    //  batch.delete('Test', where: 'name = ?', whereArgs: ['item']);
    //  List<Object> results = await batch.commit();  //返回的是id数组
    //                         //batch.commit(noResult: true);//noResult: true不关心返回结果，性能高
    //                         //batch.commit(continueOnError: true)//continueOnError: true  忽略错误，错误可继续执行
    return _database.batch();
  }

  ///事务控制
  Future<dynamic> transaction(Future<dynamic> Function(Transaction txn) action)async{
    //调用样例
    //  try {
    //     await dbUtil.transaction((txn) async {
    //        Map<String,Object> par = Map<String,Object>();
    //        par['uid'] = Random().nextInt(10); par['fuid'] = Random().nextInt(10);
    //        par['type'] = Random().nextInt(2); par['id'] = 1;
    //        var a = await txn.insert('relation', par);
    //        var b = await txn.insert('relation', par);
    //   });
    //   } catch (e) {
    //     print('sql异常:$e');
    //   }
    return await _database.transaction(action);
  }



}