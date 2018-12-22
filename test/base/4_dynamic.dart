main() {
  baseUse(); //基本使用

  op();
}

void op() {
  var dict = {"a": "page1", "b": "page30", "c": "page70", "price": 40};
  dict.keys.forEach(print); //a,b,c,price
  dict.values.forEach(print); //a,b,c,price
  dict.forEach((k, v) => (print("$k=$v"))); //这里用括号包着，好想吐槽...
}

int addOne(int num) {
  print(num + 1);
}

void baseUse() {
  dynamic d = 20;
  d = "toly";

  var list = new List<dynamic>();
  list.add("1");
  list.add(3);

  var list2 = new List<int>();
  //list2.add("toly");//ERROR:The argument type 'String' can't be assigned to the parameter type 'int'.
}
