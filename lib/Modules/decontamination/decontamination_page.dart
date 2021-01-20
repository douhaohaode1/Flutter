import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'decontamination_update_page.dart';
import 'decontamination_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'decontamintaion_model.dart';
import 'decontamintaion_view_model.dart';
import 'initialize_providers.dart';


class DecontaminationPage extends StatefulWidget{
  @override
  _DecontaminationPageState  createState() => _DecontaminationPageState();
}

class _DecontaminationPageState extends State<DecontaminationPage>{

  static const Color appThemColor = Color(0xff113a70);
  static const TextStyle appButtonThemColor = TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold);


 // List<SingleChildWidget> providers =
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
              appBar: AppBar(
                  backgroundColor: appThemColor,
                    title: Text("Boston\nScientific",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
                    centerTitle: true,),
                  body: Consumer<DecontamintaionViewModel>(
                    builder: (ctx ,vm,child){
                  return body(vm);
           },
        ),
    );
  }


  Widget body(vm){

    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Consumer<DecontamintaionViewModel>(
                builder: (ctx, decontamintaionVM, child) {
                  print("data02 Consumer build方法被执行");
                  return ListView(
                    children: <Widget>[
                      DecontaminationItems(model: decontamintaionDetectStyles[0],value:decontamintaionVM.model.upn),
                      DecontaminationItems(model: decontamintaionDetectStyles[1],value:decontamintaionVM.model.description),
                      DecontaminationItems(model: decontamintaionDetectStyles[2],value:decontamintaionVM.model.serial),
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
                mainAxisAlignment: MainAxisAlignment.end, //平均分配
                children: <Widget>[
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 30)/2,
                    height: 44,
                    child:  RaisedButton(
                      color: appThemColor,
                      child: Text('检测',style: appButtonThemColor),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {
                        //context.read<DecontamintaionViewModel>().changeModel(context,upn: "12dasdasdasdasdasd");

                        Get.to(DecontaminationUpdatePage());

                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      //bodyListView(context),
    );
  }
}

