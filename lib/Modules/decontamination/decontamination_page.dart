import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/Http/ServiceImp.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'decontamination_update_page.dart';
import 'decontamination_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';
import 'decontamintaion_model.dart';
import 'decontamintaion_view_model.dart';
import 'initialize_providers.dart';

class DecontaminationPage extends StatefulWidget {
  @override
  _DecontaminationPageState createState() => _DecontaminationPageState();
}

class _DecontaminationPageState extends State<DecontaminationPage> {

  static const Color appThemColor = Color(0xff113a70);
  static const TextStyle appButtonThemColor = TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold);

  static const Color appBarThemTextColor = Color(0xff000A46);
  static const TextStyle appBarThemTextStyle = TextStyle(color: appBarThemTextColor, fontSize: 19, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Boston\nScientific",
            style: appBarThemTextStyle, textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Consumer<DecontamintaionViewModel>(
              builder: (ctx, decontamintaionVM, child) {
                debugPrint("consumer build execute");
                return GestureDetector(
                  onPanDown: (DragDownDetails details) {
                   // decontamintaionVM.hideKeyboard(ctx);
                  },
                  child: ListView(
                    children: <Widget>[
                      DecontaminationItems(
                          model: decontamintaionDetectStyles[0],
                          value: decontamintaionVM.model.upn),
                      DecontaminationItems(
                          model: decontamintaionDetectStyles[1],
                          value: decontamintaionVM.model.description),
                      DecontaminationItems(
                          model: decontamintaionDetectStyles[2],
                          value: decontamintaionVM.model.serial),
                      Container(
                        height: 150,
                        padding: EdgeInsets.fromLTRB(90, 70, 90, 30),
                        color: Colors.white,
                        child: RaisedButton(
                                color: appThemColor,
                                child: Text('検索', style: appButtonThemColor),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(22)),
                                onPressed: () {

                                  context.read<DecontamintaionViewModel>().clear();
                                  // if(context.read<DecontamintaionViewModel>().check() == false){
                                  //   Get.to(DecontaminationUpdatePage());
                                  // }
                                  Get.to(DecontaminationUpdatePage());
                                },
                              ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
