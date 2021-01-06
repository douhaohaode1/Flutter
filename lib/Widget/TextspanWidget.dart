import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Widget/CommonUtils.dart';
//import 'package:vector_math/vector_math_64.dart';
//part of vector_math_64;



class TextspanWidget extends StatefulWidget{

  @override
  _TextspanWidgetState   createState() => _TextspanWidgetState();
}

class _TextspanWidgetState extends State< StatefulWidget> {

  @override
  void dispose() {
    children..clear();
    super.dispose();
  }

  final String dataStr = 'A golden full moon hung in the deep blue sky,A golden full moon hung in the deep blue sky,A golden full moon hung in the deep blue sky,A golden full moon hung in the deep blue sky,A golden full moon hung in the deep blue sky, Na Yun twisted his body and escaped from under his crotch.';

   List<InlineSpan> children = [];

   double dx = 0.0;
   double dy = 0.0;

  @override
  Widget build(BuildContext context) {

     List<String> list = dataStr.split(' ',);

     for( var i = 0 ; i < list.length ; i++ ) {
       children.add(TextSpan(text: list[i]+ ' ' ,
                    style: TextStyle(fontSize: 21, color: Colors.blueAccent,
                    backgroundColor: Colors.white),
                    recognizer: TapGestureRecognizer()
                              ..onTapDown = (TapDownDetails details) {
                                dx = details.localPosition.dx;
                                dy = details.localPosition.dy;
                              }
                              ..onTap = () {
                                var  size = Size(20, 20);
                                CommonUtils.showChooseDialog(context, size, dx , dy);
                              },),
                  );
       if (i == list.length - 1){
         children.add(TextSpan(text:'  '));
       }
   }

   return Scaffold(

      appBar: AppBar(
        title: Text('Textspan'),
      ),
      body:  Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        //height: 800,
        //width: 375,
        color: Colors.white,
        child: Text.rich(
            TextSpan(
                text: "This is title\n\n",
                style: TextStyle(fontSize: 21, color: Colors.deepOrangeAccent,
                    backgroundColor: Colors.white),
                children: children
          ),

        ),

      ),
    );
  }


}



