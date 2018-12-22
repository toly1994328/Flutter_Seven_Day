import 'package:flutter/material.dart';
import 'package:toly/helper/layout_utils.dart';
import 'package:toly/pager/day7/bean.dart';
import 'package:toly/pager/day7/cons.dart';
import 'package:toly/pager/day7/data_fetcher.dart';
import 'package:toly/pager/day7/home_list.dart';
import 'package:toly/pager/day7/left_draw.dart';

class AndroidPage extends StatefulWidget {
  @override
  _AndroidPageState createState() => _AndroidPageState();
}

class _AndroidPageState extends State<AndroidPage> {
  int _curIndex = 0;
  List<NoteBean> _notes = [];
  String style = "area/A";

  @override
  void initState() {
    super.initState();

    get(style: style, num: 1000).then((beanLi) {
      _notes = beanLi;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var searchSheet = BottomSheet(
        onClosing: () {},
        builder: (context) => (Card(
            color: Color.fromARGB(255, 214, 242, 251),
            child: Wrap(
              children: <Widget>[
                Center(
                    child: pdhv(TextField(
                  onChanged: (v) {
                    style = "name/" + v;
                  },
                ), h: 60)),
                Center(
                    child: pdhv(
                        GestureDetector(
                          child: Image.asset(
                            "images/icon_90.png",
                            width: 50,
                            height: 50,
                          ),
                          onTap: () {
                            get(style: style, num: 1000).then((beanLi) {
                              _notes = beanLi;
                              setState(() {});
                            });
                          },
                        ),
                        v: 10)),
              ],
            ))));


    //底部栏
    var bottomNavigationBar = BottomNavigationBar(
      items: iconLi.map((item) {
        return BottomNavigationBarItem(
            title: Text(
              item.info,
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            icon: Icon(
              item.iconId,
              color: item.color,
            ),
            backgroundColor: Color(0xffffffff));
      }).toList(),
      currentIndex: _curIndex,
      onTap: _onTapBNB,
    );

    var scContext; //先声明一下Scaffold的context
    var scaffold = Scaffold(
        appBar: AppBar(
          title: Text("张风捷特烈"),
        ),
        body: Builder(builder: (context) {
          scContext = context;
          return HomeListPage(_notes);
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Scaffold.of(scContext).showBottomSheet(searchSheet.builder);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: bottomNavigationBar,
        drawer: LeftDrawPage());
    return scaffold;
  }

  //底部栏点击监听
  void _onTapBNB(int position) {
    switch (position) {
      case 0:
        style = "area/A";
        break;
      case 1:
        style = "area/SB";
        break;
      case 2:
        style = "area/Re";
        break;
      case 3:
        style = "area/Note";
        break;
      case 4:
        style = "area/A";
        break;
    }
    _curIndex = position;
    get(style: style, num: 1000).then((beanLi) {
      _notes = beanLi;
      setState(() {});
    });
  }
}
