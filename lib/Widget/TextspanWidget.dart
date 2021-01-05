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
    tapGestureRecognizer.dispose();
    super.dispose();
  }

   String dataStr = '  A golden full moon hung in the deep blue sky, and underneath was the sandy land bai by the sea, all growing endless green watermelons. In the meantime, 1 there was an eleven or twelve-year-old boy with a silver ring on his neck and a steel fork in his hand, piercing a Piyan 2 as hard as he could. Na Yun twisted his body and escaped from under his crotch.';

   List<InlineSpan> children = [];

   List<InlineSpan> children1 = [];

   TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();


   // void _onAfterRendering(Duration timeStamp) {
   //
   //   RenderObject renderObject = context.findRenderObject().getTransformTo(null)?.getTranslation();
   //
   //   Size size = renderObject.paintBounds.size;
   //
   //   var vector3 = renderObject.getTransformTo(null)?.getTranslation();
   //   //  print(size);
   //  // print(vector3);
   //    CommonUtils.showChooseDialog(context, size, vector3);
   // }


   @override
  Widget build(BuildContext context) {


   List<String> list = dataStr.split(' ',);


     for( var i = 0 ; i < list.length ; i++ ) {

     children.add( TextSpan(text: list[i]+ ' ' ,style: TextStyle(fontSize: 17, color: Colors.blueAccent ,backgroundColor: Colors.deepOrange),
       recognizer: tapGestureRecognizer
         ..onTapDown = (TapDownDetails details) {

            // print(details.globalPosition);
            // print(details.localPosition);
            // print('-----------------------');
            // print(list[i]);
             var  size = Size(24, 24);
            CommonUtils.showChooseDialog(context, size, details.localPosition.dx , details.localPosition.dy - 80);

         },
      ),
     );
   }


   // List<String> list1 = dataStr.split(',',);
   //
   // for( var i = 0 ; i < list1.length ; i++ ) {
   //
   //   children1.add(TextSpan(text: list1[i]+ '\n' ,style: TextStyle(fontSize: 17, color: Colors.blueAccent),
   //     recognizer: tapGestureRecognizer
   //       ..onTap = () {
   //         //debugPrint("${i++}");
   //         print(list1[i]);
   //       },
   //      )
   //   );
   // }


   return Scaffold(
      appBar: AppBar(
        title: Text('Textspan'),
      ),
      body:  Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        height: 800,
        width: 375,
        color: Colors.white,
        child: Text.rich(
            TextSpan(
            children:
                 children
            //    [
            //     TextSpan(
            //       text: "hello ",
            //       style: TextStyle(fontSize: 15, color: Colors.blueAccent),
            //     ),
            //
            //   TextSpan(
            //     text: "world ",
            //     style: TextStyle(fontSize: 15, color: Colors.blueAccent),
            //     // 设置点击事件
            //     recognizer: TapGestureRecognizer()
            //       ..onTap = () {
            //         //debugPrint("${i++}");
            //         print('1111');
            //       },
            //   ),
            //   WidgetSpan(
            //     alignment: PlaceholderAlignment.middle,
            //     child: Container(
            //       width: 20,
            //       height: 20,
            //       child : Text('1111'),
            //     ),
            //   ),
            // ],
          ),

        ),

      ),
    );
  }
}



