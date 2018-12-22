import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toly/helper/common_path.dart';

var card_shape = Card(
    shape: StarBorder(),
//    shape: CircleBorder(side: BorderSide(width: 15,color: Color(0xffF9DFA7))),
//    shape: RoundedRectangleBorder(
//      side:BorderSide(color: Color(0xffD516F5),width: 5) ,
//        borderRadius: BorderRadius.all(Radius.circular(20))),
    clipBehavior: Clip.hardEdge,
    child: Container(
      width: 100,
      height: 100,
      color: Color(0xffCDECF6),
      child: Center(
        child: Text(
          "捷",
          style: TextStyle(color: Colors.black, fontSize: 40),
        ),
      ),
    ));

class StarBorder extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    print(rect.right);
    return regularPolygonPath(10, 50,x: rect.height/2,y: rect.width/2);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    canvas.translate(50, 50);
//    canvas.drawPath(nStarPath(5, 40, 20), new Paint());
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    return null;
  }
}
