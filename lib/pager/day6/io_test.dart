import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:toly/helper/io_utils.dart';

var box = Center(
    child: Container(
  width: 300,
  height: 300,
  color: Colors.lightBlueAccent,
));

var io_test = GestureDetector(
  child: box,
  onTap: () {
    print("onTap");
    localPath();
  },
  onTapDown: (d) {
    print("onPanDown" + d.globalPosition.toString());
  },
  onTapUp: (d) {
    print("onTapUp" + d.globalPosition.toString());
  },
  onTapCancel: () {
    print("onTapUp");
  },
);

localPath() async {
  try {
    var perm =
        SimplePermissions.requestPermission(Permission.ReadExternalStorage);
    var sdPath = getExternalStorageDirectory();
    sdPath.then((file) {
      perm.then((v) async {
        var res = await readFile(file.path + "/应龙.txt");
        print(res);
      });
    });
  } catch (err) {
    print(err);
  }
}
