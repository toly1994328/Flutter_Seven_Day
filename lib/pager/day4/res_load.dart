import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toly/helper/color_utils.dart';
import 'package:toly/pager/day4/item.dart';

var img_test = Image(
  image: AssetImage("images/icon_90.png"),
  width: 200,
  height: 100,
  color: Colors.tealAccent,
);

var img_test1 = Image.asset(
  "images/icon_90.png",
  width: 80.0,
);

var fitMode = [
  BoxFit.none,
  BoxFit.contain,
  BoxFit.cover,
  BoxFit.fill,
  BoxFit.fitHeight,
  BoxFit.fitWidth,
  BoxFit.scaleDown
];

//循环生成Image控件
formImgs() {
  var imgLi = <Widget>[];
  fitMode.forEach((fit) {
    imgLi.add(Container(
        width: 100,
        height: 50,
        color: randomRGB(),
        child: Image(
          image: AssetImage("images/wy_200x300.jpg"),
          fit: fit,
        )));
  });
  return imgLi;
}

//叠合模式数组
var colorBlendMode = [
  BlendMode.clear,
  BlendMode.src,
  BlendMode.dst,
  BlendMode.srcOver,
  BlendMode.dstOver,
  BlendMode.srcIn,
  BlendMode.dstIn,
  BlendMode.srcOut,
  BlendMode.dstOut,
  BlendMode.srcATop,
  BlendMode.dstATop,
  BlendMode.xor,
  BlendMode.plus,
  BlendMode.modulate,
  BlendMode.screen,
  BlendMode.overlay,
  BlendMode.darken,
  BlendMode.lighten,
  BlendMode.colorDodge,
  BlendMode.colorBurn,
  BlendMode.hardLight,
  BlendMode.softLight,
  BlendMode.difference,
  BlendMode.exclusion,
  BlendMode.multiply,
  BlendMode.hue,
  BlendMode.saturation,
  BlendMode.color,
  BlendMode.luminosity,
];

//循环生成Image控件
formImgsColorBlendMode() {
  var imgLi = <Widget>[];
  colorBlendMode.forEach((mode) {
    imgLi.add(Column(children: <Widget>[
      Padding(
        child: Image(
          width: 60,
          height: 60,
          image: AssetImage("images/icon_90.png"),
          color: Colors.red,
          colorBlendMode: mode,
        ),
        padding: EdgeInsets.all(5),
      ),
      Text(mode.toString().split(".")[1])
    ]));
  });
  return imgLi;
}

//var img_test2=Image.file(Uri.file(path));

var imgUrl =
    "https://upload.jianshu.io/users/upload_avatars/9414344/ed80c0a8-3997-4482-b80e-7c231f3c51bb.png?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240";

var img_test3 = Image.network(imgUrl, width: 100);

var imgBox = Wrap(
  children: formImgsColorBlendMode(),
);

var iconBtn = IconButton(
  padding: EdgeInsets.only(),
  onPressed: () {
    print("clicked");
  },
  icon: Icon(Icons.android, size: 40, color: Colors.deepPurpleAccent),
  tooltip: "android",
  highlightColor: Colors.red,
  //点击时间稍长的时候背景渐变到这个颜色
  splashColor: Colors.blue,
  //点击时一闪而过的颜色
  disabledColor: Colors.blueGrey,
);

var btnBar = ButtonBar(
  alignment: MainAxisAlignment.center,
  children: <Widget>[iconBtn, iconBtn, iconBtn, iconBtn],
);
var raisedButton = RaisedButton(
  onPressed: () {},
  child: Text("Toly"),
  color: Color(0xffF88B0A),
  highlightColor: Colors.blue,
);

var flatButton = FlatButton(
  onPressed: () {},
  child: Text("Toly"),
  color: Color(0xffF88B0A),
  highlightColor: Colors.blue,
  textColor: Color(0xffFfffff),
);

var outLineButton = OutlineButton(
  onPressed: () {},
  child: Text("Toly"),
  color: Color(0xffF88B0A),
  highlightColor: Colors.blue,
  textColor: Color(0xff000000),
  borderSide: BorderSide(color: Color(0xff0A66F8), width: 2),
);

//---------------------------BottomNavigationBar--------------------------------
var iconInfoMap = {
  "首页": Icon(Icons.home),
  "消息": Icon(Icons.comment),
  "动态": Icon(Icons.toys),
  "联系人": Icon(Icons.contacts),
};

var bottomNavigationBar = BottomNavigationBar(
  items: () {
    var items = <BottomNavigationBarItem>[];
    iconInfoMap.forEach((k, v) {
      items.add(BottomNavigationBarItem(
          title: Text(k), icon: v, backgroundColor: Color(0xff49B1FB)));
    });
    return items;
  }(),
  currentIndex: 1,
  onTap: (position) {
    print(position);
  },
);
//-----------------------------------------------------------

//---------------------------TabBar+tabBarView--------------------------------
var chartLi = ["About", "Ball", "Card", "Dog"];

var tabBarView = new TabBarView(
  children: chartLi.map((text) {
    return Center(
        child: Text(
      text,
      style: TextStyle(fontSize: 20),
    ));
  }).toList(),
);

var tabBar = TabBar(
  labelStyle: TextStyle(fontSize: 20),
  labelColor: Color(0xffF64C19),
  unselectedLabelColor: Colors.white,
  tabs: chartLi.map((item) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text(item),
      height: 40,
    );
  }).toList(),
);

//---------------Drawer------------
var draw = Drawer(
    elevation: 5,
    child: Container(
      alignment: AlignmentDirectional.center,
      color: Color(0xff99C6F9),
      child: Text(
        "张风捷特烈",
        style: TextStyle(fontSize: 30),
      ),
    ));

//-----------------SnackBar-----------
var snackBar = SnackBar(
    backgroundColor: Color(0xffFB6431),
    content: Text('Hello!'),
    duration: Duration(seconds: 1),
    action: SnackBarAction(
        label: '确定',
        onPressed: () {
          print("张风捷特烈");
        }));

//-----------------BottomSheet-----------
var bottomSheet = BottomSheet(
    onClosing: () {},
    builder: (context) => (Container(
        color: Color(0xffABF5E0),
        child: Wrap(
          children: <Widget>[
            Center(child: Text('绝域从军计惘然，')),
            Center(child: Text('东南幽恨满词笺。')),
            Center(child: Text('一箫一剑平生意，')),
            Center(child: Text('负尽狂名十五年。')),
          ],
        ))));

//-----------------控制控件-------------

var textField = TextField(
  keyboardType: TextInputType.number,
  textAlign: TextAlign.center,
  maxLines: 1,
  cursorColor: Colors.black,
  cursorWidth: 10,
  style: TextStyle(fontSize: 20, color: Colors.lightBlue),
  onChanged: (str) {
    print(str);
  },
  onEditingComplete: () {
    print("onEditingComplete");
  },
  onSubmitted: (str) {
    print("onSubmitted:" + str);
  },
  onTap: () {
    print("onTap");
  },
);

var checkbox = Checkbox(
  value: true,
  activeColor: Colors.blue,
  onChanged: (value) {
    print(value);
  },
);
var slider = Slider(
  min: 100,
  max: 200,
  value: 180,
  activeColor: Colors.green,
  inactiveColor: Colors.grey,
  onChanged: (value) {
    print(value);
  },
  onChangeStart: (v) {},
  onChangeEnd: (v) {},
);
var switch_ = Switch(
  value: true,
  activeColor: Colors.greenAccent,
  activeTrackColor: Colors.black,
  activeThumbImage: AssetImage("images/icon_90.png"),
  onChanged: (bool value) {
    print(value);
  },
);

var numLi = [1, 2, 3, 4, 5, 6, 7];
var radios = Wrap(
    children: numLi.map((i) {
  return Radio<int>(
    value: i,
    groupValue: 5,
    onChanged: (int value) {},
  );
}).toList());

var chip = Chip(
  backgroundColor: Color(0xffE5E5E5),
  padding: EdgeInsets.all(3),
  avatar: CircleAvatar(
      backgroundColor: Colors.lightBlue.shade400,
      child: new Text(
        'Toly',
        style: TextStyle(fontSize: 10.0, color: Colors.white),
      )),
  label: Text('张风捷特烈'),
);

var contrl_widgit = Wrap(
  children: <Widget>[
    textField, checkbox, slider, chip, switch_, radios,juejin_item
//    Center(child: Text('东南幽恨满词笺。')),
//    Center(child: Text('一箫一剑平生意，')),
//    Center(child: Text('负尽狂名十五年。')),
  ],
);
