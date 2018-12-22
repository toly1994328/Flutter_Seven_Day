import 'dart:ui';

import 'package:toly/helper/common_path.dart';

//绘制网格
drawGrid(Canvas canvas, Size winSize, [int step = 20, int color = 0xff06BDF8]) {
  var paint = new Paint();
  paint.style = PaintingStyle.stroke;
  paint.color = Color(color);
  paint.isAntiAlias = true;
  canvas.drawPath(gridPath(winSize, step), paint);
}

//绘制坐标系
drawCoo(Canvas canvas, Size coo, Size winSize) {
  //初始化网格画笔
  Paint paint = new Paint();
  paint.strokeWidth = 2;
  paint.style = PaintingStyle.stroke;

  //绘制直线
  canvas.drawPath(cooPath(coo, winSize), paint);
  //左箭头
  canvas.drawLine(new Offset(winSize.width, coo.height),
      new Offset(winSize.width - 10, coo.height - 6), paint);
  canvas.drawLine(new Offset(winSize.width, coo.height),
      new Offset(winSize.width - 10, coo.height + 6), paint);
  //下箭头
  canvas.drawLine(new Offset(coo.width, winSize.height-90),
      new Offset(coo.width - 6, winSize.height - 10-90), paint);
  canvas.drawLine(new Offset(coo.width, winSize.height-90),
      new Offset(coo.width + 6, winSize.height - 10-90), paint);
}
