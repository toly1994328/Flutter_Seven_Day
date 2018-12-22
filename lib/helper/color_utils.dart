import 'dart:math';
import 'dart:ui';

Color randomRGB(){
  Random random = new Random();
  int r = 30 + random.nextInt(200);
  int g = 30 + random.nextInt(200);
  int b = 30 + random.nextInt(200);
  return Color.fromARGB(255, r, g, b);
}


Color randomARGB(){
  Random random = new Random();
  int r = 30 + random.nextInt(200);
  int g = 30 + random.nextInt(200);
  int b = 30 + random.nextInt(200);
  int a = 50 + random.nextInt(150);
  return Color.fromARGB(a, r, g, b);
}