import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toly/helper/color_utils.dart';

var table_test = Table(
  columnWidths: const <int, TableColumnWidth>{
    0: FixedColumnWidth(60.0),
    1: FixedColumnWidth(100.0),
    2: FixedColumnWidth(100.0),
    3: FixedColumnWidth(80.0),
  },
  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
  border: TableBorder.all(
      color: Color(0xff16DAF1), width: 1.0, style: BorderStyle.solid),
  children: const <TableRow>[
    TableRow(
      children: <Widget>[
        Center(child: Text('姓名')),
        Center(child: Text('年龄')),
        Center(child: Text('称号')),
        Center(child: Text('武器')),
      ],
    ),
    TableRow(
      children: <Widget>[
        Text('捷特'),
        Text('24'),
        Text('风神'),
        Text('黑风剑'),
      ],
    ),
    TableRow(
      children: <Widget>[
        Text('巫缨'),
        Text('23'),
        Text('百里巫缨'),
        Text('百里弓'),
      ],
    ),
    TableRow(
      children: <Widget>[
        Text('龙少'),
        Text('23'),
        Text('控尊'),
        Text('控尊戒'),
      ],
    ),
  ],
);

formColorList(int count) {
  var random = new Random();
  var li = <Widget>[];

  for (int i = 0; i < count; i++) {
    li.add(new Container(
      width: 100 * (random.nextDouble() + 0.3),
      height: 30,
      color: randomRGB(),
    ));
  }
  return li;
}

var flow_test = Flow(
    delegate: MarginFlowDelegate(EdgeInsets.all(5)),
    children: formColorList(60));

class MarginFlowDelegate extends FlowDelegate {
  EdgeInsets _margin = EdgeInsets.zero; //成员变量_margin

  MarginFlowDelegate(this._margin); //构造函数

  @override //绘制孩子的方法
  void paintChildren(FlowPaintingContext context) {
    var offsetX = _margin.left;
    var offsetY = _margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + offsetX + _margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX = w + _margin.left;
      } else {
        offsetX = _margin.left;
        offsetY +=
            context.getChildSize(i).height + _margin.top + _margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX += context.getChildSize(i).width + _margin.left + _margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

var wrap_test = Wrap(
    spacing: 8.0,
    // 列间距
    runSpacing: 4.0,
    //行间距
    direction: Axis.horizontal,
    alignment: WrapAlignment.spaceBetween,
    children: formColorList(50));

var grid_view_test = GridView.count(
  crossAxisCount: 4,
  scrollDirection:Axis.horizontal,
  children: List.generate(
    100,
    (index) {
      return  Card(
        child: Center(child: Text('toly $index')),
      );
    },
  ),
);

var list_view_test = ListView.builder(
  itemCount: 20,
  padding: EdgeInsets.all(8.0),
  scrollDirection:Axis.horizontal,
  itemExtent: 60.0,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      child: Center(child: Text('toly $index')),
    );
  },
);
var list_body_test = Row(
  children: <Widget>[
    ListBody(
      mainAxis: Axis.horizontal,
      reverse: false,
      children: formColorList(5)
    )],
);

