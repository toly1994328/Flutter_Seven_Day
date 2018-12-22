//根据名称读取文件
import 'dart:io';

readFile(name) async {
  //创建文件对象
  var file = File(name);
  try {
    //判断是否存在
    bool exists = await file.exists();
    if (exists) {
      //如果存在
      print(await file.length()); //文件大小(字节)---137
      print(await file.lastModified()); //最后修改时间---2018-12-21 13:49:35.000
      print(file.parent.path); //获取父文件夹的路径---C:\Users\Administrator\Desktop\dart
      return await file.readAsString(); //读取文件并返回
    } else {
      await file.create(recursive: true); //不存在则创建文件
      return "未发现文件,已为您创建!Dart机器人:2333";
    }
  } catch (e) {
    //异常处理
    print(e);
  }
}
