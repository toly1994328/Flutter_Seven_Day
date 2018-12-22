//const就像英雄天生天赋,final就像等级到了,选择英雄职业(不能转职)
const PI = 3.141592654; //const：编译时就是常量
//const double PI = 3.141592654;

final x = 50; //final修饰的变量只能被赋值一次(运行时)
//final int x = 100;

main() {
//  int radius = 10;
  var radius = 10;
   //radius = 10.0;//Error--A value of type 'double' can't be assigned to a variable of type 'int'.
  double c = getC(radius);
  //支持三目运算符
  bool isBig = c > x;
  print(isBig ? "圆的周长大于${x}" : r"圆的周长\n小于${x}"*2);
  //x=100 圆的周长\n小于${x}圆的周长\n小于${x}
  //x=50 圆的周长大于50
}

// 获取圆的周长 radius : 半径
double getC(int radius) {
  var c = 2 * PI * radius;
  return c;
}
