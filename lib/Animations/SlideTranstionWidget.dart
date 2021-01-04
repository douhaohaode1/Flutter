
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class SlideTranstionWidget extends StatefulWidget{


  @override
  _SlideTranstionWidgetState   createState() => _SlideTranstionWidgetState();
}


class _SlideTranstionWidgetState extends State< SlideTranstionWidget> with SingleTickerProviderStateMixin{

  //动画控制器

  AnimationController controller;

  Animation<Offset> letftAnimation,rightAnimation;

  bool isPositive = true;

  @override
  initState() {

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    letftAnimation = Tween(begin: Offset.zero, end: Offset(2.1, 0)).animate(controller);
    rightAnimation = Tween(begin: Offset.zero, end: Offset(-2.1, 0)).animate(controller);
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Moving Animation'),
       ),
       body:  Container(
         padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
         height: 100,
         color: Colors.white,
         child:  Row(
          mainAxisAlignment: MainAxisAlignment.center, //平均分配
           children: <Widget>[
             SlideTransition(
                 position: letftAnimation,
                  child: Container(
                       width: 80,
                       height: 40,
                   //color: Colors.grey,
                    child: DropdownButton(
                      underline: Container(height: 0),
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down,color: Colors.green,),
                      iconSize: 35,
                      items: [ DropdownMenuItem(child:Text('中文',style: TextStyle(color: Colors.black, fontSize: 19),),),
                               DropdownMenuItem(child: Text('英文',style: TextStyle(color: Colors.black, fontSize: 19),)),
                               DropdownMenuItem(child: Text('日文',style: TextStyle(color: Colors.black, fontSize: 19),)),
                               DropdownMenuItem(child: Text('韩文',style: TextStyle(color: Colors.black, fontSize: 19),)),
                               DropdownMenuItem(child: Text('俄文',style: TextStyle(color: Colors.black, fontSize: 19),)),],
                      onChanged: (value){
                         print(value);
                      },

                    ),
                ),
             ),
             SizedBox(width: 20),

             Container(
               width: 50,
               height: 40,
               //color: Colors.red,
               child: IconButton(
                      padding: EdgeInsets.only(left: 0, right: 0 ,top: 0,bottom: 0),
                       iconSize: 30,
                       icon: getImage('images/change.png'),
                        onPressed: (){

                        isPositive == true ? controller.forward() : controller.reverse();
                        isPositive = !isPositive;
                        print("1111");
                      }
                    ),
             ),
            SizedBox(width: 20),
             SlideTransition(
               position: rightAnimation,
               child: Container(
                 width: 80,
                 height: 40,
               //  color: Colors.blueAccent,
                 child: DropdownButton(

                        icon: Icon(Icons.arrow_drop_down,color: Colors.green,),
                         items: [DropdownMenuItem(child: Text('中文')),
                                 DropdownMenuItem(child: Text('英文')),
                                 DropdownMenuItem(child: Text('日文')),
                                 DropdownMenuItem(child: Text('韩文')),],
                   onChanged: (value){
                      print(value);
                    },
                 )
               ),
             ),

           ],
         ),
       ),
     );
   }
  Widget getImage(String imagePath) {
    return new Image.asset(
      imagePath,
      width: 30,
      height: 30,
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
   // rightController.dispose();
    super.dispose();
  }

}
