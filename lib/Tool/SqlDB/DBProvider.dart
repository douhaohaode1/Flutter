import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer';


class DBProvider{

   static const String DB_NAME = "translation.db";
   static const String TB_NOTRBOOKLIST = "tb_notebookList";
   static const String TB_NOTEBOOKCONTENT = "tb_notebookContent";
   static const String TB_DOCLIST = "tb_docList";
   static const String TB_DOCONTENT = "tb_doccontentList";

   DBProvider._privateConstructor();
   static final DBProvider instance = DBProvider._privateConstructor();
   static Database _database;

   Future<Database> get database async {
     if (_database != null) {
       return _database;
     }
     _database = await _initDatabase();
     return _database;
   }

   Future<Database> _initDatabase() async {

     Directory documentsDirectory = await getApplicationDocumentsDirectory();
     String path = join(documentsDirectory.path, 'translation.db');

     log("database: $path");

     return await openDatabase(path,
         version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
   }


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

   }

   Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
     // do something. database.execute('alter table ...')
   }

   static void _onConfigure(final Database database) async {
     // await database.execute('PRAGMA foreign_keys = ON');
   }


}
