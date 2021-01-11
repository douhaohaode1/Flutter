
class CreateTableSqls{

  static const String DB_NAME = "translation.db";

  static const String TB_HISTORY = "tb_history";
  static const String TB_NOTRBOOKLIST = "tb_notebookList";
  static const String TB_NOTEBOOKCONTENT = "tb_notebookContent";
  static const String TB_DOCLIST = "tb_docList";
  static const String TB_DOCONTENT = "tb_doccontentList";

  //所有表:[{name: user}, {name: sqlite_sequence}]

  /// 搜索记录
  static final String CREATE_TABLE_SQL_TB_HISTORY = '''
      CREATE TABLE IF NOT EXISTS tb_history (
      id INTEGER PRIMARY KEY,
      goto TEXT,
      form TEXT,
      title TEXT,
      subtitle TEXT,
      createData TEXT,
      src TEXT,
      dst TEXT,
      updateData TEXT,
      number INTEGER);
      ''';

  /// 笔记本列表
  static final String CREATE_TABLE_SQL_TB_NOTEBOOKLIST = '''
      CREATE TABLE IF NOT EXISTS tb_notebookList (
      id INTEGER PRIMARY KEY, 
      goto TEXT,
      form TEXT,
      title TEXT, 
      subtitle TEXT, 
      createData TEXT, 
      updateData TEXT,
      trans_result TEXT,
      number INTEGER);
      ''';

  //使用IF NOT EXISTS创建数据表，即使此表已经存在，也会执行成功
  /// 笔记本分类下条目
  static final String CREATE_TABLE_SQL_TB_NOTEBOOKCONTENT ='''
      CREATE TABLE IF NOT EXISTS tb_notebookContent (
      id INTEGER PRIMARY KEY, 
      goto TEXT,
      form TEXT,
      title TEXT, 
      subtitle TEXT, 
      createData TEXT, 
      updateData TEXT,
      trans_result TEXT,
      number INTEGER,
      listid INTEGER);
      ''';

  /// 文档列表
  static final String CREATE_TABLE_SQL_TB_TB_DOCLIST = '''
      CREATE TABLE IF NOT EXISTS tb_docList (
      id INTEGER PRIMARY KEY, 
      goto TEXT,
      form TEXT,
      title TEXT, 
      subtitle TEXT, 
      createData TEXT, 
      updateData TEXT,
      trans_result TEXT,
      number INTEGER);
      ''';

  /// 文档内容
  static final String CREATE_TABLE_SQL_TB_DOCONTENT = '''
      CREATE TABLE IF NOT EXISTS tb_doccontentList (
      id INTEGER PRIMARY KEY, 
      goto TEXT,
      form TEXT,
      title TEXT, 
      subtitle TEXT ,
      createData TEXT,
      updateData TEXT,
      number INTEGER,
      trans_result TEXT,
      listid INTEGER);
      ''';

  /// 用户表
  static final String CREATETABLESQL_USER = '''
    CREATE TABLE IF NOT EXISTS user (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
    uid BIGINT(20) NOT NULL, 
    phonenumber TEXT(30) NOT NULL, 
    nickName TEXT(100));
    ''';


  Map<String,String> getAllTables(){
    Map<String,String> map = Map<String,String>();

    map['tb_history'] = CREATE_TABLE_SQL_TB_HISTORY;
    map['tb_notebookList'] = CREATE_TABLE_SQL_TB_NOTEBOOKLIST;
    map['tb_notebookContent'] = CREATE_TABLE_SQL_TB_NOTEBOOKCONTENT;
    map['tb_docList'] = CREATE_TABLE_SQL_TB_TB_DOCLIST;
    map['tb_doccontentList'] = CREATE_TABLE_SQL_TB_DOCONTENT;
    map['user'] = CREATETABLESQL_USER;
    return map;
  }

}