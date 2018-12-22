import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toly/view/day2/anima_view.dart';

class AnimaPage extends StatefulWidget {
  @override
  _AnimaPageState createState() => _AnimaPageState();
}

class _AnimaPageState extends State<AnimaPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Animation<int> numAnima;
  Animation<Color> colorAnima;
  double _R = 25;
  int _num = 5;
  Color _color = Colors.yellow;

  @override
  void initState() {
    super.initState();
    // 创建 AnimationController 对象
    //|----vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    numAnima = IntTween(begin: 5, end: 220).animate(controller)
      ..addListener(() {
        setState(() {
          _num = numAnima.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    colorAnima =
        ColorTween(begin: Colors.yellow, end: Colors.red).animate(controller)
          ..addListener(() {
            setState(() {
              _color = colorAnima.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          });

    animation = Tween(begin: 25.0, end: 150.0).animate(
        CurveTween(curve: Cubic(0.96, 0.13, 0.1, 1.2)).animate(controller))
      ..addListener(() {
        setState(() {
          _R = animation.value;
        });
      })
      ..addStatusListener((status) {
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
        painter: AnimaView(context, R: _R, num: _num, color: _color),
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
}
