main() {
  baseUse(); //基本使用
}

void baseUse() {
  int a = 10;

  print(a / 3); //3.3333333333333335
  print(a ~/ 3); //3

  int b = 9;
  b = 5;
  b ??= a; //----如果b空的则赋值
  print(b); //5

  int c = 10;
  int d = 8;
  var add10 = c = null ?? d + 10; //取两边不为空的表达式
  print(add10); //18


}


