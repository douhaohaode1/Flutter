import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'decontamination_public.dart';
import 'decontamination_widget.dart';
import 'decontamintaion_model.dart';
import 'decontamintaion_view_model.dart';

class DecontaminationUpdatePage extends StatefulWidget {
  @override
  _DecontaminationUpdatePageState createState() =>
      _DecontaminationUpdatePageState();
}
class _DecontaminationUpdatePageState extends State<DecontaminationUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Image.asset(
              "images/bsj_logo.png",
              color: AppColors.mainColor,
              fit: BoxFit.cover,
              width:CommonUtils.getScreenSize(context).width / 3,
            ),
            leading: Text(''),
            centerTitle: true,
          ),
          body: GestureDetector(
            onPanDown: (DragDownDetails details) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Consumer<DecontamintaionViewModel>(
                      builder: (ctx, decontamintaionVM, child) {
                        return ListView(
                          children: [
                            DecontaminationItems(
                              model: decontamintaionUpateStyles[0],
                              value: decontamintaionVM.model.upn,
                            ),
                            DecontaminationItems(
                              model: decontamintaionUpateStyles[1],
                              value: decontamintaionVM.model.description,
                            ),
                            DecontaminationItems(
                              model: decontamintaionUpateStyles[2],
                              value: decontamintaionVM.model.serial,
                            ),
                            DecontaminationItems(
                              model: decontamintaionUpateStyles[3],
                              value: decontamintaionVM.model.unitTypeCode,
                            ),
                            DecontaminationItems(
                              model: decontamintaionUpateStyles[4],
                              value: decontamintaionVM.model.statusCode,
                            ),
                            DecontaminationItems(
                              model: decontamintaionUpateStyles[5],
                              value: decontamintaionVM.model.reasonCode,
                            ),
                            DecontaminationItems(
                              model: decontamintaionUpateStyles[6],
                              value: decontamintaionVM.model.comment,
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                              child: bottom(),
                            ),
                          ],
                          // ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            //bodyListView(context),
          ),
        ),
        onWillPop: _requestPop);
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }
  Future<bool> _requestPop() {
    return new Future.value(true);
  }

  Widget bottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          /// infinite width, consistent with the parent control
          width: (MediaQuery.of(context).size.width) / 3,
          height: 31,
          child: RaisedButton(
            child: Text('戻る', style: AppTextStyle.appButtonTextColor),
            color: appThemBackgroupColor,
            shape: RoundedRectangleBorder(
                // side: BorderSide(
                //   color: Colors.white,
                //   width: 1,
                // ),
                borderRadius: BorderRadius.circular(22)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width) / 3,
          height: 31,
          child: Consumer<DecontamintaionViewModel>(
            builder: (ctx, decontamintaionVM, child) {
              return RaisedButton(
                color: AppColors.mainColor,
                child: Text('更新', style: AppTextStyle.appButtonThemColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                onPressed: () {
                  debugPrint('UPN---${decontamintaionVM.model.upn}');
                  debugPrint('serial---${decontamintaionVM.model.serial}');
                  debugPrint('unitTypeCode---${decontamintaionVM.model.unitTypeCode}');
                  debugPrint('statusCode---${decontamintaionVM.model.statusCode}');
                  debugPrint('reasonCode---${decontamintaionVM.model.reasonCode}');
                  debugPrint('commit---${decontamintaionVM.model.comment}');
                  var future = decontamintaionVM.update(context);
                  future.then((bool value) {
                    print("true--------${value}");
                    if (value == true) {
                      Navigator.pop(context);
                    }
                  }).catchError((error) {
                    print(error);
                  }).whenComplete(() {
                    print("执行完成");
                  });
                },
              );
            },
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
