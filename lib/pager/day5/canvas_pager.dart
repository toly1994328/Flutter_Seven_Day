import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toly/helper/color_utils.dart';
import 'package:toly/helper/help_view.dart';
import 'package:toly/pager/day2/clock_pager.dart';

class Draw {
  double x;
  double y;
  Color color;

  Draw(this.x, this.y, this.color);
}

var balls = []; //小球合集

class CanvasPage extends StatefulWidget {
  CanvasPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CanvasPageState createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  var _downX;
  var _downY;
  var _upX;
  var _upY;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text("张风捷特烈"),
    );
    var barTopHeight = MediaQueryData.fromWindow(window).padding.top;

    var scf = Scaffold(
        appBar: appBar,
        body: CustomPaint(
          painter: CanvasView(context, _downX, _downY, _upX, _upY),
        ));

    return GestureDetector(
      child: scf,
      onTapDown: (d) {

        var pos = d.globalPosition;
        balls.add(new Draw(pos.dx,
            pos.dy - appBar.preferredSize.height - barTopHeight, randomRGB()));
        setState(() {});
//        Navigator.of(context).pushNamed('/clock');
        Navigator.push(
            context,
            MaterialPageRoute(builder: (bu) => ClockPage())
        );
      },
      onPanDown: (d) {
        _downX = d.globalPosition.dx;
        _downY =
            d.globalPosition.dy - appBar.preferredSize.height - barTopHeight;
      },
      onPanUpdate: (d) {
        var pos = d.globalPosition;
        balls.add(new Draw(pos.dx,
            pos.dy - appBar.preferredSize.height - barTopHeight, randomARGB()));


        _upX = d.globalPosition.dx;
        _upY = d.globalPosition.dy - appBar.preferredSize.height - barTopHeight;
        setState(() {});
      },
      onPanEnd: (d) {
        _downX = -10.0;
        _downY =  -10.0;
        _upX =  -10.0;
        _upY =  -10.0;
        setState(() {});
      },
    );
  }
}

//Canvas绘版
class CanvasView extends CustomPainter {
  BuildContext context;
  Paint mPaint;
  double _downX;
  double _downY;
  double _upX;
  double _upY;

  CanvasView(this.context, this._downX, this._downY, this._upX, this._upY) {
    mPaint = new Paint()
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    balls.forEach((ball) {
      drawBall(canvas, ball);
    });
    var winSize = MediaQuery.of(context).size;
    drawGrid(canvas, winSize);
//    print("_downX:$_downX,_downY:$_downY");
//    canvas.drawLine(Offset(_downX, _downY), Offset(_upX, _upY), mPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  void drawBall(Canvas canvas, Draw ball) {
    mPaint.color = ball.color;
    canvas.drawCircle(Offset(ball.x, ball.y), 10, mPaint);
  }
}
