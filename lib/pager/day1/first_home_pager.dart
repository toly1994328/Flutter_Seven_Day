import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toly/helper/color_utils.dart';
import 'package:toly/view/day1/star_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = Colors.black;

  void _changeColor() {
    setState(() {
      _color = randomRGB();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomPaint(
        painter: StarView(context, _color),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
