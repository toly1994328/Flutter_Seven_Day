import 'dart:ui';

import 'package:flutter/material.dart';

class Ball {
  double aX; //加速度
  double aY; //加速度Y
  double vX; //速度X
  double vY; //速度Y
  double x; //点位X
  double y; //点位Y
  Color color; //颜色
  double r; //小球半径

  Ball(
      {this.x, this.y, this.color, this.r, this.aX, this.aY, this.vX, this.vY});

  //复制一个小球
  Ball.fromBall(Ball ball) {
    this.x = ball.x;
    this.y = ball.y;
    this.color = ball.color;
    this.r = ball.r;
    this.aX = ball.aX;
    this.aY = ball.aY;
    this.vX = ball.vX;
    this.vY = ball.vY;
  }
}

class RunBallView extends CustomPainter {
  Paint mPaint;
  BuildContext context;
  List<Ball> _balls;
  Rect _limit;

  RunBallView(this.context, List<Ball> balls, Rect limit) {
    mPaint = new Paint();
    _balls = balls;
    _limit = limit;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
//    drawGrid(canvas, winSize);
//    drawCoo(canvas, new Size(160, 320), winSize);
    canvas.translate(160, 320);

    mPaint.color = Color.fromARGB(148, 198, 246, 248);
//    canvas.drawRect(_limit, mPaint);

    canvas.save();
    _balls.forEach((ball) {
      drawBall(canvas, ball);
    });

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void drawBall(Canvas canvas, Ball ball) {
    mPaint.color = ball.color;
    canvas.drawCircle(Offset(ball.x, ball.y), ball.r, mPaint);
  }
}
