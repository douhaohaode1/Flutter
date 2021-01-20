import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'decontamination_widget.dart';
import 'decontamintaion_model.dart';
import 'decontamintaion_view_model.dart';

class DecontaminationUpdatePage extends StatefulWidget{
  @override
  _DecontaminationUpdatePageState  createState() => _DecontaminationUpdatePageState();
}

class _DecontaminationUpdatePageState extends State<DecontaminationUpdatePage>{

  static const Color appThemColor = Color(0xff113a70);
  static const TextStyle appButtonThemColor = TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemColor,
        title: Text("Boston\nScientific",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body:  Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Consumer<DecontamintaionViewModel>(
                  builder: (ctx, decontamintaionVM, child) {
                   // print("data02 Consumer build方法被执行");
                    return ListView(
                      children: [
                        DecontaminationItems(model: decontamintaionUpateStyles[0],value: decontamintaionVM.model.upn,),
                        DecontaminationItems(model: decontamintaionUpateStyles[1],value: decontamintaionVM.model.description,),
                        DecontaminationItems(model: decontamintaionUpateStyles[2],value: decontamintaionVM.model.serial,),
                        DecontaminationItems(model: decontamintaionUpateStyles[3],value: decontamintaionVM.model.unitTypeCode ,),
                        DecontaminationItems(model: decontamintaionUpateStyles[4],value: decontamintaionVM.model.statusCode ,),
                        DecontaminationItems(model: decontamintaionUpateStyles[5],value: decontamintaionVM.model.reasonCode ,),
                        DecontaminationItems(model: decontamintaionUpateStyles[6],value: decontamintaionVM.model.comment,),
                      ],
                    );
                  },
                ),
            ),
            ///下面控件位于Column布局底部
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //平均分配
                children: <Widget>[
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 30)/2, // 宽度无限，跟父控件保持一致
                    height: 44,
                    child:  RaisedButton(
                      child: Text('检测', style: appButtonThemColor),
                      color: appThemColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 30)/2,
                    height: 44,
                    child:  RaisedButton(
                      color: appThemColor,
                      child: Text('更新',style: appButtonThemColor),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {

                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      //bodyListView(context),
    );
  }
}

