import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/Http/ServiceImp.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'decontamination_public.dart';
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
  @override
  Widget build(BuildContext context) {
    Loading.hideLoading(context);

     //var json=  ServiceImpl.getInstance().getDecontaminationEnum();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Image.asset(
                "images/bsj_logo.png",
                color: AppColors.mainColor,
                fit: BoxFit.cover,
                width:CommonUtils.getScreenSize(context).width / 3,
            ),
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.only(left: 5, right: 15 ,top: 0,bottom: 10),
          icon: Icon(
            Icons.menu_outlined,
            color: AppColors.black3,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
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
                return ListView(
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
                      height: 200,
                      padding: EdgeInsets.fromLTRB(120, 80, 120, 80),
                      color: Colors.white,
                      child: RaisedButton(
                        color: AppColors.mainColor,
                        child: Text('検索', style: AppTextStyle.appButtonThemColor),
                        shape: RoundedRectangleBorder(
                            //side: BorderSide(
                             // color: Colors.white,
                              //width: 1,
                            //),
                            borderRadius: BorderRadius.circular(22)),
                        onPressed: () {

                          var future = context.read<DecontamintaionViewModel>().check(context);
                          future.then((bool value) {
                            debugPrint("true--------${value}");
                            if (value == true) {
                              Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) =>
                                         DecontaminationUpdatePage())); }
                          }).catchError((error) {
                             debugPrint(error);
                          }).whenComplete(() {
                             debugPrint("Execution complete");
                            //Loading.hideLoading(context);
                          });
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
