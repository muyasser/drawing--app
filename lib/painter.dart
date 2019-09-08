import 'package:flutter/material.dart';

class AppPainter extends CustomPainter {
  final List<Offset> _points;

  AppPainter(this._points);

  @override
  bool shouldRepaint(AppPainter oldDelegate) {
    print('INFO : shouldrepaint called!');
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print('INFO :  paint called');
    final Paint paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    for (int i = 0; i < _points.length; i++)
      if (_points[i] != null && _points[i + 1] != null)
        canvas.drawLine(_points[i], _points[i + 1], paint);
  }
}
