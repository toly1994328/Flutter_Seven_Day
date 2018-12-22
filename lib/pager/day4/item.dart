import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var imgHead = Image.asset(
  "images/icon_90.png",
  width: 80,
);

var box = Container(
  color: Colors.lightBlueAccent,
  width: 150,
  height: 80,
);
var center = Align(
  alignment: Alignment.centerLeft,
  child: Container(
  color: Colors.amberAccent,
  width: 50,
  height: 80,
));
var right = Container(
    color: Colors.black45,
    width: 80,
    height: 80,
);

var juejin_item = Card(
  color: Colors.white,
  child: Flex(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    direction: Axis.horizontal,
    children: <Widget>[imgHead, center, right],
  ),
);
