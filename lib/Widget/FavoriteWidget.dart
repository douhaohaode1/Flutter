import 'package:flutter/material.dart';

///收藏按钮组件
class FavoriteWidget extends StatefulWidget {
  ///是否收藏了
  final bool isFavorite;
  ///id标记
  final int id;
  ///回调
  final ValueChanged<bool> onChanged;

  const FavoriteWidget( {
    Key key, this.isFavorite = false, this.id ,this.onChanged
  }) : super(key: key);

  @override
  _FavoriteWidget createState() => _FavoriteWidget();
}

class _FavoriteWidget extends State<FavoriteWidget> {

  bool curIsFavorite ;
  ValueChanged<bool> Changed;
  int row ;

  @override
  void initState() {
    super.initState();

    curIsFavorite = widget.isFavorite;
    Changed = widget.onChanged;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        curIsFavorite ? Icons.favorite : Icons.favorite_border,
        color: curIsFavorite ? Colors.red : null,),
      onPressed: (){

        setState(() {
          curIsFavorite = !curIsFavorite;
          Changed(curIsFavorite);

          // if(curIsFavorite){
          //发送收藏网络请求
          // }else{
          // 发送取消网络请求
          //   }
        });
      },
    );
  }
}