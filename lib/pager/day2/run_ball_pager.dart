import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toly/helper/color_utils.dart';
import 'package:toly/view/day2/run_ball_view.dart';

class RunBallPage extends StatefulWidget {
  @override
  _RunBallPageState createState() => _RunBallPageState();
}

class _RunBallPageState extends State<RunBallPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  var _balls = List<Ball>();

  var _limit = Rect.fromLTRB(-150, -100, 150, 100); //矩形边界

  @override
  void initState() {
    super.initState();

    var ball =
        Ball(x: 0, y: 0, color: Colors.blue, r: 40, aX: 0.05, aY: 0.1, vX: 3, vY: -3);

    _balls.add(ball);

    // 创建 AnimationController 对象
    //|----vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    controller = AnimationController(
        duration: const Duration(milliseconds: 200000), vsync: this);
    controller.addListener(() {
      updateBall();
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // 资源释放
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("张风捷特烈"),
      ),
      body: CustomPaint(
        painter: RunBallView(context, _balls, _limit),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward(); //执行动画
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

//更新小球位置
  void updateBall() {
    for (int i = 0; i < _balls.length; i++) {
      var ball = _balls[i];
      if (ball.r < 0.3) {
        //帮半径小于0.3就移除
        _balls.removeAt(i);
      }

      //运动学公式
      ball.x += ball.vX;
      ball.y += ball.vY;
      ball.vX += ball.aX;
      ball.vY += ball.aY;
      //限定下边界
      if (ball.y > _limit.bottom) {


        var newBall = Ball.fromBall(ball);
        newBall.r = newBall.r / 2;
        newBall.vX = -newBall.vX;
        newBall.vY = -newBall.vY;
        _balls.add(newBall);

        ball.r = ball.r / 2;

        ball.y = _limit.bottom;
        ball.vY = -ball.vY;
        ball.color = randomRGB(); //碰撞后随机色
      }
      //限定上边界
      if (ball.y < _limit.top) {
        ball.y = _limit.top;
        ball.vY = -ball.vY;
        ball.color = randomRGB(); //碰撞后随机色
      }

      //限定左边界
      if (ball.x < _limit.left) {
        ball.x = _limit.left;
        ball.vX = -ball.vX;
        ball.color = randomRGB(); //碰撞后随机色
      }

      //限定右边界
      if (ball.x > _limit.right) {
        var newBall = Ball.fromBall(ball);
        newBall.r = newBall.r / 2;
        newBall.vX = -newBall.vX;
        newBall.vY = -newBall.vY;
        _balls.add(newBall);

        ball.r = ball.r / 2;

        ball.x = _limit.right;
        ball.vX = -ball.vX;
        ball.color = randomRGB(); //碰撞后随机色

      }
    }
  }
}
