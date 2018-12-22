import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toly/helper/layout_utils.dart';

var line1_4 = Row(
  children: <Widget>[
    Image.asset("images/icon_90.png", width: 20, height: 20),
    Expanded(
      child: pd(Text("张风捷特烈"), l: 5),
    ),
    Text(
      "Flutter/Dart",
      style: infoStyle,
    )
  ],
);

var center_right = Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Text(
      "Flutter第4天--基础控件(下)+Flex布局详解",
      style: littelStyle,
      maxLines: 2,
    ),
    pd(
        Text(
          "1.2：优雅地查看：图片的适应模式--BoxFit1.3：优雅地查看：颜色混合模式--colorBlendMode",
          style: infoStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        t: 5),
  ],
);

//中间的信息
var center4 = Row(
  children: <Widget>[
    Expanded(child: pda(center_right, 5)),
    Image.asset(
      "images/wy_300x200.jpg",
      width: 80,
      height: 80,
      fit: BoxFit.fitHeight,
    )
  ],
);

var end4 = Row(
  children: <Widget>[
    Icon(
      Icons.grade,
      color: Colors.green,
      size: 20,
    ),
    Text(
      "1000W",
      style: infoStyle,
    ),
    pd(Icon(Icons.tag_faces, color: Colors.lightBlueAccent, size: 20),
        l: 15, r: 5),
    Text("2000W", style: infoStyle),
  ],
);

var item4 = Column(
  children: <Widget>[line1_4, Expanded(child: center4), end4],
);

var test4 = Card(
    child: Container(
        height: 160,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: item4));

///////////////////////////////////////////////////////////////////
var box = Center(
    child: Container(
  width: 100,
  height: 100,
  color: Colors.lightBlueAccent,
));

var ctrl_test = GestureDetector(
  child: box,
  onTap: () {
    print("onTap");
  },
  onTapDown: (d) {
    print("onPanDown" + d.globalPosition.toString());
  },
  onTapUp: (d) {
    print("onTapUp" + d.globalPosition.toString());
  },
  onTapCancel: () {
    print("onTapUp");
  },
);

var ctrl_test2 = GestureDetector(
    child: box,
    onDoubleTap: () {
      print("onDoubleTap");
    },
    onLongPress: () {
      print("onLongPress");
    },
    onLongPressUp: () {
      print("onLongPressUp");
    });

var ctrl_test3 = GestureDetector(
    child: box,
    onVerticalDragDown: (d) {
      print("onVerticalDragDown---" + d.globalPosition.toString());
    },
    onVerticalDragStart: (d) {
      print("onVerticalDragStart---" + d.globalPosition.toString());
    },
    onVerticalDragUpdate: (d) {
      print("onVerticalDragUpdate---" + d.globalPosition.toString());
    },
    onVerticalDragCancel: () {
      print("onVerticalDragCancel---");
    });
