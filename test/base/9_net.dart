import 'dart:convert';

import 'package:http/http.dart' as client;

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
        localPath = map['localPath'],
        jianshuUrl = map['jianshuUrl'],
        juejinUrl = map['juejinUrl'],
        imgUrl = map['imgUrl'],
        createTime = map['createTime'],
        info = map['info'],
        area = map['area'];
}

main() {
  var j ='{"code":200,"msg":"操作成功","data":[{"id":198,"type":"绘图相关","name":"","localPath":"---","jianshuUrl":"","juejinUrl":"---","imgUrl":"http://toly1994.com:8089/imgs/android/8a11d27d58f4c1fa4488cf39fdf68e76.png","createTime":"2021-02-18","info":"hh","area":"A"},{"id":200,"type":"绘图相关","name":"","localPath":"---","jianshuUrl":"","juejinUrl":"---","imgUrl":"http://toly1994.com:8089/imgs/android/8a11d27d58f4c1fa4488cf39fdf68e76.png","createTime":"2018-12-21","info":"hh","area":"A"}]}';
  var result = ResultBean.fromJson(json.decode(j));
//  print(NoteBean.fromJson(result.data[1]).imgUrl);//http://toly1994.com:8089/imgs/android/8a11d27d58f4c1fa4488cf39fdf68e76.png


//  getData((data) {
////    print(data);
//
//
////
////    var resultBean = ResultBean.fromJson(json.decode(data));
////    print(resultBean);
//  });

////一个JSON格式的用户列表字符串
//  String jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
////将JSON字符串转为Dart对象(此处是List)
//  List items = json.decode(jsonStr);
////输出第一个用户的姓名
//  print(items[0]["name"]);

//  getData2().then((data) {
//    print(data);
//  });

//  add((data) {
//    print(data);
//  });

//  set((data) {
//    print(data);
//  });
//  delete((data) {
//    print(data);
//  });
}

getData(cbk) async {
  var api = 'http://www.toly1994.com:8089/api/android/note/100';
  try {
    final response = await client.get(api);
    if (response.statusCode == 200) {
      cbk(response.body);
    }
  } catch (e) {
    print(e);
  }
}

add(cbk) async {
  var api = 'http://192.168.43.60:8089/api/android/note';
  var item = {
    "type": "C",
    "name": "插入测试",
    "localPath": "null",
    "jianshuUrl": "https://www.jianshu.com/p/12f8ab32591a",
    "juejinUrl": "null",
    "imgUrl":
        "http://toly1994.com:8089/imgs/android/c3af376135a7abe0655c908195b271db.png",
    "createTime": "2018-09-06",
    "info": "null",
    "area": "A"
  };

  try {
    final response = await client.post(api, body: item);

    if (response.statusCode == 200) {
      cbk(response.body);
    }
  } catch (e) {
    print(e);
  }
}

set(cbk) async {
  var api = 'http://192.168.43.60:8089/api/android/note/199';
  var item = {
    "type": "C",
    "name": "修改测试",
    "localPath": "null",
    "jianshuUrl": "https://www.jianshu.com/p/12f8ab32591a",
    "juejinUrl": "null",
    "imgUrl":
        "http://toly1994.com:8089/imgs/android/c3af376135a7abe0655c908195b271db.png",
    "createTime": "2018-09-06",
    "info": "null",
    "area": "A"
  };

  try {
    final response = await client.put(api, body: item);

    if (response.statusCode == 200) {
      cbk(response.body);
    }
  } catch (e) {
    print(e);
  }
}

delete(cbk) async {
  var api = 'http://192.168.43.60:8089/api/android/note/199';

  try {
    final response = await client.delete(api);

    if (response.statusCode == 200) {
      cbk(response.body);
    }
  } catch (e) {
    print(e);
  }
}

Future<String> getData2() async {
  try {
    final response =
        await client.get('http://www.toly1994.com:8089/api/android/note/100');
    if (response.statusCode == 200) {
      return response.body;
    }
  } catch (e) {
    print(e);
  }
  return null;
}
