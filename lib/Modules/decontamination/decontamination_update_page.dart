import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'decontamination_widget.dart';
import 'decontamintaion_model.dart';
import 'decontamintaion_view_model.dart';

class DecontaminationUpdatePage extends StatefulWidget {
  @override
  _DecontaminationUpdatePageState createState() =>
      _DecontaminationUpdatePageState();
}

class _DecontaminationUpdatePageState extends State<DecontaminationUpdatePage> {
  static const Color appThemColor = Color(0xff113a70);
  static const TextStyle appButtonThemColor =
      TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold);
  static const TextStyle appButtonTextColor =
  TextStyle(color: appThemColor, fontSize: 19, fontWeight: FontWeight.bold);
  static const Color appThemBackgroupColor = Color(0xffE4EFF7);
  static const TextStyle appBarThemTextStyle = TextStyle(color: appBarThemTextColor, fontSize: 19, fontWeight: FontWeight.bold);
  static const Color appBarThemTextColor = Color(0xff000A46);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Boston\nScientific",
                style: appBarThemTextStyle,
                textAlign: TextAlign.center),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Consumer<DecontamintaionViewModel>(
                    builder: (ctx, decontamintaionVM, child) {
                      return GestureDetector(
                        onPanDown: (DragDownDetails details) {
                          decontamintaionVM.hideKeyboard(ctx);
                        },
                        child: ListView(
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
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: bottom(),
                ),
              ],
            ),
          ),
          //bodyListView(context),
        ),
        onWillPop: _requestPop);
  }

  Future<bool> _requestPop() {
    return new Future.value(true);
  }

  Widget bottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //verticalDirection: VerticalDirection.down,
      children: <Widget>[
        SizedBox(
          /// infinite width, consistent with the parent control
          width: (MediaQuery.of(context).size.width ) / 2.5,
          height: 44,
          child: RaisedButton(
            child: Text('戻る', style: appButtonTextColor),
            color: appThemBackgroupColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(22)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width ) / 2.5,
          height: 44,
          child: Consumer<DecontamintaionViewModel>(
            builder: (ctx, decontamintaionVM, child) {
              return RaisedButton(
                color: appThemColor,
                child: Text('更新', style: appButtonThemColor),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(22)),
                onPressed: () {
                  debugPrint(
                      'UPN---${decontamintaionVM.model.upn}');
                  debugPrint(
                      'serial---${decontamintaionVM.model.serial}');
                  debugPrint(
                      'unitTypeCode---${decontamintaionVM.model.unitTypeCode}');
                  debugPrint(
                      'statusCode---${decontamintaionVM.model.statusCode}');
                  debugPrint(
                      'reasonCode---${decontamintaionVM.model.reasonCode}');
                  debugPrint('commit---${decontamintaionVM.model.comment}');
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
    // DecontamintaionModle modle = Provider.of<DecontamintaionViewModel>(context).model;
    super.dispose();
  }
}
