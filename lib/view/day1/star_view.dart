import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toly/helper/common_path.dart';
import 'package:toly/helper/help_view.dart';

class StarView extends CustomPainter {
  Paint mPaint;
  BuildContext context;

  StarView(this.context,Color color) {
    print(color);
    mPaint = new Paint();
    mPaint.color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    drawGrid(canvas, winSize);
    drawCoo(canvas, new Size(160, 320), winSize);

    canvas.translate(0, 320);

    canvas.save();
    for (int i = 5; i < 10; i++) {
      canvas.translate(64, 0);


      canvas.drawPath(nStarPath(i, 30, 15), mPaint);
    }
    canvas.restore();

    canvas.translate(0, 70);
    canvas.save();
    for (int i = 5; i < 10; i++) {
      canvas.translate(64, 0);
      canvas.drawPath(regularStarPath(i, 30), mPaint);
    }
    canvas.restore();

    canvas.translate(0, 70);
    canvas.save();
    for (int i = 5; i < 10; i++) {
      canvas.translate(64, 0);
      canvas.drawPath(regularPolygonPath(i, 30), mPaint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
