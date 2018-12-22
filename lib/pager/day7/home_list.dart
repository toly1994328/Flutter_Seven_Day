import 'package:flutter/material.dart';
import 'package:toly/helper/layout_utils.dart';
import 'package:toly/pager/day7/bean.dart';

class HomeListPage extends StatefulWidget {
  List<NoteBean> _notes;

  HomeListPage(List<NoteBean> notes) {
    _notes = notes;
  }

  @override
  _HomeListPageState createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var notes = widget._notes;

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        return renderItem(notes[index]);
      },
    );
  }

  renderItem(NoteBean note) {
    ////////////////////////-----------------测试4--------------------------------
    var line1_4 = Row(
      children: <Widget>[
        Image.asset("images/icon_90.png", width: 20, height: 20),
        Expanded(
          child: pd(Text("张风捷特烈"), l: 5),
        ),
        Text(
          note.type,
          style: infoStyle,
        )
      ],
    );

    var center_right = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          note.name,
          style: littelStyle,
          maxLines: 2,
        ),
        pd(
            Text(
              note.info,
              style: infoStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            t: 5),
      ],
    );

//中间的信息
    var center4 = Row(
      children: <Widget>[
        Expanded(child: pda(center_right, 5)),
        Image.network(
          note.imgUrl,
          width: 80,
          height: 80,
          fit: BoxFit.fitHeight,
        )
      ],
    );

    var end4 = Row(
      children: <Widget>[
        Icon(
          Icons.grade,
          color: Colors.green,
          size: 20,
        ),
        Text(
          "1000W",
          style: infoStyle,
        ),
        pd(Icon(Icons.tag_faces, color: Colors.lightBlueAccent, size: 20),
            l: 15, r: 5),
        Text("2000W", style: infoStyle),
      ],
    );

    var item4 = Column(
      children: <Widget>[line1_4, Expanded(child: center4), end4],
    );

    var aCard = Card(
        child: Container(
            height: 160,
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: item4));

    return aCard;
  }
}
