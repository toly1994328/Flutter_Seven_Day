import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toly/helper/color_utils.dart';
import 'package:toly/view/day2/clock_view.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  var _limit = Rect.fromLTRB(-150, -100, 150, 100); //矩形边界

  @override
  void initState() {
    super.initState();


    // 创建 AnimationController 对象
    //|----vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    controller = AnimationController(
        duration: const Duration(milliseconds: 200000), vsync: this);
    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward(); //执行动画
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
        painter: ClockView(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
