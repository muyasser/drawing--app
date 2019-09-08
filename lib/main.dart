import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'painter.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SketchApp(),
  ));
}

class SketchApp extends StatefulWidget {
  @override
  _SketchAppState createState() => _SketchAppState();
}

class _SketchAppState extends State<SketchApp> {
  final List<Offset> _points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SketchApp'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          RenderBox box = context.findRenderObject() as RenderBox;
          Offset point = box.globalToLocal(details.globalPosition);
          point = point.translate(0.0, -AppBar().preferredSize.height);
          setState(() {
            _points.add(point);
          });
        },
        onPanEnd: (details) {
          setState(() {
            _points.add(null);
          });
        },
        child: CustomPaint(
          painter: AppPainter(_points),
          child: Container(
              //width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Clear screen',
        child: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            _points.clear();
          });
        },
      ),
    );
  }
}
