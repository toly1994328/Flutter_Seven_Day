import 'package:flutter/material.dart';

class ItemBean {
  Color color;
  IconData iconId;
  String info;
  ItemBean(this.color, this.iconId, this.info);
}


class ResultBean {
  String msg;
  int code;
  var data;

  ResultBean.fromJson(Map<String, dynamic> map)
      : msg = map['msg'],
        code = map['code'],
        data = map['data'];
}

class NoteBean {
  int id;
  String type;
  String name;
  String localPath;
  String jianshuUrl;
  String juejinUrl;
  String imgUrl;
  String createTime;
  String info;
  String area;

  NoteBean.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        type = map['type'],
        localPath = map['localPath'],
        jianshuUrl = map['jianshuUrl'],
        juejinUrl = map['juejinUrl'],
        imgUrl = map['imgUrl'],
        createTime = map['createTime'],
        info = map['info'],
        area = map['area'];
}