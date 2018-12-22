import 'dart:math';

import 'package:flutter/material.dart';

var six_card = Scaffold(
  appBar: AppBar(
      title: Text("张风捷特烈"),
      //标题
      backgroundColor: Color(0xffcbf231),
      //背景色
      elevation: 12,
      //阴影
      centerTitle: true,
      toolbarOpacity: .4), //透明度
  body: Text(
    "一箫一剑平生意，负尽狂名十五年",
    maxLines: 1,
    overflow: TextOverflow.fade,
    style: TextStyle(
        color: Colors.blue,
        fontSize: 20,
        letterSpacing: 10,
        fontWeight: FontWeight.bold,
        background: Paint()..color = Colors.amberAccent),
  ),
  floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.deepOrangeAccent,
    elevation: 12,
    highlightElevation: 24,
    onPressed: () {},
    tooltip: 'Increment',
    child:
        Icon(Icons.add, size: 40, color: Colors.white, semanticLabel: "toly"),
  ),
);

var row_test = Row(
  children: <Widget>[
    Expanded(
      child: Text('绝域从军计惘然，'),
    ),
    Expanded(
      child: Text('东南幽恨满词笺。'),
    ),
    Expanded(
      child: Text('一箫一剑平生意，'),
    ),
    Expanded(
      child: Text('负尽狂名十五年。'),
    ),
  ],
);

var column_test = Column(
  children: <Widget>[
    Text('绝域从军计惘然，,'),
    Text('东南幽恨满词笺。'),
    Text('一箫一剑平生意，'),
    Text('负尽狂名十五年。'),
  ],
);

formTextList(int count) {
  var random = new Random();
  var li = <Widget>[];

  for (int i = 0; i < count; i++) {
    li.add(new Baseline(
      baselineType: TextBaseline.alphabetic,
      child: new Text(
        'Toly',
        style: new TextStyle(
          fontSize: 20.0 + random.nextInt(40),
          textBaseline: TextBaseline.alphabetic,
        ),
      ),
      baseline: 80,
    ));
  }
  return li;
}

var base_line_test = new Row(
  children: formTextList(5),
);
var fsb_test = new Container(
  color: Color(0xff1ADEF6),
  height: 200.0,
  width: 200.0,
  padding: EdgeInsets.all(10),
  child: new FractionallySizedBox(
    alignment: Alignment.bottomCenter,
    widthFactor: 1.5,
    heightFactor: 0.5,
    child: new Container(
      color: Colors.red,
    ),
  ),
);

var container_test = Container(
  color: Color.fromARGB(100, 81, 211, 253),
  height: 100,
  width: 200,
  child: Text("张风捷特烈"),
  margin: EdgeInsets.fromLTRB(5, 10, 15, 20),
  padding: EdgeInsets.all(40),
);

var padding_test = Container(
  color: Color.fromARGB(100, 81, 211, 253),
  height: 150,
  width: 250,
  child: Padding(
    padding: EdgeInsets.all(10),
    child: Text("张风捷特烈"),
  ),
);

var center_test = Container(
  color: Color.fromARGB(100, 81, 211, 253),
  height: 150,
  width: 250,
  child: Center(
    child: Text("张风捷特烈"),
  ),
);

var stack_test = Container(
    color: Color.fromARGB(100, 81, 211, 253),
    height: 150,
    width: 250,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Text('绝域从军计惘然，,'),
        Align(
          alignment: Alignment.topRight,
          widthFactor: 1.5,
          child: Card(
              elevation: 10, color: Color(0xffffffff), child: Text('东南幽恨满词笺。')),
        ),
        Text('一箫一剑平生意，'),
        Text('负尽狂名十五年。'),
      ],
    ));

var index_stack_test = Transform(
    origin: Offset(0, 150),
    transform: Matrix4.rotationZ(3.1415 / 4),
    child: Container(
        color: Color.fromARGB(100, 81, 211, 253),
        height: 150,
        width: 250,
        child: IndexedStack(
          index: 3,
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Text('绝域从军计惘然，'),
            Align(
              alignment: Alignment.topRight,
              widthFactor: 1.5,
              child: Card(
                  elevation: 10,
                  color: Color(0xffffffff),
                  child: Text('东南幽恨满词笺。')),
            ),
            Text('一箫一剑平生意，'),
            Offstage(
              offstage: false,
              child: Text('负尽狂名十五年。'),
            ),
          ],
        )));

var aspectratio_test = new Container(
  width: 200.0,
  child: new AspectRatio(
    aspectRatio: 1.5,
    child: new Container(
      color: Colors.red,
    ),
  ),
);
