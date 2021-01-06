import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DBProvider{

   static const String DB_NAME = "translation.db";
   static const String TB_NOTRBOOKLIST = "tb_notebookList";
   static const String TB_NOTEBOOKCONTENT = "tb_notebookContent";

   static const String TB_DOCLIST = "tb_docList";
   static const String TB_DOCONTENT = "tb_doccontentList";


   static Database _db;

   static final DBProvider _singleton = DBProvider._internal();

   factory DBProvider() { return _singleton; }

   DBProvider._internal();

   Future<Database> get db async {
     if (_db != null) {
       return _db;
     }
     _db = await _initDB();
     return _db;
   }

   Future<Database> _initDB() async {

     Directory documentsDirectory = await getApplicationDocumentsDirectory();
     String path = join(documentsDirectory.path, 'translation.db');
     return await openDatabase(path,
         version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
   }


   /// 创建表
   Future _onCreate(Database db, int version) async {

     String sql =
         "CREATE TABLE $TB_NOTRBOOKLIST (id INTEGER PRIMARY KEY, to TEXT,form TEXT,title TEXT, subtitle TEXT , createData TEXT , updateData TEXT ,number INTEGER)";
     await db.execute(sql);

     sql = "CREATE TABLE $TB_NOTEBOOKCONTENT (id INTEGER PRIMARY KEY, to TEXT,form TEXT,title TEXT, subtitle TEXT , createData TEXT , updateData TEXT ,number INTEGER ,listid INTEGER)";
     await db.execute(sql);

     sql = "CREATE TABLE $TB_DOCLIST (id INTEGER PRIMARY KEY, to TEXT,form TEXT,title TEXT, subtitle TEXT , createData TEXT , updateData TEXT ,number INTEGER)";
     await db.execute(sql);

     sql = "CREATE TABLE $TB_DOCONTENT (id INTEGER PRIMARY KEY, to TEXT,form TEXT,title TEXT, subtitle TEXT , createData TEXT , updateData TEXT ,number INTEGER ,listid INTEGER)";
     await db.execute(sql);


     return await db.execute("CREATE TABLE User ("
         "id integer primary key AUTOINCREMENT,"
         "name TEXT,"
         "token TEXT,"
         "sex integer"
         ")");
   }


   /// 升级数据库
   Future _onUpgrade(Database db, int oldVersion, int newVersion) async {

   }



}
