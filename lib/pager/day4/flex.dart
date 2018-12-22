import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var c1 = Container(
  width: 50,
  height: 50,
  color: Colors.blue,
);
var c2 = Container(
  width: 100,
  height: 80,
  color: Colors.red,
);
var c3 = Container(
  width: 150,
  height: 50,
  color: Colors.yellow,
);

var flex_test = Flex(
  direction: Axis.horizontal,
  children: <Widget>[
    Expanded(
      child: c1,
    ),
    Expanded(
      child: c2,
    ),
    Expanded(
      child: c3,
    ),
  ],
);
