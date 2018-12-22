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
  //创建映射表
  var dict = {"a": "page1", "b": "page30", "c": "page70", "price": 40};
//  var dict = new Map();
  print(dict); //{a: page1, b: page30, c: page70, price: 40}
  print(dict["price"]); //40
  dict["a"] = "page2";
  print(dict); //{a: page2, b: page30, c: page70, price: 40}
  print(dict.containsKey("price")); //true
  print(dict.containsValue("price")); //false
  print(dict.isEmpty); //false
  print(dict.isNotEmpty); //true
  print(dict.length); //4
  dict.remove("c");
  print(dict);//{a: page2, b: page30, price: 40}
}
