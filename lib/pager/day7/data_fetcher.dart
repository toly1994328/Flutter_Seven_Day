import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:toly/pager/day7/bean.dart';

const BASE_URL = 'http://192.168.43.60:8089';
const API = '/api/android/note/';

Future<List<NoteBean>> get({style = '', offset = 0, num = 1}) async {
  var dataLi = <NoteBean>[];
  var url = BASE_URL + API + style + "/" + "$offset" + "/" + "$num";
  print(url);
  try {
    final response = await client.get(url);
    if (response.statusCode == 200) {
      var result = ResultBean.fromJson(json.decode(response.body));
      List data = result.data;
      print(NoteBean.fromJson(data[0]).type);
      for (int i = 0; i < data.length; i++) {
        dataLi.add(NoteBean.fromJson(data[i]));
      }
      return dataLi;
    }
  } catch (e) {
    print(e);
  }
}
