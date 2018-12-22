import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toly/helper/color_utils.dart';
import 'package:toly/helper/common_path.dart';
import 'package:toly/helper/day2/cons.dart';
import 'package:toly/helper/help_view.dart';

var currTime = new DateTime.now();
var tagOfBall = new DateTime.now().millisecondsSinceEpoch;
var _balls = new List<Ball>();

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

class ClockView extends CustomPainter {
  Paint mPaint;
  BuildContext context;

  double _radius = 4;
  DateTime _now;
  Path mStarPath; //半径

  ClockView(this.context) {
    mPaint = new Paint();
    mStarPath = nStarPath(5, _radius, _radius / 2);
    _now = new DateTime.now();
    addBallsChanged();
    updateBalls();
  }

  /**
   * 添加倒计时中改动的点---变动加球
   */
  void addBallsChanged() {
    var now = new DateTime.now();
    if (currTime.second != now.second) {
      //判断当前时间是否改变,再将点位放到集合中
      if ((currTime.hour ~/ 10) != (now.hour ~/ 10)) {
        addBalls((-17 * 5 - 11 * 2) * _radius.toInt(), currTime.hour ~/ 10);
      }
      if ((currTime.hour % 10) != (now.hour % 10)) {
        addBalls((-17 * 4 - 11 * 2) * _radius.toInt(), currTime.hour % 10);
      }
      if ((currTime.minute ~/ 10) != (now.minute ~/ 10)) {
        addBalls((-18 * 3 - 11) * _radius.toInt(), currTime.minute ~/ 10);
      }
      if ((currTime.minute % 10) != (now.minute % 10)) {
        addBalls((-18 * 2 - 11) * _radius.toInt(), currTime.minute % 10);
      }
      if ((currTime.second ~/ 10) != (now.second ~/ 10)) {
        addBalls(-18 * _radius.toInt(), currTime.second ~/ 10);
      }
      if ((currTime.second % 10) != (now.second % 10)) {
        addBalls(0, currTime.second % 10);
        currTime = now;
      }
    }
  }

  //添加小球
  addBalls(int offsetX, int num) {
    Random random = new Random();
    for (int i = 0; i < digit[num].length; i++) {
      for (int j = 0; j < digit[num][i].length; j++) {
        if (digit[num][i][j] == 1) {
          Ball ball = new Ball();
          ball.aY = 0.1;
          ball.vX = pow(-1, random.nextInt(1000)) * 6 * random.nextDouble();
          ball.vY = 4 * random.nextDouble();
          ball.x =
              offsetX + j * 2 * (_radius + 1) + (_radius + 1); //第(i，j)个点圆心横坐标
          ball.y = i * 2 * (_radius + 1) + (_radius + 1); //第(i，j)个点圆心纵坐标
          ball.color = randomRGB();
          ball.r = _radius;
          _balls.add(ball);
        }
      }
    }
  }

  /**
   * 更新所有球的位置---让球运动
   * 并且越界移除
   */
  void updateBalls() {
    double maxX = 400; //限定x范围大值

    for (Ball ball in _balls) {
      ball.x += ball.vX; //x=xo+v*t-----t=1
      ball.y += ball.vY;
      ball.y += ball.aY; //v=vo+a*t-----t=1

      if (ball.y >= 160) {
        //超过Y底线，反弹
        ball.y = 160;
        ball.vY = -ball.vY * 0.99;
      }

      if (ball.x > maxX) {
        //超过X最大值，反弹
        ball.x = maxX;
        ball.vX = -ball.vX * 0.99;
      }
    }

    //5秒清一次屏
    if (new DateTime.now().millisecondsSinceEpoch - tagOfBall > 5000) {
      _balls.clear();
      tagOfBall = new DateTime.now().millisecondsSinceEpoch;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    drawGrid(canvas, winSize);
    drawCoo(canvas, new Size(100, 60), winSize);
    canvas.translate(100, 60);

    mPaint.color = Color.fromARGB(148, 198, 246, 248);
//    canvas.drawRect(_limit, mPaint);

    canvas.save();

    renderDigit(_now.hour ~/ 10, canvas);
    canvas.translate(19 * _radius, 0);
    renderDigit(_now.hour % 10, canvas);

    canvas.translate(19 * _radius, 0);
    renderDigit(10, canvas);

    canvas.translate(11 * _radius, 0);
    renderDigit(_now.minute ~/ 10, canvas);
    canvas.translate(19 * _radius, 0);
    renderDigit(_now.minute % 10, canvas);

    canvas.translate(18 * _radius, 0);
    renderDigit(10, canvas);

    canvas.translate(11 * _radius, 0);
    renderDigit(_now.second ~/ 10, canvas);
    canvas.translate(19 * _radius, 0);
    renderDigit(_now.second % 10, canvas);

    //绘制小球
    _balls.forEach((ball) {
      drawBall(canvas, ball);
    });
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  /**
   * 渲染数字
   * @param num    要显示的数字
   * @param canvas 画布
   */
  void renderDigit(int num, Canvas canvas) {
    if (num > 10) {
      return;
    }
    for (int i = 0; i < digit[num].length; i++) {
      for (int j = 0; j < digit[num][j].length; j++) {
        if (digit[num][i][j] == 1) {
          canvas.save();
          double rX = j * 2 * (_radius + 1) + (_radius + 1); //第(i，j)个点圆心横坐标
          double rY = i * 2 * (_radius + 1) + (_radius + 1); //第(i，j)个点圆心纵坐标
          canvas.translate(rX, rY);

          mPaint.color = Colors.blue;
          canvas.drawPath(mStarPath, mPaint);
          canvas.restore();
        }
      }
    }
  }

  void drawBall(Canvas canvas, Ball ball) {
    mPaint.color = ball.color;
    canvas.drawCircle(Offset(ball.x, ball.y), ball.r, mPaint);
  }
}
