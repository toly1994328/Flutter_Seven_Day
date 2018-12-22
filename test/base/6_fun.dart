main() {
  fun("toly"); //toly,24,null
  fun("toly", age: 24, sex: "男"); //toly,24,男

  fun2("toly", 24); //toly,24,null

  var power = (i) {
    return i * i;
  };

  print(power(6)); //36

  var li = [1, 2, 3, 4, 5];
  li.forEach((i) => print((i) {
        return i * i;
      }(i))); //1,4,9,16,25

  var funA = a();
  funA(); //0
  funA(); //1
  funA(); //2
  funA(); //3
  funA(); //4
}

fun(String name, {int age = 24, String sex}) {
  print("$name,$age,$sex");
}

fun2(String name, [int age, String sex = "男"]) {
  print("$name,$age,$sex");
}

a() {
  int a = 0;

  return () {
    print(a++);
  };
}
