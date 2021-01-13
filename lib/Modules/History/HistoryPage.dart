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
  List<TransListModle> contentList = <TransListModle>[];
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
                 padding: EdgeInsets.all(20),
                  sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.greenAccent,
                          child: Text(contentList[index].createData),
                        );
                      },
                      childCount: contentList.length //数量
                  ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, //一个几个item?
                  mainAxisSpacing: 20, //item上下间隔
                  childAspectRatio: 1.3, //子元素在横轴长度和主轴长度的比例
                    //crossAxisSpacing: 8, //item左右间隔
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

              insertData();
              //setState(() {
            //  });
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
   // final f = new DateFormat();
    par['createData'] = formatDate(DateTime.now() ,['yyyy', '-', 'mm', '-', 'dd' ,' ','HH', ':', 'mm', ':', 'ss']);
    int flag = await instance.insertByHelper('tb_history', par);
    //int flag = await dbUtil.insert('INSERT INTO relation(uid, fuid, type) VALUES("111111", "2222222", 1)');
    await instance.close();
    queryData();
  }

  void queryData() async{

    await instance.open();
    List<Map> data = await instance.queryList("SELECT * FROM tb_history");

    List<TransListModle> datas = data.map(
            (item){ return TransListModle.fromJson(item); })
          .toList();

     contentList = datas;
    await instance.close();

    setState(() {

    });
  }

}
