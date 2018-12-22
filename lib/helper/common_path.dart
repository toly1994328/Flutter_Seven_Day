import 'dart:math';
import 'dart:ui';

/**
 * n角星路径
 *
 * @param num 几角星
 * @param R   外接圆半径
 * @param r   内接圆半径
 * @return n角星路径
 */
Path nStarPath(int num, double R, double r, {x = 0, y = 0}) {
  Path path = new Path();
  double perDeg = 360 / num; //尖角的度数
  double degA = perDeg / 2 / 2;
  double degB = 360 / (num - 1) / 2 - degA / 2 + degA;

  path.moveTo(cos(_rad(degA)) * R+x, (-sin(_rad(degA)) * R+y));
  for (int i = 0; i < num; i++) {
    path.lineTo(
        cos(_rad(degA + perDeg * i)) * R+x, -sin(_rad(degA + perDeg * i)) * R+y);
    path.lineTo(
        cos(_rad(degB + perDeg * i)) * r+x, -sin(_rad(degB + perDeg * i)) * r+y);
  }
  path.close();
  return path;
}

/**
 * 画正n角星的路径:
 *
 * @param num 角数
 * @param R   外接圆半径
 * @return 画正n角星的路径
 */
Path regularStarPath(int num, double R,{x = 0, y = 0}) {
  double degA, degB;
  if (num % 2 == 1) {
    //奇数和偶数角区别对待
    degA = 360 / num / 2 / 2;
    degB = 180 - degA - 360 / num / 2;
  } else {
    degA = 360 / num / 2;
    degB = 180 - degA - 360 / num / 2;
  }
  double r = R * sin(_rad(degA)) / sin(_rad(degB));
  return nStarPath(num, R, r,x: x,y:y);
}

/**
 * 画正n边形的路径
 *
 * @param num 边数
 * @param R   外接圆半径
 * @return 画正n边形的路径
 */
Path regularPolygonPath(int num, double R,{x = 0, y = 0}) {
  double r = R * cos(_rad(360 / num / 2)); //!!一点解决
  return nStarPath(num, R, r,x: x,y:y);
}

/**
 * 角度制化为弧度制
 *
 * @param deg 角度
 * @return 弧度
 */
double _rad(double deg) {
  return deg * pi / 180;
}

/**
 * 绘制网格路径
 *
 * @param step    小正方形边长
 * @param winSize 屏幕尺寸
 */
Path gridPath(Size winSize, int step) {
  Path path = new Path();

  for (int i = 0; i < winSize.height / step + 1; i++) {
    path.moveTo(0, step * i.toDouble());
    path.lineTo(winSize.width, step * i.toDouble());
  }

  for (int i = 0; i < winSize.width / step + 1; i++) {
    path.moveTo(step * i.toDouble(), 0);
    path.lineTo(step * i.toDouble(), winSize.height);
  }
  return path;
}

/**
 * 坐标系路径
 *
 * @param coo     坐标点
 * @param winSize 屏幕尺寸
 * @return 坐标系路径
 */
Path cooPath(Size coo, Size winSize) {
  Path path = new Path();
  //x正半轴线
  path.moveTo(coo.width, coo.height);
  path.lineTo(winSize.width, coo.height);
  //x负半轴线
  path.moveTo(coo.width, coo.height);
  path.lineTo(coo.width - winSize.width, coo.height);
  //y负半轴线
  path.moveTo(coo.width, coo.height);
  path.lineTo(coo.width, coo.height - winSize.height);
  //y负半轴线
  path.moveTo(coo.width, coo.height);
  path.lineTo(coo.width, winSize.height);
  return path;
}
