
import 'package:flutter/material.dart';



class MeHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Container(
      height: 185,
      padding: EdgeInsets.fromLTRB(20, 30, 15, 15),

      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                // backgroundImage: user != null ? CachedNetworkImageProvider(user) : AssetImage('images/placeholder_avatar.png'),
                backgroundImage:  AssetImage('images/placeholder_avatar.png'),
              ),
              SizedBox(width: 25),
              Text('请先登录 >',style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 10),
          buildItems(),
        ],
      ),
    );
  }

  Widget buildItems() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, //平均分配
      children: <Widget>[
        buildItem( '0.0', '动态'),
        buildItem( '0.0', '关注'),
        buildItem('0.0', '粉丝'),
        buildItem('0.0', '积分'),
      ],
    );
  }

  Widget buildItem(String title, String subtitle) {
    return Column(
     // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign : TextAlign.center ,
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(fontSize: 15, color: Colors.green,),
          textAlign : TextAlign.center,
        ),
      ],
    );
  }
}