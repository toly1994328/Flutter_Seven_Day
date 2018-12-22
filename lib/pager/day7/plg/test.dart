import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const platform = const MethodChannel("www.toly1994.com/test.名字随意起");

var toastTest = Center(
  child: RaisedButton(
    onPressed: () {

      var result= platform.invokeMethod("getMD5",{"arg":"https://www.jianshu.com/p/9bac0072d1a0"});
      result.then((str){
        platform.invokeMethod("showToast",{"msg":str});
      });

    },
    child: new Text("点击弹吐司"),
  ),
);
