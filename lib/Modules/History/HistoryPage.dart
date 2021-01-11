import 'package:flutter/material.dart';
import 'package:flutter_demo/Tool/SqlDB/DatabaseHelper.dart';
import 'package:flutter_demo/Model/TranslationModel.dart';
import 'package:flutter_demo/Tool/SqlDB/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:date_format/date_format.dart';
import 'dart:convert';

class HistoryPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HistoryPageState();
  }
}

class _HistoryPageState extends State<HistoryPage> {

  // 数据集
  List<TranslationModel> contentList = <TranslationModel>[];

 // 数据库单例
  static DatabaseHelper  instance = DatabaseHelper.instance;


  @override
  void initState(){
    super.initState();
    queryData();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("历史"),
      ),
      body: Stack(
        alignment: const Alignment(0.8, 0.7),
        children: <Widget>[
           CustomScrollView(
             slivers: <Widget>[
                SliverPadding( //设置内边距
                 padding: EdgeInsets.all(10),
                  sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.greenAccent,
                          //child: Text(contentList[index].from),
                          //print()
                          child: Text(contentList[index].from),

                        );
                      },
                      childCount: contentList.length //数量
                  ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, //一个几个item?
                  mainAxisSpacing: 8, //item上下间隔
                  crossAxisSpacing: 8, //item左右间隔
               )),
            ),
          ],
         ),
          RaisedButton(
            child: Text(
              '添加收藏夹!',
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {

                 insertData();

              });
            },
          )
        ],
      ),
    );
  }


  void insertData() async {
    await instance.open();
    Map<String,Object> par = Map<String,Object>();
    par['goto'] = '中文';
    par['form'] = '英文';
    par['src'] = '苹果';
    par['dst'] = 'apple';
    par['createData'] = formatDate(DateTime.now() ,['yyyy', '-', 'mm', '-', 'dd' 'HH', ':', 'nn', ':', 'ss']);
    int flag = await instance.insertByHelper('tb_history', par);
    //int flag = await dbUtil.insert('INSERT INTO relation(uid, fuid, type) VALUES("111111", "2222222", 1)');
    print('flag:$flag');
    await instance.close();

    queryData();
    setState(() {

    });
  }

  void queryData() async{

    await instance.open();
    List<Map> data = await instance.queryList("SELECT * FROM tb_history");
    //List<Map> data = await dbUtil.queryListByHelper('relation', ['id','uid','fuid','type'], 'uid=?', [5]);
    print('data：$data');

    // String showdata = "";
    // if(data == null){
    //   showdata = "";
    // }
      //contentList
      List<TranslationModel> datas = data
          .map<TranslationModel>(
              (item) => TranslationModel.fromJson(item))
          .toList();

    //print(contentList[0].form);

     contentList = datas;
    await instance.close();

  }



}
