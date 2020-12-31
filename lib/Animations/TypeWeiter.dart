import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class  TypeWeiter extends  StatelessWidget{


  Widget build(BuildContext context) {

    return ExamplePage(
      title: "Typewriter Box",
      pathToFile: "typewriter_box.dart",
      delayStartup: true,
      builder: (context) => Center(child: Box()),
    );
  }
}

class Box extends  StatelessWidget{

  static final boxDecoration = BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 5,
            offset: Offset(0, 8),
            spreadRadius: 2)
      ]);


  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      duration: 400.milliseconds,
      tween: 0.0.tweenTo(80.0),
      builder: (context, child, height) {

        return PlayAnimation<double>(
          duration: 1200.milliseconds,
          delay: 500.milliseconds,
          tween: 2.0.tweenTo(300.0),
          builder: (context, child, width) {
            return Container(
              decoration: boxDecoration,
              width: width,
              height: height,
              child: isEnoughRoomForTypewriter(width)
                  ? TypewriterText("我们都要好好的")
                  : Container(),
            );
          },
        );
      },
    );

  }
  bool isEnoughRoomForTypewriter(double width) => width > 20;

}

class TypewriterText extends StatelessWidget {

  static const TEXT_STYLE =
  TextStyle(letterSpacing: 5, fontSize: 20, fontWeight: FontWeight.w300);

  final String text;
  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {

     return PlayAnimation<int>(
        duration: 1200.milliseconds,  //文字等待出现时间
        delay: 500.milliseconds, //文字出现后 显示完整公用时间
        tween: 0.tweenTo(text.length),
        builder: (context, child, textLength) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.substring(0, textLength), style: TEXT_STYLE),
              _blinkingCursor()
            ],
          );
        });
  }

  Widget _blinkingCursor() {
    return LoopAnimation<int>(
      duration: 600.milliseconds,
      tween: 0.tweenTo(1),
      builder: (context, child, oneOrZero) {
        return Opacity(
            opacity: oneOrZero == 1 ? 1.0 : 0.0,
            child: Text("_", style: TEXT_STYLE));
      },
    );
  }
}


class ExamplePage extends StatefulWidget {
  final String title;
  final String pathToFile;
  final WidgetBuilder builder;
  final bool delayStartup;

  ExamplePage(
      {this.title, this.pathToFile, this.builder, this.delayStartup = false})
      : assert(!pathToFile.contains("-"),
  "Don't use minus character in filenames.");

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  var renderBuilder = true;

  @override
  void initState() {
    if (widget.delayStartup) {
      renderBuilder = false;
      Future.delayed(Duration(milliseconds: 500)).then((_) {
        setState(() => renderBuilder = true);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: _buildPage(context)),
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Text(widget.title),
      actions: <Widget>[_reloadExampleButton(), _moreMenu()],
    );
  }

  PopupMenuButton _moreMenu() {
    return PopupMenuButton<_MoreMenuResult>(
      onSelected: (itemClicked) {
        if (itemClicked == _MoreMenuResult.SHOW_SOURCE_CODE) {
          _openSource();
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: _MoreMenuResult.SHOW_SOURCE_CODE,
            child: Text("View source code"),
          )
        ];
      },
    );
  }

  IconButton _reloadExampleButton() {
    return IconButton(
      onPressed: () => setState(() {
        renderBuilder = false;
        Future.delayed(Duration(milliseconds: 200)).then((_) {
          setState(() => renderBuilder = true);
        });
      }),
      icon: Icon(
        Icons.refresh,
        color: Colors.white,
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    if (!renderBuilder) {
      return Container();
    }
    return this.widget.builder(context);
  }

  _openSource() async {
    final url =
        "https://github.com/felixblaschke/simple_animations/tree/master/example/lib/examples/${widget.pathToFile}";
    //if (await canLaunch(url)) {
   //   await launch(url);
   // }
  }
}

enum _MoreMenuResult { SHOW_SOURCE_CODE }
