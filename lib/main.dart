import 'package:flutter/material.dart';
import 'package:toly/pager/day2/clock_pager.dart';
import 'package:toly/pager/day4/res_load.dart';
import 'package:toly/pager/day5/canvas_pager.dart';
import 'package:toly/pager/day5/op.dart';
import 'package:toly/pager/day6/io_test.dart';
import 'package:toly/pager/day6/list_file_pager.dart';
import 'package:toly/pager/day7/android_stack.dart';
import 'package:toly/pager/day7/plg/shape.dart';
import 'package:toly/pager/day7/plg/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var scContext;

  @override
  Widget build(BuildContext context) {
//    localPath();

    var scaffold = Scaffold(
      appBar: AppBar(
          title: Text("张风捷特烈"),
          bottom: tabBar,
          backgroundColor: Color(0xff54C5F8),
          centerTitle: true,
          toolbarOpacity: .4),
      body: Builder(builder: (context) {
        scContext = context;

        return card_shape;
      }),
      drawer: draw,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Scaffold.of(scContext).showBottomSheet(bottomSheet.builder);
//          Navigator.pop(context);
//          Scaffold.of(scContext).showSnackBar(snackBar);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: new DefaultTabController(child: scaffold, length: 4),
//        home: AndroidPage(),
      routes: <String, WidgetBuilder> {
      '/clock': (BuildContext context) => ClockPage(),
    },);

  }
}

