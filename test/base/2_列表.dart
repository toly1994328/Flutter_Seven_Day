main() {
  baseUse(); //基本使用

  op();
}

void op() {
  var numList = [3, 2, 1, 4, 5];
  numList.sort();
  print(numList); //排序--[1, 2, 3, 4, 5]

  for (var value in numList) {
    //遍历list
    print(value); //1,2,3,4,5
  }

  numList.forEach(addOne); //2,3,4,5,6
  numList.forEach((num) => print(num + 1)); //同上

  var any = numList.any((num) => num > 3);
  print(any); //只要有>3的任何元素,返回true

  var every = numList.every((num) => num < 6);
  print(every); //全部元素<6,返回true

  var listX5 = numList.map((e) => e*=5);
  print(listX5);//(5, 10, 15, 20, 25)

}

int addOne(int num) {
  print(num + 1);
}

void baseUse() {
  var list = [1, "a", "b", "c", true]; //支持多种类型
  //  var list=const[1,"a","b","c",true];
  //  var list =new List();

  list[0] = "10"; //数组元素可修改成不同类型
  var el = list[list.length - 1]; //获取--true
  list.add("toly"); //尾增--[10, a, b, c, true, toly]
  list.insert(1, true); //定点增--[10, true, a, b, c, true, toly]
  list.remove("10"); //删除元素--[true, a, b, c, true, toly]
  list.indexOf(true); //首出索引--1
  list.lastIndexOf(true); //尾出索引--4
  list.removeLast(); //移除尾--[true, a, b, c, true]
  print(list.sublist(2)); //截取--[b, c, true]
  print(list.sublist(2, 4)); //截取--[b, c]
  print(list);
  print(list.join("!")); //true!a!b!c!true
}
