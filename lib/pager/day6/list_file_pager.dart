import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';

class ListFilePage extends StatefulWidget {
  @override
  _ListFilePageState createState() => _ListFilePageState();
}

class _ListFilePageState extends State<ListFilePage>
    with SingleTickerProviderStateMixin {
  List<String> _files = [];

  @override
  void initState() {
    super.initState();
    localPath();
  }

  @override
  Widget build(BuildContext context) {
    //生成listView
    var listview = ListView.builder(
      itemCount: _files.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Container(
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: renderItem(index))
          ],
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("张风捷特烈"),
      ),
      body: listview,
    );
  }

// 添加所有SD卡文件名称
  localPath() {
    try {
      var perm =
          SimplePermissions.requestPermission(Permission.ReadExternalStorage);
      var sdPath = getExternalStorageDirectory();
      sdPath.then((file) {
        perm.then((v) {
          file.list().forEach((i) {
            _files.add(i.path);
          });
          setState(() {});
        });
      });
    } catch (err) {
      print(err);
    }
  }

  //渲染单条目
  renderItem(index) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.extension,
          color: Colors.blue,
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            _files[index],
            style: TextStyle(fontSize: 18),
          ),
        )),
        Icon(Icons.arrow_forward),
        Divider(height: 1)
      ],
    );
  }
}
