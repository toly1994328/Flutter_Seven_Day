import 'package:flutter/material.dart';
import 'package:toly/helper/layout_utils.dart';

class LeftDrawPage extends StatefulWidget {
  @override
  _LeftDrawPageState createState() => _LeftDrawPageState();
}

class _LeftDrawPageState extends State<LeftDrawPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
//左边头像
    var headImg3 = Image.asset(
      "images/icon_90.png",
      width: 50,
      height: 50,
    );

//中间的信息
    var center3 = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "张风捷特烈",
          style: bigStyle,
        ),
        Row(
          children: <Widget>[
            Icon(Icons.next_week, size: 15),
            pd(Text("创世神 | 无"), l: 5)
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.keyboard, size: 15),
            pd(Text("海的彼岸有我未曾见证的风采"), l: 5)
          ],
        ),
      ],
    );

    var rowLine3 = Row(
      children: <Widget>[
        pda(headImg3, 5),
        Expanded(child: pda(center3, 5)),
      ],
    );

    var test3 = Card(
        child: Container(
            height: 95,
            color: Colors.white,
            padding: EdgeInsets.all(5),
            child: rowLine3));

    return Drawer(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.only(top: 50),
            alignment: AlignmentDirectional.topCenter,
            color: Color(0xff99C6F9),
            child: test3));
  }
}
