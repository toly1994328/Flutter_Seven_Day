import 'package:flutter/material.dart';
import 'package:toly/helper/layout_utils.dart';

////////////////////////-----------------测试1--------------------------------
var rowLine = Row(
  children: <Widget>[
    Icon(
      Icons.extension,
      color: Colors.blue,
    ),
    Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        "好友微视",
        style: TextStyle(fontSize: 18),
      ),
    )),
    Icon(Icons.arrow_forward)
  ],
);

var test1 =
    Container(color: Colors.white, padding: EdgeInsets.all(15), child: rowLine);

////////////////////////-----------------测试2--------------------------------

//左边头像
var headImg = Image.asset(
  "images/icon_gql.jpg",
  width: 45,
  height: 45,
);

//中间的信息
var center2 = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text(
      "心如止水",
      style: commonStyle,
    ),
    Text(
      "《应龙》--张风捷特烈 一游小池两岁月，洗却凡世几闲尘。时逢雷霆风会雨，应乘扶摇化入云。",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: infoStyle,
      textAlign: TextAlign.start,
    )
  ],
);

//尾部的时间+图标
var end2 = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text(
      "06:45",
      style: infoStyle,
    ),
    Icon(
      Icons.visibility_off,
      size: 20,
      color: Color(0xff999999),
    )
  ],
);
//

var rowLine2 = Row(
  children: <Widget>[
    Padding(
      child: headImg,
      padding: EdgeInsets.all(5),
    ),
    Expanded(child: Padding(padding: EdgeInsets.all(5), child: center2)),
    end2
  ],
);

var test2 = Container(
    height: 70,
    color: Colors.white,
    padding: EdgeInsets.all(5),
    child: rowLine2);

////////////////////////-----------------测试3--------------------------------
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

//尾部的
var end3 = Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: <Widget>[
    Row(
      children: <Widget>[
        Icon(
          Icons.language,
          size: 15,
        ),
        Icon(Icons.local_pharmacy, size: 15),
        Icon(Icons.person_pin_circle, size: 15)
      ],
    ),
    bg(
        pdhv(
            Text(
              "编辑",
              style: btnStyle,
            ),
            h: 10,
            v: 3),
        Colors.blueAccent),
  ],
);
//

var rowLine3 = Row(
  children: <Widget>[
    pda(headImg3, 5),
    Expanded(child: pda(center3, 5)),
    pda(end3, 10),
  ],
);

var test3 = Card(
    child: Container(
        height: 95,
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: rowLine3));

////////////////////////-----------------测试4--------------------------------
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

//--------------------------------------------------------------------------
//竖直

var test5 = ListView.builder(
  itemCount: 30,
  itemBuilder: (context, index) {
    return Column(
      children: <Widget>[test4],
    );
  },
);

var test6 = ListView.separated(
    itemBuilder: (ctx, i) {
      return Column(
        children: <Widget>[test4],
      );
    },
    separatorBuilder: (ctx, i) {
      return Column(
        children: <Widget>[(i + 1) % 2 == 0 ? test2 : Container()],
      );
    },
    itemCount: 5);
