
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/Config/Routes/RoutesManage.dart';

class NotebookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: Text("记事本"),
        ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/welcome.png', height: 90),
              Text(
                'GetX Delivery',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              CustomFlatButton(
                  child: Text('Translation'),
                  onPressed: () {
                    Get.toNamed(Routes.Translation);
                  }),
              SizedBox(
                height: 10,
              ),
              CustomFlatButton(
                  child: Text('Notebook'),
                  onPressed: () {
                    Get.toNamed(Routes.Notebook);
                  }),
            ],
          )),
      // backgroundColor: bgColor,
    );
  }
}


class CustomFlatButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  const CustomFlatButton({
    Key key,
    @required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: FlatButton(
        disabledTextColor: Colors.white,
        disabledColor: Get.theme.primaryColor.withAlpha(180),
        onPressed: onPressed,
        child: child,
        textColor: Colors.white,
        color: Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}