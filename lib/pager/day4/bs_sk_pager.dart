import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toly/helper/color_utils.dart';
import 'package:toly/pager/day4/res_load.dart';
import 'package:toly/view/day2/clock_view.dart';

class BSPage extends StatefulWidget {
  @override
  _BSPageState createState() => _BSPageState();
}

class _BSPageState extends State<BSPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // 资源释放
  }

  @override
  Widget build(BuildContext context) {

    var scaffold = Scaffold(
      appBar: AppBar(
          title: Text("张风捷特烈"),
          bottom: tabBar,
          backgroundColor: Color(0xff54C5F8),
          elevation: 12,
          centerTitle: true,
          toolbarOpacity: .4),
      body: tabBarView,
      drawer: draw,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Scaffold.of(context).showSnackBar(snackBar);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );


    return new DefaultTabController(child: scaffold, length: 4);
  }
}
